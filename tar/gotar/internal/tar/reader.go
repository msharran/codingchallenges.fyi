package tar

import (
	"bytes"
	"fmt"
	"io"
	"strconv"
	"strings"
)

type block [512]byte

var zeroBlock block

type State int

const (
	StateHeader State = iota
	StateContent
	StateComplete
	StateError
)

type Event int

type Header struct {
	Name string
}

type Parser struct {
	// tr is the tarball to be read
	tr io.Reader

	// the current state of the parser
	state State

	// current file and files parsed till
	// the most recent Next()
	file  Header
	files []Header

	// buffer to store the parsed content,
	// accumulates over time. Useful when
	// showing error
	buf []block

	// curr contains currently read block
	curr                   block
	remainingContentBlocks int64
	emptyBlockCount        int
}

func NewParser(tarball io.Reader) *Parser {
	return &Parser{
		tr:              tarball,
		state:           StateHeader,
		files:           make([]Header, 0),
		emptyBlockCount: 0,
	}
}

// TODO: move blk to p.blk
// returns EOF err if the tar reached end of file
func (p *Parser) Next() (*Header, error) {
	// read a `block` into p.curr

	buf := block{}
	n, err := io.ReadFull(p.tr, buf[:])
	if err != nil {
		// err can be EOF here if no bytes
		// were read
		return nil, err
	}

	if n != 512 {
		return nil, fmt.Errorf("expected 512 bytes, but got %d", n)
	}

	return nil
}

func parseHeader(blk []byte) (string, int64, bool) {
	if bytes.Equal(blk, zeroBlock[:]) {
		return "", 0, false
	}

	nameBytes := blk[0:100]
	nameEnd := bytes.IndexByte(nameBytes, 0)
	if nameEnd == -1 {
		nameEnd = 100
	}
	name := string(nameBytes[:nameEnd])

	sizeBytes := blk[124:136]
	sizeEnd := bytes.IndexByte(sizeBytes, 0)
	if sizeEnd == -1 {
		sizeEnd = 12
	}
	sizeStr := strings.TrimSpace(string(sizeBytes[:sizeEnd]))

	size, err := strconv.ParseInt(sizeStr, 8, 64)
	if err != nil {
		return "", 0, false
	}

	return name, size, true
}
