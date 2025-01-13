package http

import (
	"bufio"
	"bytes"
	"fmt"
	"io"
	"strings"
)

const (
	CRLF        = "\r\n"
	HttpVersion = "HTTP/1.1"
)

func readWireFormat(buf *bytes.Buffer) (*Response, error) {
	// parse http response in wire format to Response struct
	resp := new(Response)
	resp.Headers = make(Headers)
	body := new(bytes.Buffer)
	resp.Body = body

	scanner := bufio.NewScanner(buf)
	if !scanner.Scan() && scanner.Err() != nil {
		return nil, fmt.Errorf("failed to read first line: %v", scanner.Err())
	}

	firstLine := scanner.Text()
	_, err := fmt.Sscanf(firstLine, "%s %d %s", &resp.HTTPVersion, &resp.StatusCode, &resp.StatusText)
	if err != nil {
		return nil, fmt.Errorf("failed to parse first line: %v", err)
	}

	if resp.HTTPVersion != HttpVersion {
		return nil, fmt.Errorf("unsupported HTTP version: %s", resp.HTTPVersion)
	}

	// parse headers
	for scanner.Scan() {
		line := scanner.Text()

		if line == "" {
			break
		}

		k, v, found := strings.Cut(line, ":")
		if !found {
			return nil, fmt.Errorf("malformed header: %s", line)
		}

		resp.Headers.Set(k, v)
	}

	// parse body
	for scanner.Scan() {
		line := scanner.Text()
		if line == "" {
			break
		}

		_, err := io.WriteString(body, line)
		if err != nil {
			return nil, fmt.Errorf("failed to write body: %v", err)
		}
	}

	if err := scanner.Err(); err != nil {
		return nil, fmt.Errorf("scanner error: %v", err)
	}

	return resp, nil
}

func writeWireFormat(req *Request) (*bytes.Buffer, error) {
	buf := new(bytes.Buffer)
	_, err := fmt.Fprintf(buf, "%s %s %s%s", req.Method, req.URL.Path, HttpVersion, CRLF)
	if err != nil {
		return nil, err
	}

	_, err = fmt.Fprintf(buf, "Host: %s%s", req.URL.Host, CRLF)
	if err != nil {
		return nil, err
	}

	for k, v := range req.Headers {
		_, err = fmt.Fprintf(buf, "%s: %s%s", k, v, CRLF)
		if err != nil {
			return nil, err
		}
	}

	_, err = fmt.Fprintf(buf, "Connection: close%s", CRLF)
	if err != nil {
		return nil, err
	}
	_, err = io.WriteString(buf, CRLF)
	if err != nil {
		return nil, err
	}

	if req.Body != nil {
		_, err = io.Copy(buf, req.Body)
		if err != nil {
			return nil, err
		}
	}

	_, err = io.WriteString(buf, CRLF)
	if err != nil {
		return nil, err
	}
	return buf, nil
}
