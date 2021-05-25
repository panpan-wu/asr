#!/usr/bin/env bash

rm -rf fsts_temp && mkdir fsts_temp
sed '1 i <eps> 0' text/phone_to_tid.txt > fsts_temp/phone_to_tid.txt
sed '1d;$d' text/fsts.1 > fsts_temp/1.fst.txt
cp ../data/lang/words.txt fsts_temp
src_d=fsts_temp
dest_d=images

fstcompile \
    --keep_state_numbering \
    $src_d/1.fst.txt \
    $src_d/1.fst

fstdraw \
    --isymbols=$src_d/phone_to_tid.txt \
    --osymbols=$src_d/words.txt \
    --portrait=true \
    --width=20000 \
    --height=320 \
    --fontsize=32 \
    $src_d/1.fst \
    | dot -Tpdf -o$dest_d/1.fst.pdf
