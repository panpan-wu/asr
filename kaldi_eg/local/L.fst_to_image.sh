#!/usr/bin/env bash

src_d=`pwd`/..
dest_d=images

fstdraw \
    --isymbols=$src_d/data/lang/phones.txt \
    --osymbols=$src_d/data/lang/words.txt \
    --portrait=true \
    --width=20 \
    --height=32 \
    --fontsize=16 \
    $src_d/data/lang/L.fst \
    | dot -Tjpg -o$dest_d/L.fst.jpg

fstdraw \
    --isymbols=$src_d/data/lang/phones.txt \
    --osymbols=$src_d/data/lang/words.txt \
    --portrait=true \
    --width=20 \
    --height=32 \
    --fontsize=16 \
    $src_d/data/lang/L_disambig.fst \
    | dot -Tjpg -o$dest_d/L_disambig.fst.jpg
