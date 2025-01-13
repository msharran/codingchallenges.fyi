package main

import (
	"bufio"
	"fmt"
	"io"
	"os"
	"strconv"
	"strings"

	flag "github.com/spf13/pflag"
)

var (
	flagFieldPos []string
	flagDelim    string
)

func init() {
	flag.StringSliceVarP(&flagFieldPos, "fields", "f", nil, `The list specifies fields, separated in the input by the field delimiter 
	character (see the -d option).  Output fields are separated by a single occurrence of the field delimiter character`)
	flag.StringVarP(&flagDelim, "delimiter", "d", "\t", "Use delim as the field delimiter character instead of the tab character")
}

func main() {
	flag.Parse()
	os.Exit(run())
}

func run() int {
	file := flag.Arg(0)

	if flag.NFlag() == 0 {
		return handleErr(nil)
	}

	var r io.Reader
	if file != "" {
		f, err := os.Open(file)
		if err != nil {
			return handleErr(err)
		}
		defer f.Close()
		r = f
	} else {
		r = os.Stdin
	}

	if err := scan(r, func(line string) error {
		return cut(line, flagDelim)
	}); err != nil {
		return handleErr(err)
	}
	return 0
}

func handleErr(err error) int {
	if err != nil {
		fmt.Fprintf(os.Stderr, "cut: %v\n", err)
	}
	flag.Usage()
	return 1
}

func scan(r io.Reader, fn func(line string) error) error {
	scanner := bufio.NewScanner(r)
	for scanner.Scan() {
		if err := fn(scanner.Text()); err != nil {
			return err
		}
	}
	if err := scanner.Err(); err != nil {
		return err
	}
	return nil
}

func cut(line string, del string) error {
	fields := strings.Split(line, del)
	for i, p := range flagFieldPos {
		pos, err := strconv.Atoi(p)
		if err != nil {
			return err
		}

		pos -= 1

		if pos < 0 {
			return fmt.Errorf("[-bcf] list: values may not include zero")
		}

		if pos >= len(fields) {
			fmt.Print()
		} else {
			fmt.Printf("%s", fields[pos])
		}
		if i == len(flagFieldPos)-1 {
			fmt.Printf("\n")
		} else {
			fmt.Printf(flagDelim)
		}
	}
	return nil
}
