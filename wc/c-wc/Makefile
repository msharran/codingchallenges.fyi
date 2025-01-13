SHELL := /bin/bash

TARGETS = $(wildcard *.c)

.PHONY: $(TARGETS)
$(TARGETS):
	clang -o $(shell basename $@ .c) $@
