## Results {#sec:gistr-results}

### Descriptive observations

We begin the analysis of our three data sets by examining the evolution of aggregate measures as a function of depth in the trees.
Here and in what follows, the analyses are made on the data cleaned of spam, and chains truncated at their target depth:
the data from Experiment 1 is truncated at depth 8, Experiment 2 at depth 7, and Experiment 3 at depth 10, and all plots are aligned to the same depth axis to facilitate comparisons.


#### Utterance length

A well-known effect in transmission chains with linguistic content is the quick reduction of utterance length.
These experiments are no exception:
@fig:gistr-token-lengths shows a scatter plot of the number of words of an utterance $|u|_w$ versus depth in a tree.
The insets show the data restricted to trees for which root utterances have 30 words or less (thus most utterances in those trees also have 30 words or less);
this boundary keeps all the Fénéon root utterances in Experiment 3, and we use it to separate longer from shorter utterances for the purposes of this figure.
The plots confirm that word length quickly decreases as subjects read and rewrite utterances, and indicates that the reduction depends on the size of what is being transformed:
very long utterances (above 100 words) don't last more than 2 reformulations, whereas root utterances with up to 28 content words can survive to the end of the branches of Experiment 3.
Note that comparing this measure across experiments is not reliable, as the distributions of word counts and stopword proportions in root utterances are different for each experiment (word counts are disjoint between Experiments 2 and 3), two variables we will show are tied to transformation rate. \todo{do that.}
The higher slopes in Experiments 1 and 3 compared to Experiment 2 are thus tied to the the larger word counts and larger proportion of stopwords in the root utterances.

Next, we eliminate stopwords from the utterances and focus on the reduction in number of content words (notice however that stopword recognition is less reliable in Experiment 1 than in Experiments 2 and 3, because of spelling mistakes).
For a given utterance $u$, the list of its content words is noted $c(u)$, and the number of content words is therefore $|c(u)|_w$, where $|\cdot|_w$ is extended to provide the length of a list of words (aside from counting words in a string).
@Fig:gistr-content-lengths plots the content word counts for the same utterances as those in @fig:gistr-token-lengths (in particular, insets show the same utterances in both figures), and shows a similar reduction in counts across all experiments.
Here too, comparisons of regression values across data sets or between the two figures are unreliable, as the distributions of root content word counts and the proportion of content words for each utterance type all differ.
Instead, these figures provide a feel for the strength of the size reduction effect given the root utterances of each experiment.

<div id="fig:gistr-lengths">

![Numbers of words, $|u|_w$
](images/gistr-computed/token_lengths-tokens_m31.png){#fig:gistr-token-lengths}

![Numbers of content words, $|c(u)|_w$
](images/gistr-computed/content_lengths-tokens_m31.png){#fig:gistr-content-lengths}

Reduction in utterance word count and content word count as a function of depth ($d$) in the three experiments.
The insets show the data for root utterances with 30 or less words ($|u_{\text{root}}|_w \leq 30$), with linear regression slope and correlation coefficient.
All slopes are non-zero with $p < .001$.
</div>


#### Utterance to utterance distance

As a first approximation of the magnitude of transformations, we introduce a measure of the distance between two utterances $u$ and $u'$, which we define as the Levenshtein distance
^[The Levenshtein distance (also known as the edit distance) is defined between two lists of items, and counts the minimal number of insertions, deletions, and replacements that are needed to transform the first list of items into the second.
It has all the properties of a metric (non-negativity, identity of indiscernibles, symmetry, and subadditivity).
]
between the lemmas of the content words of $u$ and $u'$:

$$\lambda(u, u') = \text{levenshtein}\left(\text{lemmatize}(c(u)), \text{lemmatize}(c(u'))\right)$$

For example, consider the three following utterances taken from Experiment 1 (in a tree whose root is from the MemeTracker data set):

* $u_a$: "This crisis did not develop overnight and it will not be solved overnight" <!-- #8 -->
* $u_b$: "the crisis did not developed overnight, and it will be not solved overnight" <!-- #2101 -->
* $u_c$: "The crisis didn't happen today won't be solved by midnight." <!-- #2269 -->

After removing the punctuation and converting all words to lowercase, the lemmas of the content words of these utterances are as follows:

* $\text{lemmas}(c(u_a))$: "crisis", "develop", "overnight", "solve", "overnight"
* $\text{lemmas}(c(u_b))$: "crisis", "develop", "overnight", "solve", "overnight"
* $\text{lemmas}(c(u_c))$: "crisis", "happen", "today", "solve", "midnight"

Such that $\lambda(u_a, u_b) = 0$ and $\lambda(u_a, u_c) = \lambda(u_b, u_c) = 3$.
In order to make these quantities comparable across utterances of different lengths, we define the *transformation rate* $\rho$ as the normalised distance between two utterances:

$$\rho(u, u') = \frac{\lambda(u, u')}{\max\left(|c(u)|_w, |c(u')|_w\right)}$$

$\rho$ thus measures the magnitude of the transformation between the contents of $u$ and $u'$, relative to the size of the contents of those utterances.
It takes its values between 0 and 1:
$\rho(u, u') = 0$ if and only if $u$ and $u'$ have exactly the same content words in the same order, and $\rho(u, u') = 1$ means that the content words of $u$ and $u'$ have so little in common that rewriting from scratch is quicker than changing one into the other with word insertions, deletions, or replacements.
Here, $\rho(u_a, u_b) = 0$ and $\rho(u_a, u_c) = \rho(u_b, u_c) = .6$.
A major caveat of this measure is that it does not know about synonyms or expressions with similar meaning, such that two sentences separated by a transformation rate of 1 can have the same meaning at a higher level.
For instance with the following sentences,

* $u_d$: "Will you investigate the gravest crimes of the Bush administration, including torture and warrantless wiretapping?" (from Experiment 1, originally from the MemeTracker data set)
* $u_e$: "Will you research the worst problems of the 2004 mandate, like its surveillance?" (hand-crafted for this comparison)
* $u_f$: "Don't forget to leave the door open when you leave the office" (from Experiment 1)

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
shorter utterances are better transmitted, and global transmissibility thus increases too.

@Fig:gistr-octrans-exp-2 shows the same analysis for Experiment 2.
Contrary to the previous case, transmissibility here is stable at .82-.88 with respect to depth, both for the whole data set and at fixed content length.
It also depends less on content length than in Experiment 1, as utterances with 2 content words have an average transmissibility .95, and utterances with 8 content words an average transmissibility of .69.

Experiment 3 (@fig:gistr-octrans-exp-3) features an increase in transmissibility with respect to depth both globally (from .18 to .71) and at long fixed content length, similar to Experiment 1.
This indicates that long utterances in this data set become slightly easier to transmit as they are transformed.
As noted previously, utterances found at the end of a chain will often come from much longer utterances at the start, such that improved transmission success along a single branch is always mixed with the shortening of content.
However, for long utterances (content lengths 8 and above), utterances found at the end of all chains are on average better transmitted than utterances *of the same content length* at the start of all chains, meaning that transmission along the chains has an effect on transmissibility of long utterances beyond the shortening of the content.

The different behaviours across experiments are, here again, not separated from the differences in word count and stopword proportion distributions in the root utterances.
The purpose of these figures remains that of giving an overview of the shape and aggregate behaviour of the chains, and we will come back to the detailed effects of word count, stopword proportion and other sentence-level features in @sec:gistr-results-inner.

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

We add a final aggregate measure to the overall picture of these experiments:
the variability of utterances at a given tree depth.
For a given tree $t$, the variability $\kappa(t, d)$ measures the average transformation rate between all pairs of utterances at depth $d$ in $t$ (also called the *slice* of $t$ at depth $d$).

$$\kappa(t, d) = \left< \rho(u, u') \right>_{\{u, u'\} \subset \left\{ \text{$u$ at depth $d$ in $t$}\right\} }$$

This measure gives a sense of how fast branches diverge between each other.
For each experiment, @fig:gistr-variabilities plots the variability of all slices of all trees, and the average variability averaged across trees.
All three increase significantly, although at different rates, here again tied to the differences in root utterances.

![Slice variabilities in the three experiments.
Each plot shows the variabilities of each slice of each tree (blue dots), as well as the average variability across slices of all trees at a given depth (red line with 95% confidence interval).
](images/gistr-computed/variabilities.png){#fig:gistr-variabilities}


### Transformation breakdown


### Mechanistic transformation model


### Inner structure {#sec:gistr-results-inner}


### High-level case studies


### Meaning change
