package main

import (
	"bytes"
	"compress/zlib"
	"context"
	"fmt"
	"io"
	"os"

	"github.com/urfave/cli/v3"
)

func catFileCmd() *cli.Command {
	return &cli.Command{
		Name:    "cat-file",
		Aliases: []string{"cat"},
		Usage:   "cat an object",
		Action: func(ctx context.Context, cmd *cli.Command) error {
			// read a file from stdin,
			// decompress using zlib
			// and print the content.

			stdinContent, err := os.ReadFile("/dev/stdin")
			if err != nil {
				return fmt.Errorf("failed to read from stdin: %w", err)
			}

			content, err := zlibDecompress(stdinContent)
			if err != nil {
				return fmt.Errorf("failed to decompress content: %w", err)
			}

			fmt.Println(string(content))

			return nil
		},
	}
}

func zlibDecompress(content []byte) ([]byte, error) {
	buf := bytes.NewBuffer(content)
	r, err := zlib.NewReader(buf)
	if err != nil {
		return nil, fmt.Errorf("failed to create zlib reader: %w", err)
	}

	var decompressed bytes.Buffer
	if _, err := io.Copy(&decompressed, r); err != nil {
		return nil, fmt.Errorf("failed to decompress content: %w", err)
	}

	return decompressed.Bytes(), nil
}
