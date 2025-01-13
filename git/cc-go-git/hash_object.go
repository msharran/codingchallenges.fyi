package main

import (
	"context"
	"fmt"
	"log"
	"os"
	"path/filepath"

	"git/internal/object"

	"github.com/urfave/cli/v3"
)

func hashObjectCmd() *cli.Command {
	return &cli.Command{
		Name:    "hash-object",
		Aliases: []string{"hash"},
		Flags: []cli.Flag{
			&cli.BoolFlag{
				Name:  "stdin",
				Usage: "Read the object from standard input instead of from a file",
			},
			&cli.BoolFlag{
				Name:    "write",
				Usage:   "Actually write the object into the object database",
				Aliases: []string{"w"},
			},
		},
		Usage: "Compute object ID and optionally creates a blob from a file",
		Before: func(ctx context.Context, cmd *cli.Command) (context.Context, error) {
			if !isGitRepository() {
				return ctx, ErrNotGitRepository
			}
			return ctx, nil
		},
		Action: func(ctx context.Context, cmd *cli.Command) error {
			// cwd, err := os.Getwd()
			// if err != nil {
			// 	return fmt.Errorf("failed to get current working directory: %w", err)
			// }

			s := "foo"
			hashstr, content, err := object.GetHash(object.ObjectTypeBlob, s)
			if err != nil {
				return fmt.Errorf("failed to generate sha1 hash: %w", err)
			}
			log.Printf("hash: %s, content: %s\n", hashstr, content)

			// print first 2 characters of the hash
			// used as directory name
			// rest of the hash is used as file name
			dir := filepath.Join(".git", "objects", hashstr[:2])
			log.Printf("dir: %s\n", dir)
			if err := os.MkdirAll(dir, 0755); err != nil {
				return fmt.Errorf("failed to create directory: %w", err)
			}

			// create a file with the rest of the hash as name
			// and write the content of the file to it
			f, err := os.Create(filepath.Join(dir, hashstr[2:]))
			if err != nil {
				return fmt.Errorf("failed to create object file: %w", err)
			}
			defer f.Close()
			log.Printf("file: %s\n", f.Name())

			if err := object.Write(f, content); err != nil {
				return fmt.Errorf("failed to write compressed data: %w", err)
			}

			fmt.Printf("%s\n", hashstr)

			return nil
		},
	}
}

func isGitRepository() bool {
	_, err := os.Stat(".git")
	return !os.IsNotExist(err)
}
