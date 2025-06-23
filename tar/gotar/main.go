package main

import (
	"bufio"
	"bytes"
	"flag"
	"fmt"
	"io"
	"os"
	"strconv"
	"strings"
)

type ParserState int

const (
	ReadingHeader ParserState = iota
	ReadingContent
	Stopped
	Error
)

type File struct {
	Name    string
	Content string
}

type Parser struct {
	state                  ParserState
	remainingContentBlocks int64
	currentFile            File
	files                  []File
	emptyBlockCount        int
}

var (
	flagFile = flag.String("f", "files2.tar", "file to read")
	flagList = flag.Bool("t", false, "list files in archive")
)

var empty512ByteBlock = make([]byte, 512)

func NewParser() *Parser {
	return &Parser{
		state:           ReadingHeader,
		files:           make([]File, 0),
		emptyBlockCount: 0,
	}
}

func (p *Parser) Files() []File {
	return p.files
}

func (p *Parser) IsComplete() bool {
	return p.state == Stopped || p.state == Error
}

func parseHeader(block []byte) (string, int64, bool) {
	if bytes.Equal(block, empty512ByteBlock) {
		return "", 0, false
	}

	nameBytes := block[0:100]
	nameEnd := bytes.IndexByte(nameBytes, 0)
	if nameEnd == -1 {
		nameEnd = 100
	}
	name := string(nameBytes[:nameEnd])

	sizeBytes := block[124:136]
	sizeEnd := bytes.IndexByte(sizeBytes, 0)
	if sizeEnd == -1 {
		sizeEnd = 12
	}
	sizeStr := strings.TrimSpace(string(sizeBytes[:sizeEnd]))

	size, err := strconv.ParseInt(sizeStr, 8, 64)
	if err != nil {
		return "", 0, false
	}

	return name, size, true
}

func (p *Parser) ProcessBlock(block []byte) error {
	switch p.state {
	case ReadingHeader:
		if bytes.Equal(block, empty512ByteBlock) {
			p.emptyBlockCount++
			if p.emptyBlockCount >= 2 {
				p.state = Stopped
			}
			return nil
		}

		p.emptyBlockCount = 0
		name, size, isValid := parseHeader(block)
		if !isValid {
			p.state = Error
			return fmt.Errorf("invalid header")
		}

		p.currentFile = File{Name: name}
		p.remainingContentBlocks = (size + 511) / 512

		if p.remainingContentBlocks > 0 {
			p.state = ReadingContent
		} else {
			p.files = append(p.files, p.currentFile)
		}

	case ReadingContent:
		if bytes.Equal(block, empty512ByteBlock) {
			p.state = Error
			return fmt.Errorf("unexpected empty block while reading content")
		}

		p.currentFile.Content += string(block)
		p.remainingContentBlocks--

		if p.remainingContentBlocks == 0 {
			p.currentFile.Content = strings.TrimRight(p.currentFile.Content, "\x00")
			p.files = append(p.files, p.currentFile)
			p.state = ReadingHeader
		}

	case Stopped, Error:
		return fmt.Errorf("parser already stopped")
	}

	return nil
}

func main() {
	flag.Parse()

	var file io.Reader
	if *flagFile != "" {
		f, err := os.Open(*flagFile)
		if err != nil {
			fmt.Fprintf(os.Stderr, "tar: Error opening archive: Failed to open %q\n", *flagFile)
			return
		}
		defer f.Close()
		file = f
	} else {
		file = os.Stdin
	}

	parser := NewParser()
	r := bufio.NewReader(file)
	buf := make([]byte, 512)

	for !parser.IsComplete() {
		n, err := io.ReadFull(r, buf)
		if err == io.EOF {
			fmt.Fprintln(os.Stderr, "End of file reached")
			break
		}
		if err != nil {
			fmt.Fprintf(os.Stderr, "tar: Error reading archive: %v\n", err)
			break
		}

		if n != 512 {
			fmt.Fprintf(os.Stderr, "tar: Expected 512 bytes, got %d\n", n)
			break
		}

		err = parser.ProcessBlock(buf)
		if err != nil {
			fmt.Fprintf(os.Stderr, "tar: Error processing block: %v\n", err)
			break
		}
	}

	files := parser.Files()

	if *flagList {
		for _, file := range files {
			fmt.Println(file.Name)
		}
	} else {
		for _, file := range files {
			fmt.Printf("File: %s\nContent:\n%s\n------------\n", file.Name, file.Content)
		}
	}
}
