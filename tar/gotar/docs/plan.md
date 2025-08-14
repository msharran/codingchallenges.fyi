# Refactoring `internal/tar/parser.go` with a Clearer FSM

This plan outlines a refactoring of the `tar` parser to use a more explicit and robust Finite State Machine (FSM), inspired by the Zig OSC parser implementation. The goal is to make the parser's state transitions clearer and eliminate ambiguity.

### 1. Introduce More Explicit States

The current `State` enum is too broad. We will replace it with a more granular set of states that precisely define what the parser is expecting at each step. This removes the need for secondary state-tracking fields like `emptyBlockCount`.

**New `State` enum:**

```go
type State int

const (
    // StateExpectHeader: The parser is expecting a header block. This is the initial state.
    StateExpectHeader State = iota

    // StateExpectContent: The parser is expecting file content blocks.
    StateExpectContent

    // StateExpectSecondEmptyBlock: The parser has seen one empty block and is
    // waiting for a second to confirm the end of the archive.
    StateExpectSecondEmptyBlock

    // StateComplete: The parser has successfully found the end-of-archive marker.
    StateComplete

    // StateError: The parser has encountered an unrecoverable error.
    StateError
)
```

### 2. Simplify the `Parser` Struct

With the new states, the `Parser` struct can be simplified. It no longer needs to track the empty block count separately.

**Simplified `Parser` struct:**

```go
type Parser struct {
	state                  State
	files                  []File
	currentFile            File
	remainingContentBlocks int64
}
```

### 3. Refactor the `Next()` Function as the FSM Engine

The `Next(block []byte)` function will become the core of the FSM. It will use a clean `switch` statement based on the current `state`. All actions (parsing, appending data) will be performed inline within the transition logic, just before the state is updated.

**Conceptual `Next()` function logic:**

```go
func (p *Parser) Next(block []byte) error {
    switch p.state {
    case StateExpectHeader:
        // If block is a valid header:
        //  - Parse it, prepare p.currentFile.
        //  - If it has content, transition to StateExpectContent.
        //  - If it's a zero-byte file, add file to p.files and stay in StateExpectHeader.
        // If block is an empty (all zeros) block:
        //  - Transition to StateExpectSecondEmptyBlock.
        // Otherwise (invalid header):
        //  - Transition to StateError.

    case StateExpectContent:
        // If block contains data:
        //  - Append data to p.currentFile.content.
        //  - Decrement remainingContentBlocks.
        //  - If content is finished, add p.currentFile to p.files and transition to StateExpectHeader.
        //  - If more content is expected, stay in StateExpectContent.
        // If block is empty (which is an error while reading content):
        - Transition to StateError.

    case StateExpectSecondEmptyBlock:
        // If block is an empty (all zeros) block:
        //  - Transition to StateComplete.
        // Otherwise (any other data is an error):
        //  - Transition to StateError.

    case StateComplete, StateError:
        // Terminal states. Do nothing.
    }
    return nil
}
```

This approach aligns the Go parser with the robust and clear design of the Zig FSM, making it easier to maintain and debug.