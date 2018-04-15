#!/bin/bash

ALLFILES=`find . -type f`
FILENAME=`mktemp`

echo "Computing the SHA1 sum... This can take a while."

for f in $ALLFILES ; do
    sha1sum $f | awk {'print $1'} >> ${FILENAME}
done

# The previous loop can take a while. However it is safer than the following one
# that might have interleaving outputs
# find . -type f -print | xargs sha1sum | awk {'print $1'} >> ${FILENAME}

echo -n "SHA1 sum: "
sha1sum ${FILENAME} | awk {'print $1'}

rm $FILENAME
