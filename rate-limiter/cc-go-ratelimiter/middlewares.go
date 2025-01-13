package main

import (
	"fmt"
	"net/http"
	"strings"
)

func RegisterIPMiddleware(next http.Handler, rtlim *RateLimitter) http.HandlerFunc {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		// get the token for the user
		if !strings.Contains(r.RemoteAddr, ":") {
			http.Error(w, "invalid remote addr format: unable to detect IP from remote addr", http.StatusBadRequest)
			return
		}

		ip := strings.Split(r.RemoteAddr, ":")[0]
		fmt.Printf("rl %+v\n", rtlim)
		rtlim.registerNewUser(ip)
		next.ServeHTTP(w, r)
	})
}

func LimitMiddleware(next http.Handler, lim *RateLimitter) http.HandlerFunc {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		// get the token for the user
		if !strings.Contains(r.RemoteAddr, ":") {
			http.Error(w, "invalid remote addr format: unable to detect IP from remote addr", http.StatusBadRequest)
			return
		}

		ip := strings.Split(r.RemoteAddr, ":")[0]
		if !lim.consume(ip) {
			http.Error(w, "rate limit exceeded", http.StatusTooManyRequests)
			return
		}

		next.ServeHTTP(w, r)
	})
}
