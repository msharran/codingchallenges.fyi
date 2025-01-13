SHELL := /bin/bash

.PHONY: go-dns-resolver
go-dns-resolver: prebuild
	go build 

.PHONY: prebuild
prebuild:
	go mod tidy
	go fmt ./...
	go vet ./...

