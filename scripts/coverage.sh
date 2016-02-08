#!/bin/bash

# Initialize error tracking
ERROR=""

# Initialize profile.cov
echo "mode: count" > coverage/profile.cov

die() {
    echo $*
    exit 1
}

# Standard go tooling behavior is to ignore dirs with leading underscors
for dir in $(find . -maxdepth 10 -not -path './.git*' -not -path '*/_*' -not -path '*/vendor/*' -type d);
do
    if ls $dir/*.go &> /dev/null; then
        godep go test -short -covermode=count -coverprofile=$dir/profile.tmp $dir
        if [ -f $dir/profile.tmp ]
        then
            cat $dir/profile.tmp | tail -n +2 >> coverage/profile.cov || die "Unable to append coverage for $pkg"
            rm $dir/profile.tmp
        fi
    fi
done

if [ ! -z "$ERROR" ]
then
    die "Encountered error, last error was: $ERROR"
fi
