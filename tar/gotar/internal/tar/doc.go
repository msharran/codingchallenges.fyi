// The Go standard library's `archive/tar` package provides a clean and idiomatic
// way to handle tar archives. The public API for the `Reader` is designed around
// the concept of reading the archive as a stream of entries.
//
// Here's an explanation of the key public functions and types you'd need to
// replicate to build your own `tar` reader.
//
// # Core Concepts
//
// The standard library's approach is based on a simple, powerful idea: the
// `tar.Reader` processes the archive sequentially. You don't get all the files
// at once. Instead, you ask for the *next* file, read its contents, and then ask
// for the one after that, until you reach the end.
//
// # Public API Components
//
// The public interface for reading a tar file revolves around two main types and
// three key functions/methods.
//
// 1. The `Header` Struct
//
// This struct holds the metadata for a single entry (a file, directory, etc.) in
// the archive. A simplified version looks like this:
//
//	// Header represents a single header in a tar archive.
//	type Header struct {
//	    Name string // Name of file entry
//	    Mode int64  // Permission and mode bits
//	    Size int64  // Logical file size in bytes
//	    // ... other fields like ModTime, Typeflag, etc.
//	}
//
// When you parse a header block from the archive, you populate one of these
// structs.
//
// 2. The `Reader` Struct
//
// This is the main object that does the work. It wraps an `io.Reader` (like an
// open file or a network connection) and manages the state of the parsing
// process.
//
//	// Reader provides sequential access to the contents of a tar archive.
//	type Reader struct {
//	    // contains unexported fields, but it wraps the underlying reader
//	}
//
// # Public Functions and Methods
//
// Here is the essential public API you would interact with, and which you would
// need to implement.
//
// 1. `NewReader(r io.Reader) *Reader`
//
// This is the constructor function. It's how you start the process.
//
//   - What it does: It takes an existing `io.Reader` (which is the source of the
//     tar data) and returns a new `*tar.Reader` instance.
//
//   - How you'd use it:
//     file, err := os.Open("my_archive.tar")
//     if err != nil { /* handle error */ }
//     defer file.Close()
//
//     tarReader := tar.NewReader(file)
//
//   - Your implementation goal: Create a `NewReader` function that initializes your
//     custom parser struct, setting it up to read from the provided `io.Reader`.
//
// 2. `(r *Reader) Next() (*Header, error)`
//
// This is the most important method. It advances to the next entry in the
// archive.
//
//   - What it does: It reads from the underlying `io.Reader` until it has parsed a
//     complete file header.
//   - What it returns:
//   - `*Header`: A pointer to a `Header` struct containing the metadata for the
//     next file.
//   - `error`: It returns `io.EOF` when there are no more entries in the archive.
//     Any other non-nil error indicates a problem with the archive's format.
//   - Crucial side-effect: After `Next()` returns a valid header, the `Reader` is
//     positioned to start reading the actual file content for that header.
//   - Your implementation goal: Implement a `Next()` method that reads 512-byte
//     blocks, parses a header, populates your `File` (or `Header`) struct, and
//     prepares to read the file's content blocks. It must return `io.EOF` after the
//     last file and the end-of-archive blocks have been processed.
//
// 3. `(r *Reader) Read(p []byte) (n int, err error)`
//
// This method makes the `tar.Reader` itself an `io.Reader`. This is a very
// powerful and common Go idiom.
//
//   - What it does: After you've called `Next()` successfully, you can call `Read()`
//     to get the content of the *current file*.
//   - How it works: It reads the data blocks associated with the most recent header
//     returned by `Next()`.
//   - What it returns:
//   - `n int`: The number of bytes read into the slice `p`.
//   - `err error`: It returns `io.EOF` when you have read all the content for the
//     *current file*. This is different from the `EOF` returned by `Next()`. This
//     `EOF` just means this file is done; the next call to `Next()` will advance
//     to the next file in the archive.
//   - Your implementation goal: Make your `Parser` (or `Reader`) struct implement
//     the `io.Reader` interface. The `Read` method should provide the bytes of the
//     current file's content and return `io.EOF` only when that specific file's
//     content has been fully delivered.
//
// Putting It All Together (How It's Used)
//
// A user of the standard library would write a loop like this, which is the
// pattern you are aiming to support:
//
//	// tarReader is a *tar.Reader
//	for {
//	    // Advance to the next entry in the archive
//	    hdr, err := tarReader.Next()
//
//	    // Check for the end of the archive
//	    if err == io.EOF {
//	        break // End of archive
//	    }
//	    if err != nil {
//	        // handle error
//	    }
//
//	    // Print the file name from the header
//	    fmt.Println("Found file:", hdr.Name)
//
//	    // Read the content of the current file.
//	    // io.Copy is a great way to drain an io.Reader.
//	    if _, err := io.Copy(os.Stdout, tarReader); err != nil {
//	        // handle error
//	    }
//	}
//
// By focusing on implementing `NewReader`, `Next`, and `Read`, you will
// effectively replicate the core functionality and user experience of Go's
// standard `archive/tar` reader.
package tar
