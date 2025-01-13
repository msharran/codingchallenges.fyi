package main

import (
	"fmt"
	"net/http"
	"time"
)

func limitedHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "limited")
}

func unlimitedHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "unlimited")
}

func main() {
	rtlim := NewRateLimitter(5)

	go func() {
		for {
			rtlim.backfill()
			fmt.Printf("added token to all users:\n")
			for k, v := range rtlim.tokens {
				fmt.Printf("ip: %s, tokens: %d\n", k, len(v))
			}
			time.Sleep(5 * time.Second)
		}
	}()

	mux := http.NewServeMux()
	mux.HandleFunc("/limited", RegisterIPMiddleware(LimitMiddleware(http.HandlerFunc(limitedHandler), rtlim), rtlim))
	mux.HandleFunc("/unlimited", unlimitedHandler)

	http.ListenAndServe("localhost:3000", mux)
}
