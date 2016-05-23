aws s3 ls s3://ukp-research-data/c4corpus/CC-MAIN-2015-48/cc-final-2015-48/ | grep 'Lang_de'

aws s3 sync \
    s3://ukp-research-data/c4corpus/CC-MAIN-2015-48/cc-final-2015-48/ c4corpus-2015-11/ \
    --exclude '*' \
    --include '*Lic_by*Lang_de*' \
    --include '*Lic_public*Lang_de*' \
    --include '*Lic_cc*Lang_de*'

shopt -s nocasematch
[[ ${C4CORPUS_BIGFILES} == "true" ]] \
&& \
aws s3 sync \
    s3://ukp-research-data/c4corpus/CC-MAIN-2015-48/cc-final-2015-48/ c4corpus-2015-11/ \
    --exclude '*' \
    --include '*Lic_none*Lang_de*' \
|| echo "C4CORPUS_BIGFILES not true: not downloading big files."
shopt -u nocasematch
