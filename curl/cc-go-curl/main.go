package main

import (
	"curl/internal/http"
	"fmt"
	"io"
	"log"
	"os"

	"github.com/spf13/pflag"
)

var (
	flagVerbose = pflag.BoolP("verbose", "v", false, "Make the operation more talkative")
	flagHeaders = pflag.StringToStringP("header", "H", nil, "Pass custom header(s) to server")
	flagMethod  = pflag.StringP("request", "X", "GET", "Request method to use")
)

func main() {
	pflag.Parse()
	log.SetFlags(0)
	if !*flagVerbose {
		log.SetOutput(io.Discard)
	}
	rawURL := pflag.Arg(0)
	if rawURL == "" {
		log.Fatalf("try 'curl --help' for more information")
	}
	url, err := http.ParseURL(rawURL)
	if err != nil {
		log.Fatalf("parse error: %v", err)
	}
	req := http.NewRequest(*flagMethod, url, nil)
	resp, err := http.Do(req)
	if err != nil {
		log.Fatalf("http.Do error: %v", err)
	}
	fmt.Fprintf(os.Stdout, "%s", resp.Body)
}
