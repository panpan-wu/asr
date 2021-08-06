#!/usr/bin/env bash

src_d=../exp/mono/graph
dest_d=images

# fstdraw \
#     --osymbols=$src_d/words.txt \
#     --portrait=true \
#     --width=20000 \
#     --height=320 \
#     --fontsize=32 \
#     $src_d/HCLG.fst \
#     | dot -Tpdf -o$dest_d/HCLG.fst.pdf

fstprint \
    --isymbols=fsts_temp/phone_to_tid.txt \
    --osymbols=$src_d/words.txt \
    $src_d/HCLG.fst \
    > $dest_d/HCLG.fst.txt
