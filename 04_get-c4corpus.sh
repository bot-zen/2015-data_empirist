#!/usr/bin/env bash

which aws || { echo "You need to installi the 'Universal Command Line Environment for AWS'"; exit 1; }

aws s3 ls s3://ukp-research-data/c4corpus/CC-MAIN-2015-48/cc-final-2015-48/ | grep 'Lang_de'

aws s3 sync \
    s3://ukp-research-data/c4corpus/CC-MAIN-2015-48/cc-final-2015-48/ tmp/c4corpus-final-2015-48/ \
    --exclude '*' \
    --include '*Lic_by*Lang_de*' \
    --include '*Lic_public*Lang_de*' \
    --include '*Lic_cc*Lang_de*'

shopt -s nocasematch
[[ ${C4CORPUS_BIGFILES} == "true" ]] \
&& \
aws s3 sync \
    s3://ukp-research-data/c4corpus/CC-MAIN-2015-48/cc-final-2015-48/ tmp/c4corpus-final-2015-48 \
    --exclude '*' \
    --include '*Lic_none*Lang_de*' \
|| echo "C4CORPUS_BIGFILES not true: not downloading big files."
shopt -u nocasematch
