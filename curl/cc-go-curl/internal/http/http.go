package http

import (
	"bytes"
	"fmt"
	"io"
	"log"
	"net"
)

func Do(r *Request) (*Response, error) {
	reqb, err := writeWireFormat(r)
	if err != nil {
		return nil, fmt.Errorf("writeWireFormat error: %v", err)
	}

	ip, err := net.ResolveIPAddr("ip", r.URL.Host)
	if err != nil {
		log.Fatalf("unable to resolve IP address: %v", err)
	}
	log.Printf("* Trying %s...", ip.IP.String())

	conn, err := net.Dial("tcp", r.Addr())
	if err != nil {
		return nil, fmt.Errorf("tcp dial error: %v", err)
	}
	defer conn.Close()

	log.Printf("* Connected to %s (%s) port %s", r.URL.Host, ip.IP.String(), r.URL.Port)
	log.Printf("%s", r)

	_, err = io.Copy(conn, reqb)
	if err != nil {
		return nil, fmt.Errorf("conn write error: %v", err)
	}

	respb := new(bytes.Buffer)
	_, err = io.Copy(respb, conn)
	if err != nil {
		return nil, fmt.Errorf("conn read error: %v", err)
	}

	resp, err := readWireFormat(respb)
	if err != nil {
		return nil, fmt.Errorf("readWireFormat error: %v", err)
	}
	log.Printf("%s", resp)
	log.Printf("* Connection #0 to host %s left intact", r.URL.Host)

	return resp, nil
}
