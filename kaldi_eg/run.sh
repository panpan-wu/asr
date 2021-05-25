#!/usr/bin/env bash

. ./cmd.sh
. ./path.sh

nj=1

# mfcc cmvn
rm -rf data/train && mkdir data/train
cp -R data/originals/train/* data/train
utils/utt2spk_to_spk2utt.pl data/train/utt2spk > data/train/spk2utt
steps/make_mfcc.sh --nj $nj --cmd "$train_cmd" data/train
steps/compute_cmvn_stats.sh data/train

# lang
rm -rf data/local/dict data/local/lang data/lang && mkdir -p data/local/dict
cp -R data/originals/dict/* data/local/dict
utils/prepare_lang.sh \
    --position_dependent_phones false \
    data/local/dict \
    "<UNK>" \
    data/local/lang \
    data/lang

# mono
steps/train_mono.sh \
    --boost-silence 1.25 \
    --nj $nj \
    --cmd "$train_cmd" \
    data/train \
    data/lang \
    exp/mono
