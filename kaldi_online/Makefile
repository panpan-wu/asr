KALDIDIR = /home/pan/Othergit/kaldi/src

all:

include $(KALDIDIR)/kaldi.mk
CXXFLAGS += -I$(KALDIDIR)

LDFLAGS += $(CUDA_LDFLAGS)
LDLIBS += $(CUDA_LDLIBS)

BINFILES = online2-tcp-gmm-decode-faster

OBJFILES =

TESTFILES =

ADDLIBS = $(KALDIDIR)/online2/kaldi-online2.a \
		  $(KALDIDIR)/ivector/kaldi-ivector.a \
          $(KALDIDIR)/nnet3/kaldi-nnet3.a \
		  $(KALDIDIR)/chain/kaldi-chain.a \
		  $(KALDIDIR)/nnet2/kaldi-nnet2.a \
          $(KALDIDIR)/cudamatrix/kaldi-cudamatrix.a \
		  $(KALDIDIR)/decoder/kaldi-decoder.a \
          $(KALDIDIR)/lat/kaldi-lat.a \
		  $(KALDIDIR)/fstext/kaldi-fstext.a \
		  $(KALDIDIR)/hmm/kaldi-hmm.a \
          $(KALDIDIR)/feat/kaldi-feat.a \
		  $(KALDIDIR)/transform/kaldi-transform.a \
          $(KALDIDIR)/gmm/kaldi-gmm.a \
		  $(KALDIDIR)/tree/kaldi-tree.a \
		  $(KALDIDIR)/util/kaldi-util.a \
          $(KALDIDIR)/matrix/kaldi-matrix.a \
		  $(KALDIDIR)/base/kaldi-base.a

include $(KALDIDIR)/makefiles/default_rules.mk
