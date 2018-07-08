---
layout: post
comments: true
title:  "Vector Representations of Words - Word embeddings"
excerpt: "This post explain the basics that you need to know about word embeddings"
date:   2018-07-08 14:00:00
published:   false
---

# Vector Representations of Words - Word embeddings

Word embeddings or vector space models of word semantics can be seen as a way of representing words, allowing the creation of Natural Language Processing (NLP) applications capable of understanding textual analogies even with few data for training. The use of word embeddings has been exceptionally successful in many NLP tasks over the past few years. In many cases it has completely replaced the traditional models in the distributional field like Brown clusters and Latent semantic analysis (LSA).

In many traditional NLP applications, **one-hot vectors** were used to represent words of a vocabulary. In this case, we have a vector for each word of the vocabulary with the same size, filled with zeros beside the position of the word where we have the value one. 
One problem of using the one-hot representation is that you can't generalize crosswords because of the inner product of any 1-hot vector is always zero. And for this reason, we cannot apply any distance-like metrics to evaluate the similarity. For this reason, a **feature vector** is preferable to word representation. In this case, we have for each word an vector of size $d$ filled with real values between 0 and 1 that represents multiple features. There are several ways to learn these high dimensional feature vectors values. 

\citetexto{Bengio:2003} first introduced the term word embeddings with a simple feed forward neural language model to learn these vectors. After this, other models emerged like the **Continuous bag-of-words** (CBOW) and **Skip-gram** (SG) presented by \citetexto{Mikolov2013DistributedRO} with the creation of a toolkit named __word2vec__, and **Global Vectors** (GloVe) by \citetexto{Pennington2014}.

% --------------------------

% The other family of word embedding model learns semantics by passing a window over the corpus line-by-line and learning to predict either the surroundings of a given word (Skip-gram model), or predict a word given its surroundings (continuous bag-of-words model).

% According to Mikolov et at., the authors of the word2vec paper, the two approaches differ slightly in performance:

% Skip-gram: works well with small amount of the training data, represents well even rare words or phrases.
% CBOW: several times faster to train than the skip-gram, slightly better accuracy for the frequent words.
% The authors of the GloVe paper note, however, that these context window-based methods suffer from the disadvantage of not learning from the global corpus statistics. As a result, repetition and large-scale patterns may not be learned as well with these models as they are with global matrix factorization. 



## References

- []()
