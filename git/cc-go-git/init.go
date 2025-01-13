package main

import (
	"context"
	"fmt"
	"os"

	"github.com/urfave/cli/v3"
)

func initCmd() *cli.Command {
	return &cli.Command{
		Name:    "init",
		Aliases: []string{"i"},
		Usage:   "init a new repository",
		Action: func(ctx context.Context, cmd *cli.Command) error {
			cwd, err := os.Getwd()
			if err != nil {
				return fmt.Errorf("failed to get current working directory: %w", err)
			}

			// create .git/object database directory and its subdirectories
			if err := os.MkdirAll(fmt.Sprintf("%s/.git/objects/info", cwd), 0755); err != nil {
				return fmt.Errorf("failed to create .git/objects directory: %w", err)
			}

			if err := os.Mkdir(fmt.Sprintf("%s/.git/objects/pack", cwd), 0755); err != nil {
				return fmt.Errorf("failed to create .git/objects/pack directory: %w", err)
			}

			// create HEAD, config, description files
			// and refs, info, hooks directories

			if err := os.WriteFile(fmt.Sprintf("%s/.git/HEAD", cwd), []byte("ref: refs/heads/main\n"), 0644); err != nil {
				return fmt.Errorf("failed to create .git/HEAD file: %w", err)
			}

			if err := os.WriteFile(fmt.Sprintf("%s/.git/config", cwd), []byte("[core]\n\trepositoryformatversion = 0\n\tfilemode = true\n\tbare = false\n\tlogallrefupdates = true\n"), 0644); err != nil {
				return fmt.Errorf("failed to create .git/config file: %w", err)
			}

			if err := os.WriteFile(fmt.Sprintf("%s/.git/description", cwd), []byte("Unnamed repository; edit this file 'description' to name the repository.\n"), 0644); err != nil {
				return fmt.Errorf("failed to create .git/description file: %w", err)
			}

			if err := os.Mkdir(fmt.Sprintf("%s/.git/refs", cwd), 0755); err != nil {
				return fmt.Errorf("failed to create .git/refs directory: %w", err)
			}

			if err := os.Mkdir(fmt.Sprintf("%s/.git/info", cwd), 0755); err != nil {
				return fmt.Errorf("failed to create .git/info directory: %w", err)
			}

			if err := os.Mkdir(fmt.Sprintf("%s/.git/hooks", cwd), 0755); err != nil {
				return fmt.Errorf("failed to create .git/hooks directory: %w", err)
			}

			fmt.Printf("Initialized empty git repository in %s/.git/\n", cwd)
			return nil
		},
	}
}
