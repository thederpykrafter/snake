# use @<command> to supress make echoing command
CC = gcc
LANG = c
LFLAGS = -lncurses
OUT_FILE = Snake

default: all

all: build install

test: build run

build: src/main.$(LANG)
	@if [ ! -d bin ]; then mkdir bin; fi
	$(CC) src/main.$(LANG) $(LFLAGS) -o bin/$(OUT_FILE)

install: bin/$(OUT_FILE)
	cp -rf bin/$(OUT_FILE) /usr/bin

uninstall: bin/$(OUT_FILE)
	rm -f /usr/bin/$(OUT_FILE)

run:
	./bin/$(OUT_FILE)

clean veryclean:
	rm -f bin/**
