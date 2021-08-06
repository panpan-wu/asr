#!/usr/bin/env bash

. ./cmd.sh
. ./path.sh

nj=1

# # mfcc cmvn
# rm -rf data/train && mkdir data/train
# cp -R data/originals/train/* data/train
# utils/utt2spk_to_spk2utt.pl data/train/utt2spk > data/train/spk2utt
# steps/make_mfcc.sh --nj $nj --cmd "$train_cmd" data/train
# steps/compute_cmvn_stats.sh data/train
# 
# # lang
# rm -rf data/local/dict data/local/lang data/lang && mkdir -p data/local/dict
# cp -R data/originals/dict/* data/local/dict
# utils/prepare_lang.sh \
#     --position_dependent_phones false \
#     data/local/dict \
#     "<UNK>" \
#     data/local/lang \
#     data/lang
# 
# # mono
# steps/train_mono.sh \
#     --boost-silence 1.25 \
#     --nj $nj \
#     --cmd "$train_cmd" \
#     data/train \
#     data/lang \
#     exp/mono

# # prepare lm
# utils/format_lm.sh \
#     data/lang \
#     local/ngram/2gram.arpa.gz \
#     data/local/dict/lexicon.txt \
#     data/graph

# utils/mkgraph.sh \
#     data/graph \
#     exp/mono \
#     exp/mono/graph

steps/decode.sh \
    --cmd "$decode_cmd" \
    --nj "$nj" \
    exp/mono/graph \
    data/train \
    exp/mono/decode_train

# # mono ali
# steps/align_si.sh \
#     --boost-silence 1.25 \
#     --nj $nj \
#     --cmd "$train_cmd" \
#     data/train \
#     data/lang \
#     exp/mono \
#     exp/mono_ali

# steps/train_deltas.sh \
#     --boost-silence 1.25 \
#     --cmd "$train_cmd" \
#     10 \
#     100 \
#     data/train \
#     data/lang \
#     exp/mono_ali \
#     exp/tri1
