build: install
	godep go build -o ./bin/hello-martini

test: install
	go vet $(go list ./... | grep -v /vendor/)
	/bin/sh scripts/coverage.sh
	go tool cover -html=coverage/profile.cov -o coverage/coverage.html

install:
	go get github.com/tools/godep
	godep restore
