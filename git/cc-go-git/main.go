package main

import (
	"context"
	"fmt"
	"log"
	"os"

	"github.com/urfave/cli/v3"
)

var (
	ErrNotGitRepository = fmt.Errorf("not a git repository")
)

func main() {
	// setup log to only print the message and not the timestamp
	log.SetFlags(0)

	cmd := &cli.Command{
		Name:  "git",
		Usage: "A git clone - VCS tool",
		Commands: []*cli.Command{
			initCmd(),
			hashObjectCmd(),
			catFileCmd(),
		},
	}

	if err := cmd.Run(context.Background(), os.Args); err != nil {
		log.Fatal(err)
	}
}
