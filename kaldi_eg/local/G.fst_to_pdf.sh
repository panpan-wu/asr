#!/usr/bin/env bash

src_d=../data/graph
dest_d=images

fstdraw \
    --isymbols=$src_d/words.txt \
    --osymbols=$src_d/words.txt \
    --portrait=true \
    --width=20000 \
    --height=320 \
    --fontsize=32 \
    $src_d/G.fst \
    | dot -Tpdf -o$dest_d/G.fst.pdf

fstprint \
    --isymbols=$src_d/words.txt \
    --osymbols=$src_d/words.txt \
    $src_d/G.fst \
    > $dest_d/G.fst.txt
