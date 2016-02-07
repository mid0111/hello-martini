build: install
	go build -o ./bin/hello-martini

test: install
	/bin/sh scripts/coverage.sh
	go tool cover -html=coverage/all.cov -o coverage/coverage.html

install:
	gom install
