#!/usr/bin/env bash

rm -rf text && mkdir text
src_d=`pwd`/..
dest_d=text

copy-transition-model \
    --binary=false \
    $src_d/exp/mono/40.mdl \
    $dest_d/40.mdl.txt

copy-tree \
    --binary=false \
    $src_d/exp/mono/tree \
    $dest_d/tree.txt

show-alignments \
    $src_d/exp/mono/phones.txt \
    $src_d/exp/mono/40.mdl \
    "ark:gunzip -c $src_d/exp/mono/ali.1.gz|" \
    > $dest_d/ali.1.txt

show-transitions \
    $src_d/exp/mono/phones.txt \
    $src_d/exp/mono/40.mdl \
    $src_d/exp/mono/40.occs \
    > $dest_d/transitions.txt
cat $dest_d/transitions.txt | ./phone_to_transition_id.py > $dest_d/phone_to_tid.txt

fstcopy \
    "ark:gunzip -c $src_d/exp/mono/fsts.1.gz|" \
    "ark,t:$dest_d/fsts.1"
