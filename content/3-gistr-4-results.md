## Results {#sec:gistr-results}

\add{a clearer outline of the analysis and the steps we're going to follow: overview of aggregate trends, then wanting to achieve a simple representations of the process through transformation-breakdown/exploration-plots/quantification-of-operations-and-deps}

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
In what follows we will focus primarily on the data set from Experiment 3, which provides the best overall quality of data and sampling of transformations.
The procedure we develop is of course applicable to the other two experiments, but we will not discuss those applications in any detail. \todo{check that.}


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
We then apply the NW algorithm
^[We used Biopython's implementation of the NW algorithm [@cock_biopython:_2009].
]
on the resulting sequences of tokens, with a match scoring function computed as an affine transformation of the similarity between two words $w$ and $w'$:

$$
\text{similarity}(w, w') = \begin{cases}
  S_C \left( \bm{w}, \bm{w}' \right) & \text{if we have word vectors for both $w$ and $w'$} \\
  \delta_{\text{lemma}(w), \text{lemma}(w')} & \text{otherwise}
\end{cases}
$$

where $S_C$ is the cosine similarity function (one minus cosine distance) and $\bm{w}$ is a 300-dimensional vector representation of $w$ encoding the word's semantics,
^[The standard spaCy English language model includes "vectors for one million vocabulary entries, using the 300-dimensional vectors trained on the Common Crawl corpus using the GloVe algorithm" (\url{https://alpha.spacy.io/docs/usage/word-vectors-similarities}).
The GloVe algorithm was developed by @pennington_glove:_2014.
]
such that the $S_C(\bm{w}, \bm{w}')$ provides a measure of semantic similarity between $w$ and $w'$.
Finally, $\delta_{i,j}$ is Kronecker's delta which equals 1 if and only if $i = j$, and 0 otherwise.
This function thus provides a "best effort" similarity measure which depends on whether we have detailed information about the words being compared or not.

Adding an affine transformation to similarity lets us adjust its importance with respect to gap scores, for which we only differentiate opening and extension scores.
This definition thus uses an initial 4 scalar parameters (two gap scores, two affine parameters) that define the way each operation is scored against the others.
Since the final score of an alignment is computed as the sum of the scores of its individual operations, a linear scaling of all the parameters by the same amount does not change the choice of best-scoring alignments, such that we can further reduce the number of parameters by one.
We choose to set the slope of the affine transformation of similarity to 1, and are then left with 3 alignment parameters:

* $\theta_{mismatch}$, the base score for the match scoring function, such that
  $$\text{score}(w, w') = \text{similarity}(w, w') + \theta_{mismatch}$$
* $\theta_{open}$, the score for opening a gap;
  $\theta_{open}$ is negative since it is a cost,
* $\theta_{extend}$, the score for extending a gap;
  $\theta_{extend}$ is also negative.

Given the right set of parameters, this tool lets us align two utterances and obtain the minimal set of operations that transform one into the other.
Take for instance the following two utterances from Experiment 3:

> "Finding her son, Alvin, 69, hanged, Mrs Hunt, of Brighton, was so depressed she could not cut him down."  <!-- #2033 -->

> "Finding her son Arthur 69 hanged Mrs Brown from Brighton was so upset she could not cut him down" <!-- #3790 -->

\todo{use labelled lists for quotes}

With the set of parameters that we obtain through training as explained below, the algorithm aligns these two utterances as follows (noting any gaps with "-", and emphasising replacements):

\begin{quote}\begin{alltt}\small
Finding her son \emph{\textcolor{Sepia}{Alvin}}  69 hanged Mrs \textcolor{BrickRed}{Hunt of} -     -    Brighton was so \emph{\textcolor{Sepia}{depressed}}
Finding her son \emph{\textcolor{Sepia}{Arthur}} 69 hanged Mrs -    -  \textcolor{OliveGreen}{Brown from} Brighton was so \emph{\textcolor{Sepia}{upset}}

she could not cut him down
she could not cut him down
\end{alltt}\end{quote}


#### Detecting exchanges

The application of the NW algorithm developed up to this point works rather well for simple transformations such as the one exemplified above.
However, more complicated transformations include operations that the algorithm as is cannot detect or represent.
Hand inspection of the data showed that exchanging sub-parts of an utterance, in particular, is a relatively common operation for which our current tool has no representation.
Consider the following two utterances from Experiment 3 for instance:

> $u_a$: "At Dover, the finale of the bailiffs convention, their duty said a speaker are delicate, dangerous and detailed" <!-- #49 -->

> $u_b$: "At Dover, at a Bailiffs convention. a speaker said that their duty was to patience, and determination" <!-- #120 -->

The current alignment algorithm, with parameters trained according to a procedure outlined below, produces the following:

\begin{quote}\begin{alltt}\small
At Dover \textcolor{BrickRed}{the finale of the} -  - \emph{\textcolor{Sepia}{bailiffs}} convention - -       -    -    their duty
At Dover -   -      -  -   \textcolor{OliveGreen}{at a} \emph{\textcolor{Sepia}{Bailiffs}} convention \textcolor{OliveGreen}{a speaker said that} their duty

\textcolor{BrickRed}{said a speaker are delicate dangerous} -   -  -        and \textcolor{BrickRed}{detailed} -            
-    - -       -   -        -         \textcolor{OliveGreen}{was to patience} and -         \textcolor{OliveGreen}{determination}
\end{alltt}\end{quote}

This alignment misses the fact that the deleted part "said a speaker" is found as "a speaker said" earlier in the reformulated utterance.
The general idea to detect such exchanges is that blocks of insertions and blocks of deletions can be matched against one another with the same alignment algorithm, and the resulting deep (recursive) alignment can be scored and compared to the initial shallow alignment.
If the final deep score $\chi_{deep}(u_a, u_b)$ is higher than the initial shallow score $\chi_{shallow}(u_a, u_b)$, then we adopt the deep alignment with exchange as the best solution.
Suppose that for the alignment of the deletion block $u_-$ "said a speaker are delicate dangerous" with the insertion block $u_+$ "a speaker said that", we are able to compute an optimal deep alignment with associated score $\chi_{deep}(u_-, u_+)$;
then the deep score for the top level $\chi_{deep}(u_a, u_b)$ is as follows:

\begin{align}
  \chi_{deep}(u_a, u_b) & = \chi_{shallow}(u_a, u_b) & & \text{start from the initial shallow score} \nonumber \\
              &\qquad {} + \theta_{exchange} & & \text{score the addition of an exchange operation} \nonumber \\
              &\qquad {} - \text{score}(\text{deletion of }u_-) & & \text{recover the cost of the deletion block} \nonumber \\
              &\qquad {} - \text{score}(\text{insertion of }u_+) & & \text{recover the cost of the insertion block} \nonumber \\
              &\qquad {} + \chi_{deep}(u_-, u_+) & & \text{add the deep alignment score of the exchange} \label{eq:exchange-score}
\end{align}

where $\theta_{exchange}$ is a new negative parameter that defines the cost of creating an exchange, to be added to the existing three shallow alignment parameters.
The deep alignment extension we implemented follows exactly that recursive principle, but accommodates for the possibility of multiple exchanges at each level of the recursion.
Algorithm \ref{alg:deep-alignment} provides an overview of the way this tree of alignments can be constructed.
Note that for long utterances, the size of the deep alignment tree can grow very fast:

* For a given deep alignment, there is a list of mappings between deletion and insertion blocks,
* Each mapping is a set of (deletion block, insertion block) pairs,
* Under each such pair, there is a list of deep alignments;
  and from there on recursively.

\begin{algorithm}
\caption{An implementation of the deep alignment extension for detecting exchanges in NW alignments.
Note that this implementation is grossly inefficient, but presentationally clearer than the implementation we made.
}
\label{alg:deep-alignment}
\begin{algorithmic}
\Function{shallowalign}{$u$, $u'$}
  \State (Implemented by Biopython)
  \State \Return List of optimal shallow alignments of $u$ and $u'$
\EndFunction \\

\Function{mappings}{$a_{shallow}$}
  \State $\mathcal{D}\gets \{d | d\text{ deletion block in }a_{shallow}\}$
  \State $\mathcal{I}\gets \{i | i\text{ deletion block in }a_{shallow}\}$
  \State \Return $\mathcal{D}^{P(\mathcal{I})}$ \Comment{$P(\Omega)$ is the power set of $\Omega$}
\EndFunction \\

\Function{scoremapping}{$a_{shallow}$, $D_M$}
  \State $s\gets 0$
  \For{$((u_{e,-,} u_{e,+}), D_e)$ in $D_M$}
    \State $s\gets s + \theta_{exchange}$
    \State $s\gets s - \Call{score}{\text{deletion of }u_{e,-}} - \Call{score}{\text{insertion of }u_{e,+}}$
    \State $s\gets s + \max\{\chi_{deep}(a_{deep}) | a_{deep} \in D_e\}$
  \EndFor
  \State \Return $s$
\EndFunction \\

\Function{deepalign}{$u$, $u'$}
  \State $D\gets []$ \Comment{$D$ is the list of deep alignments trees we have explored}
  \For{$a_{shallow}$ shallow alignment in \Call{shallowalign}{$u$, $u'$}}
    \If{$a_{shallow}$ has no gaps or has only gaps}
      \State $D\gets (a_{shallow}, [], \chi_{shallow}(a_{shallow}))$
    \Else
      \For{$M$ mapping in \Call{mappings}{$a_{shallow}$}}
        \State $D_M\gets []$
        \For{$(u_{e,-}, u_{e,+})$ exchange in $M$}
          \State $D_M\gets D_M + ((u_{e,-}, u_{e,+}), \Call{deepalign}{u_{e,-}, u_{e,+}})$
        \EndFor
        \State $D\gets D + (a_{shallow}, D_M, \chi_{shallow}(a_{shallow}) + \Call{scoremapping}{a_{shallow}, D_M})$
      \EndFor
    \EndIf
  \EndFor
  \State \Return Recursively pruned version of $D$ with only maximally scoring deep alignments
\EndFunction
\end{algorithmic}
\end{algorithm}

Also, our implementation of the exploration of that tree is mostly brute force, and does not try to be smart in predicting which branches are dead-ends.
In spite of this, we did not need to optimise the computation any further (aside from obvious gains in caching repeated computations), as most of the time of a deep alignment is spent computing shallow alignments, and most alignments of utterances are very shallow anyway.
Finally, note that this approach provides no guarantee of finding the globally optimal deep alignment.
Indeed, it starts from optimal shallow alignments, and explores the tree of possibles from there on.
But the initial shallow alignments it extends may not be the best starting point, such that the exploration may return locally optimal deep alignments.

Nonetheless, given a good set of parameters (see the next section where we derive those), this deep alignment algorithm produces surprisingly satisfying results given the simplicity of its underlying principles.
In the case of the two utterances exemplified at the beginning of this section, the algorithm produces the following deep alignment tree.
First, the top-level alignment:

\begin{quote}\begin{alltt}\small
At Dover \textcolor{BrickRed}{the finale of the} -  - \emph{\textcolor{Sepia}{bailiffs}} convention \textcolor{RoyalBlue}{|-Exchange-1------|} their duty
At Dover -   -      -  -   \textcolor{OliveGreen}{at a} \emph{\textcolor{Sepia}{Bailiffs}} convention \textcolor{RoyalBlue}{a speaker said that} their duty

\textcolor{RoyalBlue}{said a speaker are delicate dangerous} -   -  -        and \textcolor{BrickRed}{detailed} -            
\textcolor{RoyalBlue}{|-Exchange-1------------------------|} \textcolor{OliveGreen}{was to patience} and -        \textcolor{OliveGreen}{determination}
\end{alltt}\end{quote}

For which $\chi_{shallow} = -2.93$ and $\chi_{deep} = -2.89$.
Then the alignment of Exchange 1:

\begin{quote}\begin{alltt}\small
\textcolor{RoyalBlue}{said} a speaker \textcolor{BrickRed}{are delicate dangerous} \textcolor{RoyalBlue}{|E2-----|}
\textcolor{RoyalBlue}{|E2|} a speaker -   -        -         \textcolor{RoyalBlue}{said that}
\end{alltt}\end{quote}

For which $\chi_{shallow} = -1.01$ and  $\chi_{deep} = -0.99$.
And finally the alignment of Exchange 2, from inside Exchange 1:

\begin{quote}\begin{alltt}\small
said -    
said \textcolor{OliveGreen}{that}
\end{alltt}\end{quote}

For which $\chi_{shallow} = \chi_{deep} = -0.18$.

Notice how in this deep alignment the phrase "are delicate and dangerous" was initially included in Exchange 1, only later to be recognised as a deletion in the alignment of Exchange 1.
The same happened for "that", initially included in Exchange 1 and finally recognised as an insertion in the alignment of Exchange 2.
Most cases of deep alignments look like this one, where a single path exists in the tree of recursive alignments.
For longer utterances however, there can be several exchanges at each level, and the tree of alignments becomes much larger.


#### Training alignment parameters

To finish the development of our alignment tool, it is necessary to determine a set of alignment parameters that produce plausible results.
Recall that the parameters are:

* $\theta_{mismatch}$, the base score for the match scoring function,
* $\theta_{open}$ and $\theta_{extend}$, the scores for opening and extending a gap,
* $\theta_{exchange}$, the score for creating an exchange.

In order to make the problem of finding usable parameters tractable, we decided to restrict parameter training to the shallow alignment parameters only (henceforth noted $\bm{\theta} = (\theta_{mismatch}, \theta_{open}, \theta_{extend})$), and fine-tune $\theta_{exchange}$ by hand after the first three were defined (this also corresponds to the fact that deep alignments are made on the basis of optimal shallow alignments).
Our general approach for this task is therefore to hand-code shallow alignments for a random set of utterance transformations in Experiment 3, train the shallow alignment parameters to that standard, before adjusting the exchange parameter by hand.
Since the there are only three dimensions to explore, the training step is easiest to accomplish by brute force.

We thus start by evaluating the size of the training set that is necessary to obtain a set of parameters that extrapolates well to untrained data.
Indeed, a training set too small in size might provide too weak a constraint on the set of parameters, such that brute forcing would find many parameter sets that do not extrapolate well.
On the other hand, manually coding alignments is time-consuming and we do not wish to code more than necessary.
We used the following procedure to decide this trade-off:

1. Uniformly sample a random parameter set $\bm{\theta}^0 \in [-1, 0]^3$ and use it to generate artificial alignments for all the non-trivial transformations in Experiment 3 (i.e. for which the transformation rate $\rho$ was positive, which amounts to 2159 transformations);
   note these alignments $\mathcal{A}^0$.
2. Sample a training set of size $n$ from the artificial alignments;
   note the training set $\mathcal{A}_t^0$, and the remaining evaluation set $\mathcal{A}_e^0 = \mathcal{A}^0 \setminus \mathcal{A}_t^0$.
3. Brute-force the sets of parameters $\hat{\bm{\theta}}_1, ..., \hat{\bm{\theta}}_m$ that best reproduce the training set $\mathcal{A}_t^0$, by exploring the sampling space $[-1, 0]^3$ with a discretisation step of.1;
   parameters that perfectly reproduced the training set were always found, such that no finer-grained exploration was needed.
4. Evaluate the worst fit $\hat{f}_n$ between the evaluation alignments $\mathcal{A}_e^0$ and the alignments produced by each of the $\hat{\bm{\theta}}_1, ..., \hat{\bm{\theta}}_m$ on the same transformations.

For a given set $\mathcal{T}$ of transformations, the alignments generated by parameters $\bm{\theta}$ can be written:

$$A\left(\mathcal{T}, \bm{\theta}\right) = \left\{ \text{aln}(u, u', \bm{\theta}) | (u, u') \in \mathcal{T} \right\}$$

Where $\text{aln}(u, u', \bm{\theta})$ is the set of alignments between $u$ and $u'$ produced by $\bm{\theta}$.
$A\left(\mathcal{T}, \bm{\theta}\right)$ is thus a set of sets of individual shallow alignments (indeed each pair of utterances generates its own set of shallow alignments).
The fit between two such sets of sets of alignments $A\left(\mathcal{T}, \bm{\theta}_1\right)$ and $A\left(\mathcal{T}, \bm{\theta}_2\right)$ is then computed as:

$$
f(\mathcal{T}, \bm{\theta}_1, \bm{\theta}_2) =
  \frac{1}{2}
  \sum_{(u, u') \in \mathcal{T}}
    \max_{((a_1, a'_1), (a_2, a'_2))
      \in \text{aln}(u, u', \bm{\theta_1}) \times \text{aln}(u, u', \bm{\theta_2})}
    \left\{
      \text{lev}(a_1, a_2) + \text{lev}(a'_1, a'_2)
    \right\}
$$

\todo{unify mathematics notations}

The value of the fit thus loosely corresponds to the total number of words whose alignments would need to be changed in order to go from one set of alignments to the other.
Divided by the number of transformations $|\mathcal{T}|$, it tells us the average number of word alignment errors per transformation.
The worst fit $\hat{f}_n$ then gives us an upper bound estimation of the error that can be produced by training on a set of size $n$.
One caveat in this evaluation approach is that there is no guarantee that the hand-coded alignments on which we will train could be produced by this parametrisation of alignments.
We have no workaround for this caveat, other than hand-evaluation of the parameters after the training step.

After having sampled a parameter set for step 1, we used $n = 20, 50, 100, 200$ and ran steps 2-4 ten times for each value of $n$.
The worst values of the ten runs were $\hat{f}_{20} = 3652.5$ (1.71 errors per transformation), $\hat{f}_{50} = 1377.5$ (.65 errors per transformation), $\hat{f}_{100} = 847$ (.41 errors per transformation), and $\hat{f}_{200} = 636.5$ (.32 errors per transformation).
For $n = 100$, we further resampled $\bm{\theta}^0$ ten times (step 1) and ran steps 2-4 ten times for each of those 10 parameter sets, yielding an overall $\hat{f}_{100} = 1437.5$, that is .70 errors per transformation.
We conclude from this evaluation that a training set between 100 and 200 alignments is enough to reduce the final error below one word per transformation.

We thus developed a small console interface to hand-code 200 alignments of non-trivial transformations (see @fig:gistr-goldcli for how this is done).
The manual alignments were then used as a parameter training set, on which brute forcing the best $\bm{\theta} \in [-1, 0]^3$ with discretisation step up to .025 achieved a training fit of 240 (i.e., 1.2 errors per transformation), confirming that our hand-coded alignments are most likely not possible to reproduce perfectly with this parametrisation.
The final parameters obtained with this approach are $\theta_{mismatch} = -.89$, $\theta_{open} = -.29$, and $\theta_{extend} = -.12$.
$\theta_{exchange}$ was then set to $-.5$ after manual trial and error.

<div id="fig:gistr-goldcli">
![Before manual alignment](images/gistr/gistr-goldcli-before.png)

![After manual alignment](images/gistr/gistr-goldcli-after.png)

Console interface for manual transformation alignment.
The user moves their cursor (underline below "handed" and "Cardiff") along the word sequences to insert or remove gaps and align the two utterances by hand.
</div>

Finally, we manually evaluated the overall quality of these parameters by hand-coding the number of errors in a random set of 100 non-trivial alignments generated by the parameters.
Errors were counted as the number of words whose alignment would have to be changed in order to obtain a perfect alignment.
Of those 100 alignments, 79 were perfect, 12 had 1 error, 4 had 2 errors, and the remaining 5 had between 3 and 6 errors.
Counting 1 error as acceptable, this method yields a successful alignment in 91% percent of the cases.
To make sure this is also the case for deep alignments, we hand-coded errors in 100 random alignments for which the algorithm had explored exchanges (though not all of them are deep alignments, as it may be that the shallow alignment was the best).
An error was counted for each exchange that was missing, mistaken, or should not have been present at all.
Of the 100 alignments, 81 had no errors, 17 had 1, and 2 had 2 errors.
The parameters obtained here were thus used for all further analyses.
They are also the ones used in the example alignments discussed in the previous sections.


### Streamlining the representation of transformations

#### Word filiations

Having developed a method to reliably break down individual transformations into simpler operations, we can come back to our initial goal of synthesising the overall phenomenon with intelligible building blocks.
Ideally, we would like to know how often each basic operation of utterance alignment (deletion, replacement, exchange, conservation) is actually used by subjects, how those basic operations get grouped together, and how they depend on each other both inside a single utterance transformation and across successive transformations in branches.
In more abstract terms, we are looking for the best way to dice the complete data into its internal components;
such components need not be restricted to the level of individual utterance-to-utterance transformations, but can also span along branches and in a tree.

To do so we use the alignment tool we just developed to build a more synthetic representation of the branches.
Indeed with the information provided by each alignment it is now possible to follow the ancestry and descent of individual words through parent and child transformations in a branch.
Consider for instance a toy branch $u \rightarrow u' \rightarrow u''$.
Any word $w' \in u'$ can be identified as a new insertion or affiliated to a parent word $w \in u$ that was conserved, replaced, and/or moved in an exchange.
On the child side, $w'$ can also be linked to its child $w''$ (if it wasn't deleted), thus continuing the lineage of this specific word along the branch.
^[Note that the alignment tool produces a tree of possible deep alignments for each pair of utterances, such that a word in $u$ could be assigned to different words in $u'$ for different choices of deep alignments.
To decide this uncertainty for a given word $w$ we first determine if it is conserved (either exactly or through replacement) in at least of all the deep alignments;
if so, we select the child word in $u'$ which appears in most deep alignments (i.e. the majority child);
if not, the operation is considered a deletion.
Any word in $u'$ that has no assigned parent word is considered an insertion.
]

@Fig:gistr-lineage-tree gathers this information and plots the lineages of the branches for an example tree from Experiment 3 (tree #4, also shown in @fig:gistr-trees).
The root of this tree is the following utterance:

> « At Dover, the finale of the bailiffs' convention. Their duties, said a speaker, are "delicate, dangerous, and insufficiently compensated." » <!-- #4 -->

and the example transformation discussed in our introduction of deep alignments (\todo{add refs for sentences}) corresponds to the transition from depth 1 to depth 2 in branch #49 of the figure.
This representation of branches provides our most synthetic view yet of the process at work.
Stepping back, we can now examine which trends are more salient in the evolution along the branches.
First observations are that the plots reflect the rapid shortening of utterances, and that transformations are less important on shorter utterances.
We also see here that word replacements, the process studied in the previous chapter with data from blogspace, is quite speckled, and both less frequent and of smaller magnitude than word deletions and word insertions.
This obvious caveat was one of the motivations for our current experimental approach (indeed, replacements were the only process that could be extracted from the blogspace data set).

![Example lineages for all the branches of tree #4 from Experiment 3.
Each subplot corresponds to a different branch.
The horizontal axis is the depth in the branch, and the vertical axis is the index of each word in its utterance.
A grey line represents a word lineage along the branch, and the darkness of the line corresponds to that word's frequency (darker lines represent more frequent words).
At each depth, the darker background band indicates what the subject sees, and the lighter band indicates the transformation that the subject made.
Inside lighter bands:
red dots are word deletions, green dots are word insertions, blue dots are word replacements, and exchanges can be seen when bundles of lines cross each other.
Dots inside each light band are spread out on the horizontal axis so as make them easier to distinguish visually, but the horizontal position of a dot inside its band has no further meaning.
](images/gistr-computed/exp_3/lineage-tree-4.png){#fig:gistr-lineage-tree}


#### Branch and utterance axes

The plots show noticeable regularities in the way transformations vary.
For a given branch, we distinguish between the two axes of @fig:gistr-lineage-tree as two scales of analysis, each of which corresponds to a different set of events.
First the horizontal axis:
an event at this level is the bulk transformation or conservation of an utterance by a subject, without going into the detail of the way an utterance changes.
This yields a series of conservation and transformation events, one at each depth in the branch.
We call this the branch dimension, pictured in @fig:gistr-dimensions-branch.
A salient feature on this dimension is the apparent burstiness of transformations.
Since successive subjects perform transformations independently, confirming this trend would indicate a behaviour reminiscent of punctuated equilibria:
a transformation occurring after a period of stability would result in a new utterance that is more likely to be transformed again (we quantify this trend below).

Second, the vertical axis where we delve into the detail of a transformation seen as a set of word insertions, deletions, conservations and replacements with or without exchange.
Call this the utterance dimension.
At this stage of our analysis, an ideal tool to quantify the properties of transformations in the utterance dimension would be a generative model of the transformative process.
Unlike in the branch dimension however, the transformation of an utterance is a multi-level process that does not reduce easily to an ordered series of events.
Indeed, manually inspecting the branches' transformations indicated several trends that complicate potential generative models (several of these are visible in @fig:gistr-lineage-tree):

* Deletions, exchanges, and insertions seem bursty (that is they appear in large chunks -- a behaviour that replacements do not seem to have), and the bursts seem often longer if the utterance they appear in is longer,
* Insertions seem to rarely occur without deletions;
  when they appear with deletions, the two tend to be close to each other and of similar magnitude,
* All operations are less frequent at the very beginning of utterances.

Note that burstiness at the word level is no surprise, as words are not processed independently and transforming parts of an utterance is likely to depend on syntactic and semantic boundaries.
However, combined with the dependencies between the sizes and positions of insertions and deletions, and the possibility for exchanges, it means that a full generative model capable of reproducing and predicting future transformations will most likely involve memory and attention span mechanisms that are beyond the scope of this chapter.
We therefore wish to extract the regularities of individual utterance transformations without modelling their genesis.

To do so we still need a canonical representation of transformations whose properties we can examine without being biased by our choice of representation (such a representation could be the output of a generative model).
Recall that the alignment tool we developed encodes a transformation as a pair of word sequences with gaps, an encoding that is not unique:
insertions and deletions that happen together can be reordered (putting insertions before deletions instead of the other way around, or alternating an insertion with a deletion), and the exchange of two parts around a stable chunk can be re-encoded by inverting the roles of stable and exchanged chunks, all without changing the transformation represented by the encoding.
Running statistics on this representation is thus not an option.
However, compressing the gaps in this representation merges all the variations together and produces an encoding that is in bijection with transformations.
This compressed representation of a transformation is precisely what the lineage plots of @fig:gistr-lineage-tree achieve, through another path.
^[The lineage plots are built horizontal line by horizontal line, by following the path of each word along the branch, not by compressing utterance transformations.
]
We picture this correspondence between the transformation diagram produced by lineage plots and the compressed form of alignment sequences in @fig:gistr-dimensions-utterance.
We thus take these diagrams as our canonical representation of a transformation.

In what follows we further set aside part of the information provided by exchanges.
The natural way of analysing an exchange in a transformation diagram is to look at it as the permutation of the words affected, with possible replacements, insertions and deletions added afterwards.
We chose to leave the analysis of this aspect of transformations to further research, focusing instead on insertions, deletions, and replacements only.
We therefore simplify exchanges to keep only the information on whether an exchanged word was conserved or replaced.
^[Note that while we do not analyse exchanges per se, we still benefit from the deep alignment tool developed:
the insertions and deletions we are left with correspond to real appearances and disappearances, not undetected exchanges.
]

From a given transformation diagram we then extract two arrays of word-level operations,
^[We use the phrase "array of operations", and not "series of events", to emphasise that these operations appear linearly in the utterances, but do not necessarily come from a sequential generation process.
The two terms refer to the same mathematical object, and simply change the interpretation of the index:
for a series of events the index represents time, for an array of operations it does not.
]
one for the parent utterance and one for the child utterance.
The parent array contains conservation, replacement and deletion operations, and the child array conservation, replacement and insertion operations.
The diagram further provides us with the correspondence of conservation and replacement operations between the two arrays (except for operations that were involved in an exchange, for which we lose position information), such that we can measure the distance between two blocks of insertion and deletion operations (except if the two blocks are separated by operations involved in an exchange).
This final representation of transformations is pictured in @fig:gistr-utterance-arrays.

<div id="fig:gistr-dimensions">
![Branch dimension.
This level looks at whether or not an utterance is transformed, without going into the detail of changes (hence the greyed out dots).
Similar to @fig:gistr-lineage-tree, light grey bands are what subjects see, and the bands between those represent what the subjects do with what they read.
An orange band indicates that an utterance was transformed, that is a T event, and a dark grey band indicates that an utterance was perfectly conserved, that is a C event.
The corresponding ordered series of events is shown underneath the axis' arrow.
](images/gistr/gistr-dimensions-branch.pdf){#fig:gistr-dimensions-branch}

![Utterance dimension.
This level looks at the detail of a transformation, and represents it with a diagram that compresses the pair of sequences produced by aligning parent and child utterances.
This diagram uniquely represents the transformation, and merges any variations in encoding that can exist in pairs of sequences with gaps.
The top level of the figure shows how the canonical representation comes from the lineage plots.
The bottom level shows two equivalent encodings of the same transformation (as would be produced by the alignment tool), which compress to the same canonical representation.
](images/gistr/gistr-dimensions-utterance.pdf){#fig:gistr-dimensions-utterance}

![Parent and child arrays of operations.
The canonical representation is further simplified by discarding the change in position encoded by word exchanges, and only keeping the information on whether a word is conserved or replaced.
This procedure results in two arrays of word operations:
a parent array made of conservations (C), replacements (R) and deletions (D), and a child array made of conservations, replacements and insertions (I).
Conservations and replacements in the parent array, if not involved in exchanges, are linked to their corresponding operation in the child array, such that we can compute the distance between a block of insertions in the child and a block of deletions in the parent (except when exchanges separated the blocks).
](images/gistr/gistr-utterance-arrays.pdf){#fig:gistr-utterance-arrays}

Analysis dimensions.
Transformations are analysed along two dimensions.
The branch dimension only looks at whether utterances are transformed or not, thus sees a series of T (transformed) and C (conserved) events.
The utterance level looks at the detail of the transformations, and after simplification represents them with two arrays of operations, one for the parent utterance (made of C, R and D operations) and one for the child utterance (made of C, R and I operations).
This example is built on branch #49 from @fig:gistr-lineage-tree.
\todo{Make this work in grayscale}
</div>


#### Bursty behaviours

We now wish to quantify the regularities of transformations on both dimensions.
Our first step is to measure the extent to which each dimension does indeed feature bursty behaviour.
Following @jo_circadian_2012 [who rely on @goh_burstiness_2008], we measure the burstiness of a series of events through the parameter $B$ defined as

$$B = \frac{\sigma - \mu}{\sigma + \mu}$$

where $\sigma$ and $\mu$ are respectively the standard deviation and mean of the distribution of inter-event times in the series of events.
The same computation applies to arrays of operations (the two have the same mathematical description).
$B$ has values between -1 and 1;
$B = -1$ corresponds to a perfectly regular process ($\sigma = 0$, and $\mu > 0$ is the constant period between events), $B = 0$ indicates a burstiness equivalent to that of a Poisson process, where the occurrence of a new event does not depend on the presence of previous events (and $\sigma = \mu$), and $B = 1$ corresponds to an asymptotically perfectly bursty process (it is the limit $\sfrac{\mu}{\sigma} \rightarrow 0$).
In other words, $B$ measures the intuition according to which a process with average inter-event time shorter than its standard deviation will often have events close to each other with a few long periods without events, and a process with an average inter-event time longer than its standard deviation will have events more evenly spaced (relative to their mean spacing).

In the branch dimension, we consider a transformation to be an event and a conservation to be the absence of an event.
Note that our data in this dimension is truncated due to branches not being infinite.
When the last subject in a branch does not transform the utterance they reproduce, we do not observe the actual duration of that stability:
had the branch continued, the stability could have been interrupted immediately, or could have lasted for many more reproductions of the utterance.
Including these truncated spans in the distribution of inter-event times artificially inflates the burstiness (because it adds underestimated spans to the distribution), but removing them biases our sample towards inter-event times for longer utterances (earlier in the branch), which could also inflate burstiness.
We thus present measures for both distributions, with and without the truncated spans.

Burstiness in the branch dimension with truncated spans is $B_{branch,all} = 0.251 \pm 0.029$, and burstiness without the truncated spans is $B_{branch,observed} = 0.305 \pm 0.031$ (both error estimates correspond to the 95% confidence interval).
Both measures show that the transformation process in the branch dimension is significantly bursty.
This is consistent with our intuition that when a transformation appears after a period of stability, it is likely to trigger other transformations following it until a new stable (often much shorter) utterance is reached.

The situation in the utterance dimension involves more event types.
In the parent array, we note the series of deletion events $\mathcal{D}$ and the series of replacements $\mathcal{R}_p$.
In the child array, we note the series of insertion events $\mathcal{I}$ and the series of replacements $\mathcal{R}_c$.
A conserved word is considered an absence of event.
Note that because of inserted and deleted words, replacements may not appear with the same distributions in the parent and child arrays.
As a consequence, $\mathcal{R}_p$ and $\mathcal{R}_c$ may not have the same distribution of inter-event times.
The burstiness measures for each of these series are shown in @fig:gistr-utterance-burstiness-words, along with the burstiness of the series made of all parent or child events without distinguishing their type.
The plots show that deletions and insertions are both bursty, while replacements are undistinguishable from a non-bursty process such as a Poisson process.
When all event types are joined together, the process is also bursty, albeit slightly less.

Given the strength of this behaviour for deletions and insertions, we further look at these series by collapsing each contiguous chunk of deleted or inserted words into a single event.
This leads to a series of deletion and insertion chunks separated by word replacements and word conservations (non-events).
For inter-event times, it corresponds to removing the null values in the previous distributions of inter-event times (which separated words in the same chunk);
computing the burstiness of the chunk process is therefore straightforward.
The values plotted in @fig:gistr-utterance-burstiness-chunks show that none of the chunk processes are bursty;
rather, they are slightly more regular than a Poisson process would be.

Although this behaviour is consistent with our intuition of the way an utterance is reformulated, there is a question as to whether the alignment tool we developed does not favour burstiness.
In other words, are these measures not due to artefacts?
Indeed, the scores of operations are parametrised in such a way that insertion and deletion gaps are assigned different costs for initial opening and extension.
Let us answer this concern.
While the parametrisation of costs does make it possible for burstiness to be more easily identified, it does not make it a necessity:
setting the gap opening cost to the same value as the gap extension cost would make the alignment tool neutral with respect to burstiness (setting it lower would be biased against burstiness, and the alignment algorithm would favour word mismatches over gaps to encode differences).
In our case, the parameters we trained set the gap opening cost to a much higher value than the extension cost (.29 vs. .12 in absolute values), such that the alignment tool does find bursty insertions and deletions more easily.
However, these parameters are learned from hand-coded alignments and their output has been validated on test samples:
any bursty insertions or deletions detected by the alignments is therefore the product of the data itself.

We now move on to further characterising the size, position, and dependencies between replacements and insertion and deletion chunks.

<div id="fig:gistr-utterance-burstiness">
![Burstiness of word operations
](images/gistr-computed/exp_3/burstiness-words.png){#fig:gistr-utterance-burstiness-words width=58%}
![Burstiness of chunks
](images/gistr-computed/exp_3/burstiness-chunks.png){#fig:gistr-utterance-burstiness-chunks width=42%}

Burstiness of operations in the utterance dimension.
The left pane shows the burstiness of each type of word-level operation (in parent and child arrays), as well as the burstiness of the series made of all operations joined regardless of their type.
The right pane shows the burstiness for deletions, insertions, and joined events, where contiguous blocks of operations are collapsed into single events.
This corresponds to the burstiness of *chunks* of deletions, insertions, and joined events (i.e. only considering strictly positive inter-event times).
Grey lines are the 95% confidence intervals. \todo{FIXME: this is counting each tree as an independent measure, whereas what follows counts each sentence as an independent measure.}
</div>


### Inner structure {#sec:gistr-results-inner}

#### Position and utterance length

Transmissibility measures already showed us that longer utterances are transformed more, but we are now in a position to detail how exactly do transformations depend on the size of the utterance.
We begin by looking at the probability of each operation as a function of utterance length.
@Fig:gistr-ops-prob plots the logistic regression of the presence or absence of deletions, insertions, and replacements (on the parent side) as a function of the number of words in the parent utterance.
(Child side replacements are similar to the parent side, so we omit them in the interest of readability.)
The length of the parent utterance has a significant effect on all three operations, with deletions being the quickest to increase in probability, followed by replacements then insertions:
the threshold for having deletions over half the time is 19 words, 22.6 for replacements, and 28.1 words for insertions;
the slopes of the regressions are also ordered this way.
In other words, a longer utterance will have a higher risk for all operations, and the increase is strongest for deletions, then for replacements, then for insertions.

@Fig:gistr-ops-count further shows the number of operations as a function of parent utterance length, either counting one for each word affected or counting one for each contiguous chunk of words affected.
The number of word and chunk operations increases close to linearly as a function of parent length.
Deletions have by far the strongest link to parent length, both at the word and chunk levels, followed by insertions then replacements.
Note that the replacement counts barely change between word and chunk level since this operation is not bursty:
it affects mostly isolated words instead of chunks of words.
In short, a longer utterance has a higher probability of suffering any type of operation, with on average over a quarter of the words deleted, the equivalent of a fourteenth of the original utterance in new words, and about a twentieth of the words replaced.

<div id="fig:gistr-ops-counts">
![Probability of word operations w.r.t. parent length, computed as the log-odds logistic regression of the presence or absence of a given operation in the transformation of $u_p$ (parent) into $u_c$ (child), versus the number of words in $u_p$.
Colours correspond to the colour-coding used in @fig:gistr-lineage-tree.
Light shades are 95% confidence intervals.
](images/gistr-computed/exp_3/p-ops_parent-length_logistic.png){#fig:gistr-ops-prob}

![Number of word and chunk operations w.r.t. parent length.
Parent lengths are binned into 5 quantile-based bins.
Word operations counts the number of individual words affected by an operation (deletion, insertion, replacement).
Chunk operations counts the number of contiguous chunks of words affected by an operation.
Light shades and vertical bars are 95% confidence intervals.
](images/gistr-computed/exp_3/chunk-size_parent-length.png){#fig:gistr-ops-count}

Probability and number of word-level or chunk-level operations.
</div>

Manual exploration of the lineage plots also indicated that operations are not positioned evenly in the utterances.
To quantify this behaviour we apply the susceptibility measure developed in the previous chapter to positions in an utterance.
For words at position $x \in [0, 1]$ relative to their utterance's length ($x = 0$ for words at the beginning, $x = 1$ for words at the end), the susceptibility $\sigma_O(x)$ to an operation $O \in \{D, I, R\}$ is defined as the ratio of $s_O(x)$, the number of times words at relative position $x$ are the target of operation $O$, to $s_O^0(x)$, the number of times those words would be the target of operation $O$ if the choice of words were random:
^[Since operations in a given transformation are not independent, we scale both $s_O(x)$ and $s_O^0(x)$ such that each transformation has a maximum contribution of 1 to the total counts.
This procedure is similar to the susceptibility scaling approach we followed in the previous chapter.
]

$$\sigma_O(x) = \frac{s_O(x)}{s_O^0(x)}$$

@Fig:gistr-susc-ops plots $\sigma_O$ for deletions, insertions, and replacements (on the parent side) both overall and for binned parent lengths.
The leftmost plots show that deletions and insertions are half as likely to appear at the very beginning of utterances as they would at random, and more likely than random in the second half of utterances.
This is similar to the well-known primacy effect in recall of word lists.
In this case, subjects transform much less the beginning of utterances compared to the rest.
Replacements also feature this primacy effect to lesser extent, to which a slight recency effect is added:
words at the extremities end of the utterance are slightly less replaced than non-extremity words.
The plots at binned parent lengths show little to no variation in these patterns:
mostly, the patterns are more or less marked depending on the parent sentence length (especially for replacements, which seem more uniform for short utterances), but the general behaviour is the same for different parent lengths.

<div id="fig:gistr-susc-ops">
![Deletions
](images/gistr-computed/exp_3/susceptibility-del_position_parent-length.png){#fig:gistr-susc-del}

![Insertions
](images/gistr-computed/exp_3/susceptibility-ins_position_parent-length.png){#fig:gistr-susc-ins}

![Replacements
](images/gistr-computed/exp_3/susceptibility-rpl_parent_position_parent-length.png){#fig:gistr-susc-rpl}

Susceptibility for word operations as a function of relative position in the utterance.
The leftmost plot of each sub-figure (blue background) shows $\sigma$ computed over all transformations.
The plots with the white backgrounds show $\sigma$ computed over transformations with binned parent utterance lengths, indicated in the plot titles.
Parent length bins are quantile-based, that is computed to have the same number of utterances in each bin (the bins are identical to @fig:gistr-ops-count).
Light shades are the 95% confidence intervals, computed by considering each transformation as an independent event.
</div>

Finally, we examine the dependence of operation chunk size on the position it appears in an utterance.
Our manual exploration of lineage plots did not hint to any effect at this level, but the question now appears legitimate:
since subjects delete words more often towards the end of the utterances, it might be that those deletions are also longer if they correspond to larger portions of the utterances being forgotten.
@Fig:gistr-chunk-size shows the dependence of chunk size on position in the utterance, for deletions, insertions and replacements, both overall and for binned parent length.
Deletions exhibit a slight effect of position on chunk size, which is significant for parent lengths between 11 and 15 words.
^[The plots also indicate that the overall chunk size increases with parent length, a slight effect which was confirmed for deletions and insertions with dedicated regressions, but which we do not discuss further given its mildness (slopes respectively .030 and .013, both significative with $p < .001$).
]
That is, for those lengths, deletions towards the end of the utterance are significantly larger than deletions at the beginning (4.1 words versus 1.7 words on average), in addition to being more frequent (see the susceptibility plots above).
The trend is present for deletions at all lengths, though most of the time not significative.
Other operations do not seem to exhibit this behaviour.

![Chunk operation size w.r.t. parent length and position in utterance.
The leftmost plot (blue background) shows the average chunk size w.r.t. parent length for all utterances.
The plots on its right (white background) divide that data into binned parent lengths (bins identical to [@fig:gistr-ops-count;@fig:gistr-susc-ops]).
In each plot, the height of a line for a given relative position $x$ corresponds to the average size of the chunks in which words at position $x$ are found;
for instance, a chunk that spans the first half of an utterance will contribute to all the values of $x \in [0, .5]$.
Average sizes are computed such that each utterance contributes 1 unit.
Light shades are the 95% confidence intervals computed with that scaling, that is considering each transformation as an independent event.
](images/gistr-computed/exp_3/chunk-size_position_parent-length.png){#fig:gistr-chunk-size}

Overall, these measures show that deletions are more frequent than insertions, which are more frequent than replacements.
Operations happen preferentially in the second half of utterances (except for replacements favour all positions except extremities), and are proportional to the parent length in both number of words and number of chunks.
Deletion chunks are also larger in the second half of utterances, compared to in the first half.


#### Dependencies between types

- contingency table
- exchange: 50-50 with or without deletion
- when a deletion appears, it seems to increase the probability of others in the same sentence
- insertion: often (though not always) subordinated to a deletion
- insertion and deletion have similar size when close to each other


#### Feature makeup

- word makeup for each type
- branch evolution


#### Branch effects

- prob of transformation after transformation vs. overall (to confirm punctuated equilibria)
- length correction


### High-level case studies
