# OSC Parser FSM Implementation in `src/terminal/osc.zig`

The OSC parser in `src/terminal/osc.zig` is implemented as a Finite State Machine (FSM). Here is a breakdown of its implementation.

### 1. Core Components

The FSM is primarily built around the `Parser` struct, which contains these key fields:

*   **`state: State`**: This is the most important field. It holds the current state of the FSM, which is a value from the `Parser.State` enum. The parser's behavior is dictated entirely by this value.
*   **`command: Command`**: A `union` that holds the parsed command data. As the FSM transitions through states, it populates the fields of this union.
*   **`buf: [MAX_BUF]u8`**: A fixed-size buffer that stores the raw bytes of the OSC sequence as they are being parsed. The final `Command`'s data fields are slices that point directly into this buffer, which is very memory-efficient.
*   **`next(self: *Parser, c: u8)`**: This function is the engine of the FSM. It consumes one character of input at a time and, based on the current `state`, decides which state to transition to next.

### 2. The States (`Parser.State` enum)

The `State` enum defines every possible step in the parsing process. It's a comprehensive list that represents the parser's "memory" of what it has seen so far. The states can be grouped logically:

*   **Initial/Invalid States**: `.empty`, `.invalid`, `.swallow`. The parser starts in `.empty` and moves to `.invalid` if it encounters an unexpected sequence.
*   **Prefix States**: States like `@"1"`, `@"13"`, `@"133"`. Instead of parsing a number and then deciding which command it is, the FSM uses a series of states to represent the command code. For example, on seeing a `'1'`, it enters state `@"1"`. If the next character is `'3'`, it moves to `@"13"`, and so on. This is a very fast way to decode the command code.
*   **Parameter States**: Once a command code is identified, the FSM transitions to a state specific to that command's parameters. Examples include:
    *   `semantic_prompt`: For parsing `133;...` shell integration prompts.
    *   `hyperlink_param_key`: For parsing key-value pairs in a hyperlink.
    *   `osc_4_index`: For parsing the color index for an OSC 4 command.
*   **Generic States**: States like `.string` or `.allocable_string` are used when the parser simply needs to consume a string argument until it hits a separator (`;`) or the final terminator.

### 3. State Transitions (The `next` function)

The `next` function is a large `switch` statement on `self.state`. For each state, it switches on the input character `c` to determine the next action.

Here's a simplified trace for parsing `OSC 8;id=123:https://example.com`:

1.  **State: `.empty`**, Input: `'8'` -> **Transition to State: `@"8"`**.
2.  **State: `@"8"`**, Input: `';'` -> **Transition to State: `.hyperlink_param_key`**. The parser now knows it's parsing a hyperlink and is ready for parameters. It also initializes `command` to be a `.hyperlink_start`.
3.  **State: `.hyperlink_param_key`**, Input: `'i'`, `'d'` -> Stays in `.hyperlink_param_key`, accumulating the key.
4.  **State: `.hyperlink_param_key`**, Input: `'='` -> **Transition to State: `.hyperlink_param_value`**. The key (`id`) is saved in `temp_state`.
5.  **State: `.hyperlink_param_value`**, Input: `'1'`, `'2'`, `'3'` -> Stays in `.hyperlink_param_value`, accumulating the value.
6.  **State: `.hyperlink_param_value`**, Input: `':'` -> **Transition to State: `.hyperlink_param_key`**. The key-value pair (`id=123`) is processed and stored in the `command`. The parser is ready for the next key-value pair or the final URI.
7.  **State: `.hyperlink_param_key`**, Input: `';'` -> **Transition to State: `.hyperlink_uri`**. The parser sees the final separator and now knows the rest of the content is the URI.
8.  **State: `.hyperlink_uri`**, Input: `h`, `t`, `t`, `p`, ... -> Stays in `.hyperlink_uri`, accumulating the URI in the buffer.

### 4. Completion (The `end` function)

When the final OSC terminator (e.g., BEL or ST) is received, the `end()` function is called. It performs any final cleanup based on the state the parser was in and returns the fully populated `Command` struct. If the parser was not in a valid `complete` state, it returns `null`.

## Transition Events

The parser does not use a formal event/callback system (like `on_enter_state` or `on_exit_state` hooks) that you might find in some FSM libraries.

Instead, the **actions that would be in an event handler are executed inline, directly within the transition logic** inside the `next()` function.

Let's look at a simple example, the transition for `OSC 0` (change window title):

```zig
.@"0" => switch (c) {
    ';' => {
        // Action: Initialize the command structure.
        self.command = .{ .change_window_title = undefined };

        // Action: Mark that a valid command could be formed.
        self.complete = true;

        // Action: Set up temporary state for the string parameter.
        self.temp_state = .{ .str = &self.command.change_window_title };
        self.buf_start = self.buf_idx;

        // State Transition:
        self.state = .string;
    },
    else => self.state = .invalid,
},
```

Here's what's happening:

1.  **Condition**: The FSM is in state `@"0"` and receives a `';'`.
2.  **Actions**: Before the state officially changes, a block of code is executed. This block performs all the setup required for the *next* state. It initializes the `command` union, sets the `complete` flag, and configures `temp_state` to know where to store the upcoming string.
3.  **Transition**: The final step is assigning the new state: `self.state = .string`.

This pattern is used throughout the entire parser. The "event" is simply the combination of the current state and the input character. The "event handler" is the block of code that runs just before the `self.state` is updated. This is a very direct and efficient way to implement a high-performance FSM, as it avoids the overhead of function calls for callbacks.
