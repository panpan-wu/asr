#!/usr/bin/env bash

d=ngram

cat ../data/train/text | \
awk '{
    for(i=2;i<NF;i++){
        printf("%s ", $i)
    }
    printf("%s\n", $NF)
}' > $d/text

ngram-count -text $d/text -order 2 -ndiscount -lm $d/2gram.arpa -write $d/2gram.count
gzip -c $d/2gram.arpa > $d/2gram.arpa.gz
