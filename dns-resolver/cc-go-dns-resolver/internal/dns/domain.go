package dns

import (
	"encoding/binary"
	"fmt"
	"strings"
)

func encodeDomain(domain string) ([]byte, error) {
	parts := strings.Split(string(domain), ".")
	if len(parts) == 0 {
		return nil, fmt.Errorf("invalid domain name, missing dot in %s", domain)
	}

	b := make([]byte, 0, len(domain)+len(parts)+1)
	for _, p := range parts {
		b = append(b, byte(len(p)))
		b = append(b, []byte(p)...)
	}
	b = append(b, 0x00)
	return b, nil
}

// decodeDomain reads a domain name from buffer b
// Returns the domain name d, no. of bytes read n
// and error if any
//
// Example:
//
//	3dns6google3com0 -> dns.google.com
//
// Compression logic as per RFC
// The compression scheme allows a domain name in a message to be
// represented as either:
//   - a sequence of labels ending in a zero octet
//   - a pointer
//   - a sequence of labels ending with a pointer
func decodeDomain(b []byte, ptr int) (string, int, error) {
	var d string
	for {
		// if first 2 bits are pointer `11`,
		// get the domain location from offset
		// Message compression: https://datatracker.ietf.org/doc/html/rfc1035#section-4.1.4
		if isDomainPtr(b[ptr : ptr+2]) {
			offset, err := domainPtrOffset(b[ptr : ptr+2])
			if err != nil {
				return "", 0, err
			}

			d, _, err := decodeDomain(b, int(offset))
			if err != nil {
				return "", 0, err
			}
			ptr += 2
			return d, ptr, nil
		}

		partCount := int(b[ptr])
		ptr += 1 // read 1 byte

		if partCount == 0 {
			break
		}

		if partCount >= len(b) {
			return "", 0, fmt.Errorf("invalid Qname: partCount[%d] >= len(qname)[%d]", partCount, len(b))
		}

		d += string(b[ptr:ptr+partCount]) + "."
		ptr += partCount // read `count` bytes
	}

	d = strings.TrimSuffix(d, ".")
	return d, ptr, nil
}

func isDomainPtr(b []byte) bool {
	if len(b) != 2 { // pointer is always 2 octet
		return false
	}
	mask := uint16(0b1100000000000000)
	pointer := binary.BigEndian.Uint16(b)
	return pointer&mask == mask // first 2 bits of pointer is always `11`
}

func domainPtrOffset(b []byte) (uint16, error) {
	if len(b) != 2 { // pointer is always 2 octet
		return 0, fmt.Errorf("unable to get pointer offset: len(pointer)[%d] != 2", len(b))
	}
	mask := uint16(0b0011111111111111)
	pointer := binary.BigEndian.Uint16(b)
	return pointer & mask, nil
}
