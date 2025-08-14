package main

import (
	"bufio"
	"flag"
	"fmt"
	"gotar/internal/tar"
	"io"
	"os"
)

var (
	flagFile = flag.String("f", "", "file to read")
	flagList = flag.Bool("t", false, "list files in archive")
)

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

	p := tar.NewReader()
	r := bufio.NewReader(file)
	buf := make([]byte, 0, 512)

	for !p.Done() {
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

		err = p.Next(buf)
		if err != nil {
			fmt.Fprintf(os.Stderr, "tar: Error processing block: %v\n", err)
			break
		}
	}

	files := p.Result()

	if *flagList {
		for _, file := range files {
			fmt.Println(file.Name)
		}
	} else {
		for _, file := range files {
			fmt.Printf("== %s ==\n%s\n\n", file.Name, file.Content)
		}
	}
}
