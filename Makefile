GO_PKGS=$(shell go list ./... | grep -v vendor/)

build: install
	go build -o ./bin/hello-martini

test: install
	go test $(GO_PKGS)

install:
	gom install
