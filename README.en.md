# logscope-c

`logscope-c` is a small C command-line log analyzer. It reads plain text logs,
parses severity levels, filters records, and prints summary statistics.

This project was built as a compact C/Git/Linux practice project for an
open-source software internship application.

## Features

- Parses log lines with `INFO`, `WARN`, `ERROR`, and `DEBUG` levels.
- Counts total records and records by severity.
- Filters output by severity with `--level`.
- Prints the top repeated messages with `--top N`.
- Handles malformed lines without crashing.
- Uses dynamic arrays, structs, file I/O, string parsing, and a Makefile build.

## Log format

The parser expects lines in this shape:

```text
2026-04-29T10:15:00Z INFO api request completed
2026-04-29T10:15:01Z ERROR db connection failed
```

The first field is treated as a timestamp, the second as a severity level, and
the rest of the line as the message.

Malformed lines are counted and skipped.

## Build

On Linux or another environment with `make` and a C compiler:

```sh
make
```

Manual build:

```sh
cc -std=c11 -Wall -Wextra -pedantic -O2 -o logscope src/logscope.c
```

MSVC build from a Visual Studio Developer Command Prompt:

```bat
cl /W4 /std:c11 /Fe:logscope.exe src\logscope.c
```

## Usage

Print summary:

```sh
./logscope examples/sample.log
```

Filter records:

```sh
./logscope --level ERROR examples/sample.log
```

Show top repeated messages:

```sh
./logscope --top 3 examples/sample.log
```

Combine options:

```sh
./logscope --level WARN --top 5 examples/sample.log
```

## Example output

```text
File: examples/sample.log
Parsed records: 18
Malformed lines: 2

By level:
  DEBUG: 2
  INFO : 7
  WARN : 4
  ERROR: 5
```

## Why this project exists

The goal is to demonstrate basic C programming in a realistic CLI utility:

- reading files line by line;
- parsing structured text;
- using structs and enums;
- growing arrays dynamically;
- validating command-line arguments;
- reporting errors clearly;
- documenting build and run steps.

