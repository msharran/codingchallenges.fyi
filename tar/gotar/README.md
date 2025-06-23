## Build and Run

```sh
make           # Build the gotar binary
cat files2.tar | ./gotar   # Run gotar to process files2.tar
```

## Implementation Plan for `tar -t` Command

### State Machine Design

**Parser Struct** - Contains all state information:
- `state` (READING_HEADER, READING_CONTENT, STOPPED, ERROR)
- `remainingContentBlocks` - tracks content blocks left to read
- `currentFile` - file being parsed
- `files []File` - completed files
- `emptyBlockCount` - for EOF detection

**Separation of Concerns**:
- Parser handles only TAR format parsing
- Main function handles flag logic and output formatting
- Extensible design for different output modes

**State Transitions**:
- READING_HEADER → READING_CONTENT (when file has content)
- READING_CONTENT → READING_HEADER (when all content blocks read)
- READING_HEADER → STOPPED (when 2 empty blocks found)

**Methods**:
- `NewParser()` - initialization
- `ProcessBlock([]byte) error` - main state transition logic
- `GetFiles() []File` - retrieve parsed files
- `IsComplete() bool` - check if parsing finished
