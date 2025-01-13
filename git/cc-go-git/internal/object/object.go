package object

import (
	"bytes"
	"compress/zlib"
	"crypto/sha1"
	"fmt"
	"io"
)

type ObjectType int

const (
	ObjectTypeBlob ObjectType = iota
)

func GetHash(otype ObjectType, s string) (hashstr string, content string, err error) {
	switch otype {
	case ObjectTypeBlob:
		// define header, append with content and hash it
		content := fmt.Sprintf("blob %d\000%s", len(s), s)
		h := sha1.New()
		io.WriteString(h, content)
		return fmt.Sprintf("%x", h.Sum(nil)), content, nil
	default:
		return "", "", fmt.Errorf("unsupported object type: %d", otype)
	}
}

func Write(w io.Writer, o string) error {
	// zlib compression
	var b bytes.Buffer
	z := zlib.NewWriter(&b)
	if _, err := z.Write([]byte(o)); err != nil {
		return fmt.Errorf("failed to write to zlib writer: %w", err)
	}
	if err := z.Close(); err != nil {
		return fmt.Errorf("failed to close zlib writer: %w", err)
	}

	// write compressed data to writer
	_, err := w.Write(b.Bytes())
	if err != nil {
		return fmt.Errorf("failed to write to writer: %w", err)
	}
	return nil
}
