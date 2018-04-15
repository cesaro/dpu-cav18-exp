#!/bin/bash

echo "Doing a 'git pull'..."
git pull

echo "Computing the SHA1 sum... This can take a while."

ALLFILES=$(find . -type f | sort | grep -v '\.git')
LIST=$(mktemp)

for f in $ALLFILES ; do
    sha1sum $f >> $LIST
done

echo
echo -n "SHA1 sum: "
sha1sum $LIST | awk '{print $1}'

rm $LIST
