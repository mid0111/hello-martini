build: install
	godep go build -o ./bin/hello-martini

test: install
	- godep go vet ./...
	- /bin/sh scripts/coverage.sh
	- go tool cover -html=coverage/all.cov -o coverage/coverage.html

install:
	- go get github.com/tools/godep
	- godep restore
