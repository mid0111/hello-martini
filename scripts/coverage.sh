#!/bin/bash

# Initialize error tracking
ERROR=""

# Initialize profile.cov
echo "mode: set" > coverage/all.cov

die() {
    echo $*
    exit 1
}

for pkg in $(go list ./...); do
    godep go test -v -cover -race -coverprofile=coverage/tmp.cov $pkg || ERROR="Error testing $pkg"
    tail -n +2 coverage/tmp.cov >> coverage/all.cov || die "Unable to append coverage for $pkg"
done

if [ ! -z "$ERROR" ]
then
    die "Encountered error, last error was: $ERROR"
fi
