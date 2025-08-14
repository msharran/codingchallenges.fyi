package tar

import (
	"archive/tar"
	"bytes"
	"io"
	"testing"
)

func TestNext(t *testing.T) {
	// Create a tar archive in memory for testing
	var buf bytes.Buffer
	tw := tar.NewWriter(&buf)

	// File 1
	file1Name := "file1.txt"
	file1Content := "This is the content of file1."
	hdr1 := &tar.Header{
		Name: file1Name,
		Mode: 0600,
		Size: int64(len(file1Content)),
	}
	if err := tw.WriteHeader(hdr1); err != nil {
		t.Fatalf("failed to write header for %s: %v", file1Name, err)
	}
	if _, err := tw.Write([]byte(file1Content)); err != nil {
		t.Fatalf("failed to write content for %s: %v", file1Name, err)
	}

	// Close the writer to add padding and end-of-archive blocks
	if err := tw.Close(); err != nil {
		t.Fatalf("failed to close tar writer: %v", err)
	}

	// Create a parser with the tar data
	p := NewReader(&buf)

	// Call Next() to parse the first file
	file, err := p.Next()
	if err != nil {
		t.Fatalf("p.Next() returned an error: %v", err)
	}

	if file == nil {
		t.Fatalf("p.Next() returned a nil file")
	}

	if file.Name != file1Name {
		t.Errorf("expected file name %q, but got %q", file1Name, file.Name)
	}

	if file.Content != file1Content {
		t.Errorf("expected file content %q, but got %q", file1Content, file.Content)
	}

	// Call Next() again, should be EOF or a specific "end of archive" indicator
	_, err = p.Next()
	if err != io.EOF {
		t.Errorf("expected io.EOF on second call to p.Next(), but got %v", err)
	}
}
