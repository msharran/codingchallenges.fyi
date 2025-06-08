package main

import (
	"bufio"
	"bytes"
	"flag"
	"fmt"
	"io"
	"os"
)

var (
	flagFile = flag.String("f", "", "file to read")
)

var empty512bBlock = make([]byte, 512)

func main() {
	flag.Parse()

	var file io.Reader
	if *flagFile != "" {
		file, err := os.Open(*flagFile)
		if err != nil {
			fmt.Fprintf(os.Stderr, "tar: Error opening archive: Failed to open %q\n", *flagFile)
			return
		}
		defer file.Close()
	} else {
		file = os.Stdin
	}

	r := bufio.NewReader(file)
	buf := make([]byte, 512)

	emptyBlock := 0
	for {
		n, err := io.ReadFull(r, buf)
		if err == io.EOF {
			// EOF is only reached after few empty 512 byte blocks.
			// This is actual archive EOF
			fmt.Fprintln(os.Stderr, "End of file reached")
			break
		}
		if err != nil {
			fmt.Fprintf(os.Stderr, "tar: Error reading archive: %v\n", err)
			break
		}

		// here, read buf will always be eq to len(buf)
		fmt.Printf("Read %d bytes\n%q\n------------\n", n, string(buf))
		if bytes.Equal(buf, empty512bBlock) {
			emptyBlock++
		}

		if emptyBlock == 2 {
			// actual tar EOF
			fmt.Fprintln(os.Stderr, "End of archive reached")
			break
		}
	}

}

func readNext(r io.Reader, buf []byte) (n int, err error) {
	var emptyBlock int
	for {
		n, err = io.ReadFull(r, buf)

		// check for EOF (unlikely since 2 empty 512 blocks represent EOF in tar. This is just in case)
		if err == io.EOF {
			return 0, io.EOF
		}

		if err != nil {
			return 0, fmt.Errorf("error reading archive: %v", err)
		}

		// here, read buf will always be eq to len(buf)
		fmt.Printf("Read %d bytes\n%q\n------------\n", n, string(buf))
		if bytes.Equal(buf, empty512bBlock) {
			emptyBlock++
		}

		if emptyBlock == 2 {
			// actual tar EOF
			fmt.Fprintln(os.Stderr, "End of archive reached")
			break
		}
	}
}
