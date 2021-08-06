#!/bin/bash

./online2-tcp-gmm-decode-faster \
    --model=data/final.mdl \
    --global-cmvn-stats=data/cmvn.ark \
    --feature-type=mfcc \
    --mfcc-config=conf/mfcc.conf \
    --add-pitch=true \
    --splice-feats=true \
    --splice-config=conf/splice.conf \
    --lda-matrix=data/final.mat \
    --fmllr-basis=data/fmllr.basis \
    "gunzip -c data/HCLG.fst.gz|" \
    data/words.txt
