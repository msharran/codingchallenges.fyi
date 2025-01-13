package http

import (
	"fmt"
	"io"
	"strings"
)

func NewRequest(method string, url *URL, body io.Writer) *Request {
	if url == nil {
		panic("NewRequest: url cannot be nil")
	}

	r := &Request{
		URL:    url,
		Method: method,
		Body:   nil,
	}
	r.Headers = Headers{
		"Host":       url.Host,
		"Accept":     "*/*",
		"Connection": "close",
	}

	return r
}

type Request struct {
	URL     *URL
	Method  string
	Headers Headers
	Body    io.Reader
}

func (r *Request) Addr() string {
	return r.URL.Host + ":" + r.URL.PortOrDefault()
}

func (r *Request) String() string {
	sb := new(strings.Builder)

	fmt.Fprintf(sb, "> %s %s %s%s", r.Method, r.URL.Path, HttpVersion, CRLF)
	h := r.Headers
	for k, v := range h {
		fmt.Fprintf(sb, "> %s: %s%s", k, v, CRLF)
	}
	fmt.Fprintf(sb, ">%s", CRLF)
	return sb.String()
}
