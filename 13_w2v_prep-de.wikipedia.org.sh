#!/usr/bin/env bash
#
# pre-process data to be fed to word2vec
# * de.wikipedia.org data
#

set -e
. 99_utils-w2v_prep_data

[ -e ./tmp/pre-w2v_de.wikipedia.readme ] || \
    cat > ./tmp/pre-w2v_de.wikipedia.readme << END
cat <(bzip2 -c -d ./de.wikipedia.org/*.tt.bz2) \
    | bzip2 -c -9 ./pre-w2v_de.wikipedia.org.txt.bz2
END

[ -e ./tmp/w2v-${CLEAN_VERSION}_de.wikipedia.org.txt ] || \
    clean <(bzip2 -c -d ./tmp/de.wikipedia.org/*.tt.bz2)  \
    > ./tmp/w2v-${CLEAN_VERSION}_de.wikipedia.org.txt
