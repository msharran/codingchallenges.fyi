package http

import (
	"errors"
	"fmt"
	"io"
	"strings"
)

type Response struct {
	HTTPVersion string
	Headers     Headers
	Body        io.Reader
	StatusCode  int
	StatusText  string
}

// Response errors
var (
	ErrEmptyFirstLine   = errors.New("response: first line is empty")
	ErrInvalidFirstLine = errors.New("response: first line is invalid")
	ErrHTTPCodeParse    = errors.New("response: failed to parse status code")
)

func (r *Response) String() string {
	sb := new(strings.Builder)

	fmt.Fprintf(sb, "< %s %d %s%s", r.HTTPVersion, r.StatusCode, r.StatusText, CRLF)
	h := r.Headers
	for k, v := range h {
		fmt.Fprintf(sb, "< %s: %s%s", k, v, CRLF)
	}
	fmt.Fprintf(sb, "<%s", CRLF)
	return sb.String()
}
