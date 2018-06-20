#!/usr/bin/env bash

set -e
echo "" > cover.out

for d in $(go list "$@"); do
    go test -race -coverprofile=profile.out -coverpkg=all "$d"
    if [ -f profile.out ]; then
        cat profile.out >> cover.out
        rm profile.out
    fi
done
