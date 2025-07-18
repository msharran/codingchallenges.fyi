package tar

import (
	"bytes"
	"fmt"
	"strconv"
	"strings"
)

// EmptyBlock is an empty byte array of
// 512 byte size as per tar manpage.
// This acts as a terminator
var EmptyBlock = make([]byte, 512)

type State int

const (
	StateHeaderKind State = iota
	StateContentKind
	StateComplete
	StateError
)

type File struct {
	Name    string
	Content string
}

type Parser struct {
	// the current state of the parser
	state State

	// the current file, it accumulates
	file File

	files                  []File
	remainingContentBlocks int64
	emptyBlockCount        int
}

func NewParser() *Parser {
	return &Parser{
		state:           StateHeaderKind,
		files:           make([]File, 0),
		emptyBlockCount: 0,
	}
}

func (p *Parser) Result() []File {
	return p.files
}

func (p *Parser) Done() bool {
	return p.state == StateComplete || p.state == StateError
}

// Next processes the next block
// and progresses the parser state.
func (p *Parser) Next(block []byte) error {
	switch p.state {
	case StateHeaderKind:
		if bytes.Equal(block, EmptyBlock) {
			p.emptyBlockCount++
			if p.emptyBlockCount >= 2 {
				p.state = StateComplete
			}
			return nil
		}

		p.emptyBlockCount = 0
		name, size, isValid := parseHeader(block)
		if !isValid {
			p.state = StateError
			return fmt.Errorf("invalid header")
		}

		p.file = File{Name: name}
		p.remainingContentBlocks = (size + 511) / 512

		if p.remainingContentBlocks > 0 {
			p.state = StateContentKind
		} else {
			p.files = append(p.files, p.file)
		}

	case StateContentKind:
		if bytes.Equal(block, EmptyBlock) {
			p.state = StateError
			return fmt.Errorf("unexpected empty block while reading content")
		}

		p.file.Content += string(block)
		p.remainingContentBlocks--

		if p.remainingContentBlocks == 0 {
			p.file.Content = strings.TrimRight(p.file.Content, "\x00")
			p.files = append(p.files, p.file)
			p.state = StateHeaderKind

			// reset the current file state
			p.file = File{}
		}

	case StateComplete, StateError:
		return fmt.Errorf("parser already stopped")
	}

	return nil
}

func parseHeader(block []byte) (string, int64, bool) {
	if bytes.Equal(block, EmptyBlock) {
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
