CC ?= cc
CFLAGS ?= -std=c11 -Wall -Wextra -pedantic -O2
TARGET := logscope
SRC := src/logscope.c

.PHONY: all clean run

all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) -o $(TARGET) $(SRC)

run: $(TARGET)
	./$(TARGET) examples/sample.log

clean:
	rm -f $(TARGET)

