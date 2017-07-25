## Results {#sec:gistr-results}

### Descriptive observations

We begin the analysis of our three data sets by examining the evolution of aggregate measures as a function of depth in the trees.
Here and in what follows, the analyses are made on the data cleaned of spam, and chains truncated at their target depth:
the data from Experiment 1 is truncated at depth 8, Experiment 2 at depth 7, and Experiment 3 at depth 10, and all plots are aligned to the same depth axis to facilitate comparisons.
The goal of this section is to give an overview of the shape of the data and highlight a few important trends to keep in mind in the rest of the analysis.
We will come back to the details of the trends further down. \todo{do that.}


#### Utterance length

A well-known effect in transmission chains with linguistic content is the quick reduction of utterance length.
^[All NLP computations in this chapter are performed using the spaCy library for Python, version 1.9.0, available at \url{http://spacy.io/}.
]
These experiments are no exception:
@fig:gistr-token-lengths shows a scatter plot of the number of words of an utterance $|u|_w$ versus depth in a tree.
The insets show the data restricted to trees for which root utterances have 30 words or less (thus most utterances in those trees also have 30 words or less);
this boundary keeps all the Fénéon root utterances in Experiment 3, and we use it to separate longer from shorter utterances for the purposes of this figure.
The plots confirm that word length quickly decreases as subjects read and rewrite utterances, and indicate that the reduction depends on the size of what is being transformed:
very long utterances (above 100 words) are reduced to less than 100 words in 2 reformulations or less, whereas root utterances with up to 28 content words can maintain their size until the end of the branches of Experiment 3.
Note that the differences in the speed of size reduction across the experiments are tied to surface features of the root utterances.
Word count and average word frequency in particular, which we will later show are strongly related to transformation rate \todo{do that}, have different distributions in the set of root utterances of each experiment:
word counts are disjoint between Experiments 2 and 3, and root utterances from Experiment 2 are in an oral style, with a higher proportion of stopwords than in Experiments 1 and 3 (stopwords are very frequent words, and make up 67% of the root utterances of Experiment 2, versus 58% in Experiment 1 and 48% in Experiment 3).
The steeper slopes in Experiments 1 and 3 compared to Experiment 2 are thus tied to the higher word counts and lower proportions of stopwords in their root utterances.

Next, we eliminate stopwords from the utterances and focus on the reduction in number of content words (notice however that stopword recognition is less reliable in Experiment 1 than in Experiments 2 and 3, because of spelling mistakes).
For a given utterance $u$, the list of its content words is noted $c(u)$, and the number of content words is therefore $|c(u)|_w$, where $|\cdot|_w$ is extended to provide the length of a list of words (aside from counting words in a string).
@Fig:gistr-content-lengths plots the content word counts for the same utterances as those in @fig:gistr-token-lengths (in particular, insets show the same utterances in both figures), and shows a similar reduction in counts across all experiments.
Here too, the differences in regression values across experiments and between the two figures are tied to the differences in distributions of word count and proportion of stopwords in the roots.
In other words, the size reduction is sampled differently by each experiment:
these figures show how the effect acts on each set of root utterances, but do not indicate that the mechanism is any different across experiments nor that it depends on the actual meaning of the utterances (versus primarily on surface features such as word count and average word frequency).

<div id="fig:gistr-lengths">

![Numbers of words, $|u|_w$
](images/gistr-computed/token_lengths-tokens_m31.png){#fig:gistr-token-lengths}

![Numbers of content words, $|c(u)|_w$
](images/gistr-computed/content_lengths-tokens_m31.png){#fig:gistr-content-lengths}

Reduction in utterance word count and content word count as a function of depth ($d$) in the three experiments.
Each blue dot represents an utterance.
For a given experiment, the same utterances appear in panels (a) and (b).
The insets show the utterances for which the tree root has 30 or less words ($|u_{\text{root}}|_w \leq 30$), with the numerical values of the linear regression slope and correlation coefficient.
All regression slopes are non-zero with $p < .001$.
</div>


#### Utterance to utterance distance

As a first approximation of the magnitude of transformations we introduce a measure of the distance $\lambda(u, u')$ between two utterances $u$ and $u'$, defined as the Levenshtein distance
^[The Levenshtein distance (also known as the edit distance) is defined between two lists of items, and counts the minimal number of insertions, deletions, and replacements that are needed to transform the first list of items into the second.
It has all the properties of a metric (non-negativity, identity of indiscernibles, symmetry, and subadditivity).
]
between the lemmas of the content words of $u$ and $u'$:

$$\lambda(u, u') = \text{levenshtein}\left(\text{lemmatize}(c(u)), \text{lemmatize}(c(u'))\right)$$

For example, consider the three following utterances taken from Experiment 1 (in a tree whose root is from the MemeTracker data set):

> $u_a$: "This crisis did not develop overnight and it will not be solved overnight" <!-- #8 -->

> $u_b$: "the crisis did not developed overnight, and it will be not solved overnight" <!-- #2101 -->

> $u_c$: "The crisis didn't happen today won't be solved by midnight." <!-- #2269 -->

After removing the punctuation and converting all words to lowercase, the lemmas of the content words of these utterances are as follows:

> $\text{lemmas}(c(u_a))$: "crisis", "develop", "overnight", "solve", "overnight"

> $\text{lemmas}(c(u_b))$: "crisis", "develop", "overnight", "solve", "overnight"

> $\text{lemmas}(c(u_c))$: "crisis", "happen", "today", "solve", "midnight"

Such that $\lambda(u_a, u_b) = 0$ and $\lambda(u_a, u_c) = \lambda(u_b, u_c) = 3$.
$\lambda$ thus measures differences in content words and is blind to minor transformations, such as changes of stopwords or word inflexions.
In order to have a uniform quantity across utterances of different lengths, we define the *transformation rate* $\rho$ as the normalised distance between two utterances:

$$\rho(u, u') = \frac{\lambda(u, u')}{\max\left(|c(u)|_w, |c(u')|_w\right)}$$

$\rho$ thus measures the magnitude of the transformation between the contents of $u$ and $u'$, relative to the size of the contents of those utterances.
It takes its values between 0 and 1:
$\rho(u, u') = 0$ if and only if $u$ and $u'$ have exactly the same content words in the same order, and $\rho(u, u') = 1$ means that the content words of $u$ and $u'$ have so little in common that rewriting from scratch is quicker than changing one into the other with word insertions, deletions, or replacements.
Here, $\rho(u_a, u_b) = 0$ and $\rho(u_a, u_c) = \rho(u_b, u_c) = .6$.
A major caveat of this measure is that it does not know about synonyms or expressions with similar meaning, such that two sentences separated by a transformation rate of 1 can have the same meaning at a higher level.
For instance with the following sentences,

> $u_d$: "Will you investigate the gravest crimes of the Bush administration, including torture and warrantless wiretapping?" (from Experiment 1, originally from the MemeTracker data set)

> $u_e$: "Will you research the worst problems of the 2004 mandate, like its surveillance?" (hand-crafted for this comparison)

> $u_f$: "Don't forget to leave the door open when you leave the office" (from Experiment 1)

we have $\rho(u_d, u_e) = \rho(u_d, u_f) = 1$.
The measure misrepresents the changes between these utterances, as $u_d$ and $u_e$ can easily be considered to have similar meanings at a high level, and their difference is far less important than the difference between $u_d$ and $u_f$.
The measure performs reasonably well on utterances inside the same tree however:
in that context all utterances come from the same source and have therefore some level of meaning in common, and there is no need to differentiate between the types of transformations that $u_d \rightarrow u_e$ and $u_d \rightarrow u_f$ represent.


#### Transmissibility and transformation rate

Together with transformation rate, we examine a measure derived from it:
the *transmissibility* of utterances, defined as the proportion of utterances at a given depth whose content words are perfectly transmitted to their child, computed over all the branches of all the trees of an experiment [this measure was introduced as "average success" in @claidiere_cultural_2014].
If we note $\mathds{1}_{\lambda(u, u') = 0}$ the success of a subject in transmitting an utterance's content (it equals 1 if the content words of $u$ and $u'$ match perfectly, and 0 if there was any change in content words), the transmissibility of utterances at depth $d$ can be expressed as:

$$\eta(d) = \left< \mathds{1}_{\lambda(u, u') = 0} \right>_{\text{$u$ at depth $d$, $u'$ child of $u$}}$$

Transmissibility provides a coarser measure of the evolution of transmission success than transformation rate (a change in transmissibility implies a change of transformation rates), but lets us better differentiate between the two important alternatives:
perfect transmission, and transformation.
A classic effect of transmission chains for various types of content is that transmissibility increases with depth in the chains.

@Fig:gistr-octrans shows the transmissibility and one minus the transformation rates ($1 - \rho$) for the three experiments, both overall and grouped by content length of the utterances.
@Fig:gistr-octrans-exp-1 shows an increase in transmissibility with respect to depth (from .40 to .67), when considering the whole data set from Experiment 1.
However, the plots on the right show only a slight increase in transmissibility (or even no increase at all for $|c(u)|_w \notin [7, 10]$) for utterances of a given content length.
The right-hand side also indicates that transmissibility depends on content length, as the transmissibility lines become gradually lower when content length increases (average .92 for 2 content words, .20 for 12 content words).
Together, these trends indicate that the overall increase in transmissibility with respect to depth could be mostly due to the rarefaction of utterances with long content length:
as depth increases, the proportion of shorter utterances increases;
shorter utterances are better transmitted, and as consequence global transmissibility increases too.

@Fig:gistr-octrans-exp-2 shows the same analysis for Experiment 2.
Contrary to the previous case, transmissibility here is stable at .82-.88 with respect to depth, both for the whole data set and at fixed content length.
It also depends less on content length than in Experiment 1, as utterances with 2 content words have an average transmissibility of .95, and utterances with 8 content words an average transmissibility of .69.

Experiment 3 (@fig:gistr-octrans-exp-3) features an increase in transmissibility with respect to depth both globally (from .18 to .71) and at long fixed content length.
This effect is stronger than in Experiment 1, and indicates that long utterances in the data set become slightly easier to transmit as they are transformed.
As noted previously, utterances found at the end of a chain will often come from much longer utterances at the start, such that improved transmission success along a single branch is always mixed with the shortening of content.
However, for long utterances (content lengths 8 and above), utterances found at the end of all chains are on average better transmitted than utterances *of the same content length* at the start of all chains, meaning that transmission along the chains has an effect on transmissibility of long utterances beyond the shortening of the content.
Finally, the different behaviours across experiments are here again tied to the differences in word count and stopword proportion distributions in the root utterances.

<div id="fig:gistr-octrans">

![Experiment 1](images/gistr-computed/oc-rates-trans-exp-1.png){#fig:gistr-octrans-exp-1}

![Experiment 2](images/gistr-computed/oc-rates-trans-exp-2.png){#fig:gistr-octrans-exp-2}

![Experiment 3](images/gistr-computed/oc-rates-trans-exp-3.png){#fig:gistr-octrans-exp-3}

Transmissibility and conservation rate for each experiment.
Each individual graph shows both transmissibility (red line, with 95% confidence intervals) and one minus the transformation rate (blue dots) for a subset of all utterances.
A blue dot at $y = 1$ is an instance of perfect transmission ($\rho = 0$), and pulls transmissibility upwards;
a blue dot anywhere below is a transformation instance ($\rho > 0$), and pulls transmissibility downwards.
The large plot on the left shows both measures for all the sentences of an experiment.
The small plots on the right show both measures for utterances that have a given number of content words (up to 13 content words, after which the data is nonexistent or very sparse in all experiments).
The orange dashed line marks the maximum depth in the experiment, so as to differentiate content lengths reaching the limit from content lengths disappearing before the limit.
</div>


#### Variability

\todo{remove this?}

Let us close this overview of the aggregate evolution in all experiments with a final measure:
the variability of utterances at a given tree depth.
For a given tree $t$, the variability $\kappa(t, d)$ measures the average transformation rate between all pairs of utterances at depth $d$ in $t$ (also called the *slice* of $t$ at depth $d$):

$$\kappa(t, d) = \left< \rho(u, u') \right>_{\{u, u'\} \subset \left\{ \text{$u$ at depth $d$ in $t$}\right\} }$$

This measure gives a sense of how fast branches diverge between each other.
For each experiment, @fig:gistr-variabilities plots the variability of all slices of all trees, and the average variability averaged across trees.
All three increase significantly, meaning that utterances from different branches in a tree become more and more different as the chains progress.
The different divergence rates correspond loosely to the transformation rates observed in @fig:gistr-octrans (Experiment 2 has lower transformation rates, and diverges slower), and are therefore again tied to the differences in root utterances.

![Slice variabilities in the three experiments.
Each plot shows the variabilities of each slice of each tree (blue dots), as well as the average variability across slices of all trees at a given depth (red line with 95% confidence interval).
](images/gistr-computed/variabilities.png){#fig:gistr-variabilities}

We now wish to achieve a much finer view of the process at work in this evolution, by decomposing the transformation operations into smaller blocks.
Our goal from now on is to achieve a more synthetic understanding of the process at work, beyond the simple description of the outer shape of the evolution.


### Transformation breakdown

#### Sequence alignments

Our first step towards this finer view of transformations is to take advantage of existing generalisations of the Levenshtein distance underlying our measure of transformation rate $\rho$.
Recall that the Levenshtein distance between two sequences of items $s$ and $s'$ computes the minimal number of insertions, deletions, and replacements necessary to turn $s$ into $s'$ (and vice-versa).
This problem can equally be formulated as that of aligning the items of $s$ and $s'$:
each item of $s$ can be paired either with an item from $s'$ (signifying a conservation if both items match, or a replacement if the two items are different), or with nothing (signifying a deletion in the transformation of $s$ into $s'$).
Symmetrically, items from $s'$ can also be paired with nothing (aside from being paired with items from $s$), signifying an insertion in the transformation of $s$ into $s'$.
In this formulation, insertions and deletions are merged into the same operation:
a "gap" (or "indel"), found either in $s$ or in $s'$.
As we will now see, this problem has become extremely important over the last 50 years in the subfield of bioinformatics known as sequence alignment.

Sequence alignment is in the business of looking for similarities between sequences of DNA, RNA, or amino acids in proteins that could indicate evolutionary or structural relationships between two or more species.
Research on this task has led to the development of several generalisations of the algorithm underlying the Levenshtein distance;
these are geared towards assigning different weights or costs to the individual operations transforming one sequence into the other, finding optimal alignments of subparts of the two sequences (a task known as local alignment, in contrast to global alignment), or aligning more than two sequences simultaneously (multiple sequence alignment, in contrast to pairwise alignment).

The problems tackled are strikingly similar to our present task:
we aim to decompose the transformation from a parent utterance to a child utterance into small basic operations.
In sequence alignment terms, this task is a pairwise global alignment of lists of words, for which the Needleman-Wunsch algorithm [@needleman_general_1970, henceforth NW] provides a flexible generalisation of the Levenshtein distance.
For two sequences of items of any type, $s$ and $s'$, the NW algorithm assigns different scores to each basic operation (gap, mismatch a.k.a. replacement, and match, which is considered a scored operation like the first two), and returns the list of alignments between $s$ and $s'$ with maximal total score (there can be several such alignments that achieve the maximal total score).
Each alignment can be directly interpreted as a list of operations to transform $s$ into $s'$ (or vice-versa).

More precisely, let us note $s = (s_1, ..., s_n)$ and $s' = (s'_1, ..., s'_{n'})$ the items in both sequences, with $n$ and $n'$ the lengths of the sequences.
The NW algorithm returns pairs of sequences $a$ and $a'$ of lengths $m = \max(n, n')$, made of the items from $s$ and $s'$ (respectively), in the same order, but interspersed with a "gap item" which we note $g$.
Noting $a = (a_1, ..., a_m)$ and $a' = (a'_1, ..., a'_m)$, each pair $(a_i, a'_i)$ represents the pairing of an item from $s$ with an item from $s'$ (either match or mismatch), or with a gap if $a'_i = g$ (and vice versa if $a_i = g$).
Considered as a transformation from $s$ to $s'$, gaps in $a'$ represent deletions, and gaps in $a$ represent insertions.
$a$ and $a'$ are such that the sum of scores of the operations they represent is maximal.

Take for instance the DNA sequences $s =$ AGAACT and $s' =$ GACG.
An example alignment between the two sequences can be represented as follows (with the gap item represented as "-", and matches shown with vertical bars):

\begin{align*}
  a  = & \text{\texttt{ AGAACT-}} \\
       & \text{\texttt{  | ||}} \\
  a' = & \text{\texttt{ -G-AC-G}}
\end{align*}

The power of the NW algorithm is that gap, mismatch and match scores can be defined at compute time, knowing what items are being compared (or evaluated for a gap), and what operations would have been made up to that point if this operation were to be part of an optimal alignment.
This flexibility has been used in biological sequence alignment to account for the fact that, in a DNA sequence for instance, the deletion of a base in the middle of an otherwise intact portion of DNA is less probable than the continuation of a gap that has already started.
In other words, in biological sequence alignment opening a new gap is more costly than extending an existing gap, and the compute-time scores of gaps can reflect that.
The same goes for mismatches:
not all bases are equally likely to replace another base, and mismatch scores can factor that into the evaluation of alignments.
As is hopefully clear by now, the situation is strikingly similar for sequences of words.
In the next sections we detail our application and extension of the NW algorithm to decomposing utterance transformations.


#### Application to utterance alignment

The NW algorithm can be straightforwardly applied to sequences of any kind, provided we define scores for opening and extending gaps and a function to evaluate the comparison of two items (henceforth the match scoring function).
We chose to use the algorithm on sequences of words, excluding punctuation, with a match scoring function that takes into account the semantic distance between the two word compared.
For a given pair of utterances $u$ and $u'$, we start by tokenising them and removing all punctuation.
We then apply the NW algorithm on the resulting sequences of tokens, with a match scoring function computed as an affine transformation of the similarity between two words $w$ and $w'$:

$$
\text{similarity}(w, w') = \begin{cases}
  S_C \left( \vec{w}, \vec{w}' \right) & \text{if we have word vectors for both $w$ and $w'$} \\
  \delta_{\text{lemma}(w), \text{lemma}(w')} & \text{otherwise}
\end{cases}
$$

where $S_C$ is the cosine similarity function (one minus cosine distance) and $\vec{w}$ is a 300-dimensional vector representation of $w$ encoding the word's semantics,
^[The standard spaCy English language model includes "vectors for one million vocabulary entries, using the 300-dimensional vectors trained on the Common Crawl corpus using the GloVe algorithm" (\url{https://alpha.spacy.io/docs/usage/word-vectors-similarities}).
The GloVe algorithm was developed by @pennington_glove:_2014.
]
such that the $S_C(\vec{w}, \vec{w}')$ provides a measure of semantic similarity between $w$ and $w'$.
Finally, $\delta_{i,j}$ is Kronecker's delta which equals 1 if and only if $i = j$, and 0 otherwise.
This function thus provides a "best effort" similarity measure which depends on whether we have detailed information about the words being compared or not.

Adding an affine transformation to similarity lets us adjust its importance with respect to gap scores, for which we only differentiate opening and extension scores.
This definition thus uses an initial 4 scalar parameters (two gap scores, two affine parameters) that define the way each operation is scored against the others.
Since the final score of an alignment is computed as the sum of the scores of its individual operations, a linear scaling of all the parameters by the same amount does not change the choice of best-scoring alignments, such that we can further reduce the number of parameters by one.
We choose to set the slope of the affine transformation of similarity to 1, and are then left with 3 alignment parameters:

* $\beta_{mismatch}$, the base score for the match scoring function, such that
  $$\text{score}(w, w') = \text{similarity}(w, w') + \beta_{mismatch}$$
* $\beta_{open}$, the score for opening a gap;
  $\beta_{open}$ is negative since it is a cost,
* $\beta_{extend}$, the score for extending a gap;
  $\beta_{extend}$ is also negative.

Given the right set of parameters, this tool lets us align two utterances and obtain the minimal set of operations that transform one into the other.
Take for instance the following two utterances from Experiment 3:

> "Finding her son, Alvin, 69, hanged, Mrs Hunt, of Brighton, was so depressed she could not cut him down."  <!-- #2033 -->

> "Finding her son Arthur 69 hanged Mrs Brown from Brighton was so upset she could not cut him down" <!-- #3790 -->

\todo{use labelled lists for quotes}

With the set of parameters that we obtain through optimisation as explained below the procedure aligns these two utterances as follows (noting any gaps with "-", and colouring emphasising replacements):

\begin{quote}
\begin{alltt}
\small
Finding her son \emph{\textcolor{Sepia}{Arthur}} 69 hanged Mrs \textcolor{BrickRed}{Brown from} -    -  Brighton was so \emph{\textcolor{Sepia}{upset}}
Finding her son \emph{\textcolor{Sepia}{Alvin}}  69 hanged Mrs -     -    \textcolor{OliveGreen}{Hunt of} Brighton was so \emph{\textcolor{Sepia}{depressed}}

she could not cut him down
she could not cut him down
\end{alltt}
\end{quote}








#### Accounting for exchanges

- works well for those simple changes





#### Optimising alignment parameters

example sentence 120


### Mechanistic transformation model


### Inner structure {#sec:gistr-results-inner}


### High-level case studies


### Meaning change
