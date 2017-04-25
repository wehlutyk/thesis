## Methods

We rely on a text corpus made of quotations extracted from online blog posts, and focus on their evolution.
Quotations appeared to be a perfect candidate to propose a first measure of automatic cognitive bias in cultural transmission.
First, they are usually cleanly delimited by quotation marks, which greatly facilitates their detection in text corpora.
Second, they stem from a unique original version, and are ideally traceable back to that version.
Third, and most importantly, their duplication should *a priori* be highly faithful, apart from cases of cropping:
not only should transformations be of moderate magnitude, but when specific words are not perfectly duplicated, it is safe to assume that the variation is due to involuntary cognitive bias --- as writers may expect any casual reader to easily verify, and thus criticize, the fidelity to the original quotation.

We could therefore study the individual transformation process at work when authors alter quotations, by examining the modified words in each transformation.
Since our approach is exploratory however, we do not know at the outset which precise effect of cognitive bias we are looking for.
Indeed, the data we use does not come from a controlled experiment in the laboratory, designed to elicit a particular effect: they are recordings of real life interactions, with all the complexity and uncertainty of conditions this entails.
Our goal, therefore, is to show that cognitive biases have measurable effects in this setting even if they are part of a larger complexity (the detailed prediction and deconstruction of the cognitive processes responsible for them being left to further research).
If this is confirmed, we will have successfully tested fundamental cognitive biases with out-of-laboratory data, opening a path to explanations of actual (vs. simulated) cultural evolution with tools from cognitive science.
Aiming to exhibit such subtle biases in complex data is the main reason we chose to use aggregate measures that have a chance of smoothing out the possible variations of experimental conditions in the data set.

To keep the analysis tractable, we focused on quotation transformations consisting of the *substitution* of a word by another word (and only those cases) in order to unambiguously discuss single word replacements.
This restriction also allows us to more reliably infer the information that is missing in our data set, as explained in the "Substitution model" section.
To quantify these substitutions we decided to associate a number of features to each word, the variation of which we can statistically study.

The next subsections describe the data set and the measures we used to assess this cognitive bias.

### Corpus-based utterances

We used a quotation data set collected by @leskovec_meme-tracking_2009, large enough to lend itself to statistical analysis.
This data set consists of the daily crawling of news stories and blog posts from around a million online sources, with an approximate publication rate of 900k texts per day, over a nine-month period of time from August 2008 to April 2009 [@leskovec_meme-tracking_2009}].^[
The original article [@leskovec_meme-tracking_2009] does not provide further details on the source selection methodology.
]
The authors automatically extracted quotations from this corpus.
Each quotation is a more or less faithful excerpt of an utterance (oral or written) by the quoted person; for instance:

> The Bank of England said, "these operations are designed to address funding pressures over quarter-end."

Then, the authors gathered quotations in a graph and connected each pair that differed by no more than one word or that shared at least ten consecutive words [they tested this procedure with a number of different parameters, see @leskovec_meme-tracking_2009, for more details].
We find for example the following variation of the above quote:

> "these operations are **intended** to address funding pressures over quarter-end."

Next, they applied a community detection algorithm to that quotation graph to detect aggregates of tightly connected, that is sufficiently similar, groups of quotations [see again @leskovec_meme-tracking_2009, for more details].
This analysis yielded the final data we had access to, with a total of about \num{70000} sets of quotations; each of these sets ideally contains all variations of a same parent utterance, along with their respective publication URLs and timestamps (since the procedure cannot be perfect, sets of quotations contain occasional rogue unrelated variations that should have been discarded or assigned to another set).

Manual inspection of this data set revealed that it contains a significant number of everyday language quotations (such as "it was much better than I expected", "did that just happen", as well as many simple expletive-based sentences).
Their presence is largely due to random variations around casual expressions, while we are interested in transformations of news-related quotes causally linked to an original, identifiable utterance.
To filter them out, we exclude quotes with less than 5 words or whose occurrences span more than 80 days (indicating causally unrelated occurrences), as well as quotes not written in English.
Clusters that are emptied by this procedure are therefore excluded.
If, after this screening, a cluster's occurrences still span more than 80 days (because of short-lived but unrelated quotes far apart in time), we also exclude it.
We eventually keep 50,427 clusters (out of 71,568; i.e. 70.5%), containing a total of 141,324 unique quotes (out of 310,457; i.e. 45.5%) making up about 2.60m occurrences (out of 7.67m; i.e. 33.9%).^[
The significantly larger loss in occurrences indicates that, on average, the clusters we lose contain more occurrences than those we keep, which is to be expected for everyday language utterances.
]
Even if we lose some real event-related utterances which are present in clusters lasting more than 80 days (one such lost quote, for instance, is "the city is tired of me and the organization and I have run our course together"), we check that our filtering approach fulfills its goals by coding a random sub-sample of 100 clusters: 35 of them are rejected by the filter, with 15 false negatives (rejected clusters that should have been kept) and 9 false positives (clusters kept when they should have been rejected), giving a precision score of 0.862 and a recall score of 0.789.
Furthermore, all but one of the 9 false positives are left with a single non-rejected quote, meaning those clusters are ignored by our substitution analysis; this brings the effective precision of our filter to 0.982.^[
A similar analysis was made for language detection, which is part of the cluster filtering:
out of 100 randomly sampled quotes, 17 are rejected because their detected language is not English, with no false positives and 6 false negatives, giving a precision score of 1 and a recall score of 0.933.
Of the 6 false negatives, 4 had less than 5 tokens and would have been excluded by the cluster filter anyway.
]

### Word-level measures

#### Lexical features

We first introduce some lexical measures on words.

* **Word frequency**: the frequency at which words appear in our data set, known to be relevant for both recognition and recall [@gregg_word_1976],
* **Age of Acquisition**: the average age at which words are learned [obtained from @kuperman_age-of-acquisition_2012], known to have different effects than word frequency [@morrison_roles_1995; @dewhurst_separate_1998],
* **Phonological** and **Orthographic Neighborhood Density** [obtained from @marian_clearpond:_2012], also known to be relevant for word production [@garlock_age-of-acquisition_2001],
* The average **Number of Phonemes** and **Number of Syllables** for all pronunciations of a word [obtained from the Carnegie Mellon University Pronouncing Dictionary, @weide_cmu_1998]^[
  The CMU Pronouncing Dictionary is included in the NTLK package [@bird_natural_2009], the natural language processing toolkit we used for the analysis.
  ],
  as well as **Number of Letters**, as a proxy to word production cost,
* The average **Number of Synonyms** for all meanings of a word [obtained from @wordnet_princeton_2010] as an *a priori* indicator of how easy it would be to replace a word.

We also consider grammatical types within quotations by detecting *Part-of-Speech* (POS) categories with TreeTagger [@schmid_probabilistic_1994]; we distinguish between verbs, nouns, adjectives, adverbs, and closed class-like words.

\medskip

Aside from these raw features, the systemic dimension of vocabulary [@cornish_systems_2013] has led authors to develop measures based on the full topology of networks built from free association data or phonological similarity.
Several such measures have been shown to be involved in recall, recognition, and naming tasks [@nelson_how_2013; @chan_network_2010; @griffiths_google_2007].

To compute these features we relied on the free association (FA) norms collected by @nelson_university_2004, which record the words that come to mind when someone is presented with a given cue.
As @nelson_university_2004 explain, "free association response probabilities index the likelihood that one word can cue another word to come to mind with minimal contextual constraints in effect."
Similar to what @griffiths_google_2007 did, we first considered the directed weighted network formed by association norms, where nodes are words and edges are directed from cue to target word, with a weight equal to the association strength (that is the probability of that target word being produced when this particular cue is presented).
This network is of particular interest since it lets us define features that reflect the associations driving false memories in word lists [@deese_prediction_1959], a phenomenon which may be involved in the transformation of quotations.

We used three standard measures on the FA network:

* **Incoming degree centrality**, measured by the number of cues for which a given word is triggered as a target, and a corresponding generalized measure, node **Pagerank** [@page_pagerank_1999], which has already been used on the FA network by @griffiths_google_2007.
  In the present case these two polysemy-related measures are quasi-perfectly correlated.^[
  Note that in-degree does not take the weights of links into account, as it counts 1 for each incoming link.
  Pagerank on the other hand, does take the weights into account.
  ]
* **Betweenness centrality**, another measure of node centrality describing the extent to which a node connects otherwise remote areas of the network [@freeman_set_1977].
  This quantity tells us if some words behave as unavoidable waypoints on association chains connecting one word to another.^[
  For this measure, weights are interpreted as inverse cost:
  the stronger a link, the easier it is to travel across it.
  A stronger link will be favored over weaker links in the computation of the shortest path between two words.
  ]
* **Clustering coefficient**, which measures the extent to which a node belongs to a local aggregate of tightly connected nodes [@watts_collective_1998], computed on the undirected weighted version of the FA network.^[he Clustering coefficient is formally defined as the ratio between the number of actual versus possible edges between a node's neighbors;
  this is poorly defined in the case of directed networks, which led us to ignore the direction of links in the network for this measure (if two words are connected in both directions, the weights of both links are added to make the final undirected link's weight).
  ]
  This tells us if a word belongs more or less to a group of equivalent words (from a free association point of view).

#### Variable correlations

Several of these features are strongly related and can be grouped together.
To make correlation values as well as future comparisons more reliable, we log-transformed features that have marked exponential distributions (i.e. a few words valued orders of magnitude higher than the vast majority of other words).

![Spearman correlations in the initial set of features](images/brainscopypaste-computed/all-feature_correlations.png){#fig:feature-corrs-initial}

The pairwise correlations in the initial set of features appears in @fig:feature-corrs-initial.
By looking at absolute values, three subsets of highly correlated features can be easily identified:
(a) number of letters, phonemes, and syllables with pairwise correlations greater than .75;
(b) orthographic and phonological neighborhood densities, with a correlation of .8;
(c) age of acquisition, betweenness, degree, and pagerank centralities, with absolute pairwise correlations at .41, .59, .6, .61, .63 and .85.
Applying a feature agglomeration algorithm targeted at 6 groups refined this observation by producing identical (a) and (b) groups, a (c) group without betweenness centrality which was instead assigned to a group (d) with clustering coefficient, and the remaining features (frequency and number of synonyms) as singletons.^[
Agglomerating into less than 6 groups merged groups (a) and (b), which we excluded to keep neighborhood densities in their own group;
agglomerating into more than 6 groups separated age of acquisition from group (c), which we excluded given its high correlation values to the rest of group (c).
We used scikit-learn's FeatureAgglomeration class for this procedure [@pedregosa_scikit-learn:_2011].
]

Since our data is about written transformations, number of letters and orthographic neighborhood density are the natural representatives of groups (a) and (b) respectively.
Given the importance of age of acquisition in the lexical feature literature, we chose it to represent group (c).
Finally we used clustering coefficient to represent group (d) since it has already been used in previous studies.
The final set of features we will discuss in the rest of the paper, as well as their cross-correlations, can be seen in @fig:feature-corrs-filtered.^[
Note that feature values stem from different data sets which do not always encode the same words.
Indeed, we have data on frequency for about 33.5k words, on age of acquisition for 30.1k words, on clustering coefficient for 5.7k words, number of synonyms 111.2k, and orthographic density 17.8k words.
Quite often then, not all features are available for a given word in our data set;
however this is not problematic since the analysis is done on a per-feature basis, and not all words need be encoded in all features.]

![Spearman correlations in the filtered set of features](images/brainscopypaste-computed/paper-feature_correlations-v2.png){#fig:feature-corrs-filtered width=64.12%}

### Substitution model

We finally need a substitution detection model, for the quotation data we use presents a challenge:
quote-to-quote transformations and substitutions are not explicitly encoded in the data set.
More precisely, each set of quotations bears no explicit information about either the authoritative original quotation, or the source quotation(s) each author relied on when creating a new post and reproducing (and possibly altering) that source.
In other words we face an inference problem where, given all quotations and their occurrence timestamps, we must estimate which was the originating quotation for each instance of each quotation.

We therefore model the underlying quotation selection process by making a few additional assumptions.
Given a particular occurrence of a quotation, the first issue is deciding whether that occurrence is a strict copy of an earlier occurrence, or a substitution from another quotation, or maybe a substitution or copy from quotes appearing outside the data set, that is from a source external to the data collection perimeter.
The second issue is deciding which source originated such a substitution when several candidate sources are available.

Let us give an example:
say the quotation "These accusations are false and **absurd**" ($q$) appears in two different blogs on January 19, and the slightly different quotation "These accusations are false and **incoherent**" ($q'$) appears in another blog on the 20th of January.
The second occurrence of $q$ can safely be assumed to be a faithful copy of the first one the same day.
And since $q$ is fairly prominent when $q'$ first appears, we could assume that the author of $q'$ on the 20th based herself on $q$, as is shown with a dashed line in @fig:substitution-unmodelled.
Now say a third version, "These **allegations** are false and **incoherent**" ($q''$) also appears once on January 19 and once on January 20 after $q'$.
Here, $q$ and $q''$ differ by two substitutions, so we discard the possibility that one was written based on the other (see below for further details).
$q''$ is only one substitution away from $q'$ however, so we could also consider the first occurrence of $q''$ as a potential source for $q'$ on the 20th.
Conversely, the occurrence of $q''$ on the 20th could be considered as a substitution from $q'$, or as a faithful copy from its initial occurrence on January 19.
(Options shown in @fig:substitution-unmodelled.)

\begin{figure}[h]
  \centering
  \small
  \input{images/brainscopypaste/substitution-unmodelled.pdf_tex}
  \caption{{\bf Possible paths from occurrence to occurrence.}
  $q$, $q'$ and $q''$ are three quotation variants belonging to the same cluster.
  $q$ and $q''$ differ by two words, but $q'$ differs from both $q$ and $q''$ by one word.
  The second occurrence of $q$ can safely be considered a faithful copy of the first, but the occurrences of $q'$ and $q''$ are uncertain:
  while the first occurrence of $q'$ is most likely a substitution from $q$, it could also stem from $q''$;
  conversely, the second occurrence of $q''$ could also be a substitution from $q'$ instead of being a faithful copy of its first occurrence.
  }
  \label{fig:substitution-unmodelled}
\end{figure}

\begin{figure}[h]
  \centering
  \subfloat[Source must be majority in preceding bin, destination can be anything]{
    \def\svgscale{.49}
    \small
    \input{images/brainscopypaste/substitution-Time=discrete-Source=majority-Past=last_bin-Durl=all.pdf_tex}
    \label{fig:substitution-modelled-majority-all}
  }
  \quad
  \subfloat[Source must be majority in preceding bin, destination must not appear in preceding bin]{
    \def\svgscale{.49}
    \small
    \input{images/brainscopypaste/substitution-Time=discrete-Source=majority-Past=last_bin-Durl=exclude_past.pdf_tex}
    \label{fig:substitution-modelled-majority-exclude_past}
  }

  \subfloat[Source can be anything, destination can be anything]{
    \def\svgscale{.49}
    \small
    \input{images/brainscopypaste/substitution-Time=discrete-Source=all-Past=last_bin-Durl=all.pdf_tex}
    \label{fig:substitution-modelled-all-all}
  }
  \quad
  \subfloat[Source can be anything, destination must not appear in preceding bin]{
    \def\svgscale{.49}
    \small
    \input{images/brainscopypaste/substitution-Time=discrete-Source=all-Past=last_bin-Durl=exclude_past.pdf_tex}
    \label{fig:substitution-modelled-all-exclude_past}
  }
  \caption{
  {\bf Substitution models.}
  Substitutions inferred by four models in the situation introduced by Fig.~\ref{fig:substitution-unmodelled}.
  Each of these models uses bins spanning 1 day aligned to midnight (see the main text for a complete description of parameters).
  In the top left panel (a), $q$ holds the majority in the first bin and is considered the unique basis for $q'$ in bin 2.
  $q'$ and $q''$ have equal maximum frequency in bin 2 however, so both are sources of substitutions towards bin 3.
  In the top right panel (b), quotes that appear in the preceding bin cannot be the target of a substitution; this removes two substitutions compared to panel (a).
  In the bottom left panel (c), the majority constraint is lifted compared to panel (a), making $q''$ in bin 1 a candidate source for $q'$ in bin 2.
  In the bottom right panel (d), the majority constraint is also lifted compared to panel (a) (adding the same $q'' \rightarrow q'$ substitution as in panel (c)), and the excluded-past constraint is added as in panel (b) (removing the two same substitutions from bin 2 to bin 3 as in panel (b)).
  If the bins were extended to the beginning of the quotation family, the excluded-past constraint would also remove the $q' \rightarrow q$ substitution from bin 2 to bin 3.
  In all four panels, a background rectangle or square indicates the quotation is the source of a substitution.
  A thick border on that rectangle or square indicates the quotation was selected because it has maximum frequency.
  }
  \label{fig:substitution-modelled}
\end{figure}

One way to settle these questions is the following:
group quote occurrences into fixed bins spanning $\Delta t$ days (1 day in the implementation), each one representing a unit of time evolution;
when a quotation $q'$ appears in bin $t+1$, it is counted as a substitution if it differs from the most frequent quote of the preceding bin $t$ (or a substring thereof) by only one word;
if not, $q'$ is not considered to be an instance of substitution.
@fig:substitution-modelled-majority-all shows the inferences made by such a model.
The assumptions it embeds, however, are a subset of a much wider set of possibilities, each leading to alternative inferences.

We identified four binary parameters that differentiate potential models, such that the resulting 16 combinations cover most of the reasonable answers to inference uncertainties.
The first two parameters define the preceding time bin from which authors could have drawn a source when producing a new occurrence:
(1) **bin positions**, which can be aligned to midnight (as in the model presented above) or kept sliding (for each occurrence, use a bin that ends precisely at that occurrence);
(2) **bin span**, which can be $\Delta t=1$ day (as in the model above) or can be extended up to the very first occurrence in the quotation family.
The other two parameters configure rules on the selection of source and destination quotes of a substitution:
(3) **candidate sources** can be restricted to the most frequent quotations in the preceding time bin (as in the model above), or not (in which case all quotations in the preceding bin are candidate sources);
(4) **candidate destinations** can be restricted to quotations that do not appear in the preceding bin, or without restriction (as in the model above).
A substitution model, then, is the given of a value for each of those parameters;
it considers valid all the substitutions (and only those) where the source and destination follow the rules set out by the parameters.
If a destination has substitutions from multiple sources we count a single effective substitution where, for each feature, the value for the effective source word is the average of the values of the candidate source words.

Put shortly a model defines how many times, and under what source and destination conditions, quote occurrences can be counted as substitutions.
@fig:substitution-modelled shows the inferences made by the four models that use bins spanning 1 day aligned to midnight:
later occurrences of $q'$ and $q''$ are counted as substitutions in @fig:substitution-modelled-majority-all and @fig:substitution-modelled-all-all, whereas in @fig:substitution-modelled-majority-exclude_past and @fig:substitution-modelled-all-exclude_past they are not.

The results reported and discussed in the following sections are valid for all 16 models, and the graphics we present were produced by the model first introduced above.
Finally, note that this inference procedure is one of the reasons we restricted our analysis to single-substitutions:
looking for more complex transformations would
(a) exponentially increase the number of candidate sources for a destination occurrence, which correspondingly reduces the confidence in inferences made,
and (b) greatly increase the complexity of the transformation models used to make these inferences.^[
We checked that this restriction does not bias the results discussed below by extending our protocol to two-substitution transformations;
the results were unchanged.
]

\medskip

In practice for the model first introduced above, from the 2.60m initial occurrences spread over 50,427 quotation families, with significant redundancy (many quotes are indeed simple duplicates), we mine 40,868 substitutions.
From these substitutions we remove those featuring stopwords, minor spelling changes (e.g. center/centre), abbreviations (e.g. November/Nov or Senator/Sen), spelled out numbers, words unknown to WordNet, and deletions in substrings (which can appear as substitutions of non-deleted words);
this eventually yields 6,177 valid substitutions.^[
Manually coding a random subset of 100 substitutions to evaluate this last filter showed that 84 were true negatives, 5 were false positives, and 11 true positives, giving a recall score of .688.
Precision was evaluated over a random subset of 100 *kept* substitutions, showing a score of .87.
Finally, note that excluding minor spelling changes does not bias our use of orthographic neighborhood density as a feature:
out of the first 100 substitutions coded for recall, those with Levenshtein distance equal to 1 [which is what orthographic neighborhood density codes, @marian_clearpond:_2012] were all typos or UK/US spelling changes, neither of which are relevant for this study.
]

## Results

Substitutions usually replace a word with another semantically related word:
manual observation of a random subset of 100 substitutions shows that, compared to the word it replaces, the new word often achieves a similar meaning in the context of its sentence while still slightly changing the implications or the attitude expressed by the author.^[
However, the substituted and substituting words are not so often direct synonyms:
only a third of all substitutions travel less than 3 hops on the hyponym-hypernym network defined by WordNet (direct synonyms count as 0 hops on this network), meaning that at least two thirds involve non-synonyms.
A similar phenomenon is observed on the FA network, where about 104 clusters have substitutions traveling only 1 hop, 110 traveling 2 hops, 137 traveling 3, 72 traveling 4, and 13 traveling 5.
]
The following examples illustrate this phenomenon:

* "This is \{socialism $\rightarrow$ welfare\} for the rich,
* [The] "perverse logic of \{clashes $\rightarrow$ confrontation\} and violence,
* "This \{crisis $\rightarrow$ problem\} did not develop overnight and it will not be solved overnight.

Our question concerns the low-level properties of these substitutions: we ask (a) which words are targets of the substitutions and (b) what change these words are subjected to. To this end, we build the following two observables for each word feature.
First, we measure which word features are more or less substituted compared to how often they would be if the process were random, in order to capture the susceptibility for words to be the target of a substitution in a quote.
Second, we measure the change in word feature upon substitution, looking at the variation of a given feature between start and arrival words.
Since sentence context is also central to this process, we extend these two observables by applying them to feature values relative to the distribution of feature values in the sentence in which a word appears.

Note that since we only consider substitutions and not faithful copies, we measure the features of an alteration *knowing that there has been an alteration*, that is we do not take invariant quotations into account.
Indeed, in the former case we know there has been a human reformulation, whereas in the latter case we cannot know whether there has been perfect human reformulation or simply digital copy-pasting of a source ("[Ctrl-C]{style="font-variant:small-caps;"}/[Ctrl-V]{style="font-variant:small-caps;"}").
Moreover, perfect human reformulation possibly involves different practices than those involved in alteration --- for instance drafting before publishing, double-checking sources, proof-reading --- and may not be representative of the cognitive processes at work during alteration.
The two situations are different enough to be studied separately, and we focus here on the latter.

### Susceptibility

We say that a word is *substitutable* if it appears in a quote which undergoes a substitution, whether the substitution operates on that word or on another one.
For a given group of words $g$, say all nouns, or all words in a particular range of values for a feature (e.g. words 2 to 4 letters long), susceptibility is computed as the ratio of $s_g$, the number of times words of that group are substituted, to $s_g^0$, the number of times words of that group would be substituted if substitutions fell randomly on substitutable words.^[
$s_g^0$ is computed by summing, over all quotes undergoing a substitution, the ratio of the number of words in a quote that are from group $g$ to the number of words in the same quote that could have been the substitution's target.
If, for instance, half the content words of a given quote are nouns, such a quote contributes .5 to the total $s_{nouns}^0$.
Further, to avoid possible autocorrelation effects due to substitutions belonging to the same cluster (which are likely not statistically independent and may lead to overly optimistic confidence intervals), we scale $s_g$ and $s_g^0$ to count one for each cluster.
That is, each quote cluster has a maximum contribution of 1, computed as the average contribution of all substitutions in that cluster.
]
That is:

$$\sigma_g = \frac{s_g}{s_g^0}$$

In other words, susceptibility measures how much more or less a group of words $g$ actually gets substituted compared to picking targets at random in quotes undergoing substitutions.
By applying this measure to Part-of-Speech (POS) categories and feature bins (e.g. for a feature $\phi$ and a bin $[a; b]$, $g = \{w | \phi(w) \in [a; b]\}$), susceptibility measures the bias in the selection of start words involved in substitutions,
i.e. it measures the preferential selection of some word properties for substitution.

\medskip

![**POS-related results:**
categories are simplified from the TreeTagger tag set: *C* means *Closed class-like* (see main text for details), *J* means adjective, *N* noun, *R* adverb, and *V* means verb.
The top panel shows the actual $s_{POS}$ and $s_{POS}^0$ counts. The bottom panel shows the substitution susceptibility $\sigma_{POS}$, which is the ratio between the two previous counts.
Confidence intervals are computed with the @goodman_simultaneous_1965 method for multinomial proportions.
](images/brainscopypaste-computed/all-susceptibilities-pos.png){#fig:pos-susceptibilities}

@fig:pos-susceptibilities gathers the results for POS groups.
A Goodman-based multinomial goodness-of-fit test [@goodman_simultaneous_1965] shows that these categories have a significant effect on susceptibility ($p < .05$ in all substitution models), but this seems mostly due to the *Closed class-like*^[
The *Closed class-like* category gathers all the POS groups representing closed class words (coordinating conjunctions, prepositions, subordinating conjunctions, modals and possessive endings).
These groups, essentially made of stopwords, feature very low counts for both $s$ (substitutions falling on stopwords are filtered out) and $s^0$ (stopwords are never counted as substitutable).
While the susceptibility reported for the remaining words is left unbiased (as $s$ and $s^0$ are equally affected), they represent a very small portion of all substitutions, which led us to group them together.
Finally, we added to this meta-category the few POS groups that cover words entirely excluded from the analysis (foreign words, punctuation symbols and interjections), only sporadically present because of tagging fluctuations;
hence the name *Closed class-like*.
]
and *Adverb* categories.
Indeed, detailing which categories are out of their confidence region under $\mathcal{H}_0$ shows that susceptibility for closed class-likes is significantly below 1 (confirmed in all substitution models), as is that for adverbs in 13 of the 16 substitution models;
none of the other categories are significantly different from $\mathcal{H}_0$ (except nouns which appear significantly above 1 in a single substitution model).
While we acknowledge the low susceptibilities of adverbs and closed class-likes, these categories concern less than 7% of all substitutions under $\mathcal{H}_0$ (and even less in the actual data);
it seems, then, that POS categories do not capture any strong bias in the selection of substitution targets.

![**Substitution susceptibility for feature values:**
susceptibility to substitution versus feature value of a candidate word for substitution (binned by quartiles), with 95% asymptotic confidence intervals (Goodman-based multinomial).
](images/brainscopypaste-computed/paper-susceptibilities-quantilebins_global.png){#fig:feature-susceptibilities-global}

The results for word features presented in @fig:feature-susceptibilities-global, on the other hand, show marked effects for several features.
Word frequency, Age of acquisition, and Number of letters each exhibit significant susceptibility variations (Goodman goodness-of-fit with $p < .05$ in all substitution models, $p < .001$ in most) consistent with known effects of those features on recall.
High-frequency words, much easier to recall, are substituted about half as much as they would be at random; conversely low-frequency words, harder to recall, are substituted about 50% more than random.
Age of acquisition and Number of letters show the opposite pattern, consistent with their negative correlation to word frequency ($-.4$ and $-.19$):
words learned before 5 or 6 years old, or made of less than 5 letters, are substituted less than random, whereas words learned after 10 years old, or made of more than 8 letters, are substituted far more than random.
Orthographic neighborhood density also shows a slight effect (significant at $p < .05$ in 15 of the 16 substitution models):
words with very sparse neighborhoods are more substituted than random (which may seem counter-intuitive, but is probably because over 70% of those words have 7 letters or more).
Clustering coefficient shows no effect on susceptibility, and neither does Number of synonyms:
in particular, words with many synonyms do not attract substitutions more than random (in fact, half the substitution models show they have a slight tendency to be substituted less than random).

On the whole, the trends observed are consistent with known effects of word frequency, age of acquisition, and number of letters, indicating that the triggering of a substitution could behave quite similarly to word recall in standard tasks.

### Variation

We now examine how words are modified when they are substituted, that is how their features change upon substitution.
Considering a word $\wstart$ substituted for $\warrival$, we measure how a feature $\phi$ of $\wstart$ varies when it is replaced with $\warrival$, that is we look at $\phi(\warrival)$ as a function of $\phi(\wstart)$.
Averaging this value over all start words such that $\phi(w) = f$ yields the mean variation for that feature value $f$, that is:^[
Similarly to what we do for susceptibility, we avoid possible autocorrelation effects by averaging start- and arrival-word features of substitutions from the same cluster into a single aggregate substitution per cluster.
]
$$\nu_{\phi}(f) = \left<\phi(\warrival)\right>_{\left\lbrace \wstart\rightarrow\warrival | \phi(\wstart) = f \right\rbrace}$$

We are interested in comparing the value of $\nu_{\phi}(f)$ to $f$ itself, as this shows whether there is an attraction (or a repulsion) effect towards (respectively from) some values of each feature.
In other words, plotting the $y=x$ line, we can see if substitutions tend to attract words towards some typical feature value or not --- a standard procedure in the study of dynamical systems.

We also introduce two null hypotheses, $\mathcal{H}_0$ and $\mathcal{H}_{00}$, to compare the actual variation of a word's feature to expected variations under unbiased transformations.
$\mathcal{H}_0$ models the situation where the arrival word $\warrival$ is randomly chosen from the whole pool of words available in the data set for that feature.^[
For instance, when considering the feature "Clustering coefficient, the arrival word is randomly chosen among words present in the data set of FA norms.
]
In this case, since $\phi(\warrival)$ becomes a constant value in the above averaging (by definition $\warrival$ does not depend on $\wstart$ anymore), the baseline variation under $\mathcal{H}_0$ may be rewritten as:
$$\nu_{\phi}^0 (f) = \left<\phi\right>$$
$\mathcal{H}_{00}$ models the situation where the arrival word $\warrival$ is chosen *among immediate synonyms of the start word* $\wstart$, i.e. an arrival word chosen among semantically plausible though still random words.
In this case $\nu_{\phi}^{00}$ does depend on $f$:^[
The actual implementation has an additional level of averaging since WordNet, used to get a word's synonyms, defines several meanings for a single given word, which we have no means of disambiguating.
Therefore:
$$\nu_{\phi}^{00} (f) = \left< \left< \left< \phi(\warrival) \right>_{\warrival \in syn(m)} \right>_{m \in meanings(\wstart)} \right>_{\left\lbrace \wstart | \phi(\wstart) = f \right\rbrace}$$
]
$$\nu_{\phi}^{00} (f) = \left< \left< \phi(\warrival) \right>_{\warrival \in syn(\wstart)} \right>_{\left\lbrace \wstart | \phi(\wstart) = f \right\rbrace}$$

This approach yields a fine-grained view of how word features evolve upon substitution, on average, with respect to
(a) the original feature (vs. $y=x$),
(b) a random arrival (vs. $\nu_{\phi}^0$), and
(c) an unbiased semantically plausible arrival (vs. $\nu_{\phi}^{00}$).

![**Feature variation upon substitution:**
$\nu_\phi$, average feature value of the appearing word as a function of the feature value of the disappearing word in a substitution (binned by quartiles), with 95% asymptotic confidence intervals based on Student's *t*-distribution.
The overall position of the curve with respect to the dashed line representing $\mathcal{H}_0$ (constant $\nu_{\phi}^0$) indicates the direction of the cognitive bias compared to a purely random variation.
The position with respect to the dash-dotted line representing $\mathcal{H}_{00}$ ($\nu_{\phi}^{00}$) indicates the bias compared to a semantically plausible random variation obtained by choosing a random synonym of the disappearing word.
The intersection with $y = x$ marks the attractor value.
The fact that all curves have slopes smaller than 1 in absolute value means that the substitution operation is contractile on average:
it brings each feature closer to its own specific asymptotic range.
](images/brainscopypaste-computed/paper-variations-quantilebins_global.png){#fig:feature-variations-global}

\medskip

Results are gathered in @fig:feature-variations-global.
A first observation is that all graphs show the existence of a unique intersection of $\nu_{\phi}$ with $y=x$, and the slope of $\nu_{\phi}$ is smaller than 1 in absolute value, independently of the feature considered.
This means that for each feature $\phi$, whichever the value $\phi(\wstart)$ of the disappearing word, the appearing word's feature value $\phi(\warrival)$ will, on average, be closer to that feature's intersection of $\nu_{\phi}$ with $y=x$.^[
This reasoning is standard in the analysis of dynamical systems (where the same transformation is applied to the whole system over and over), and becomes obvious when one manually simulates a substitution on the graph by picking a start value, using the $\nu_{\phi}$ curve to obtain the corresponding arrival value, and comparing it to the start value:
the arrival value is always closer to the intersection with $y=x$, meaning that that intersection is an attractor point for the substitution process.
If the slope of $\nu_{\phi}$ were greater than one (in absolute value), the arrival value would always be *farther* from the intersection than the start value was, making the intersection with $y=x$ a *repulsor* point.
This is how the number of intersections with $y=x$ and the slope of $\nu_{\phi}$ at those intersections characterize the behavior of substitutions.
]
In other words, beyond individual variation patterns, the substitution process exhibits a unique attractor for each feature.
Note that this is also true under $\mathcal{H}_0$ or $\mathcal{H}_{00}$ (both null hypothesis curves have single intersections with $y=x$ with slopes smaller than 1):
the substitution process naturally leads to an attraction even under reasonable random conditions.

![**Feature variations regression coefficients**:
source feature values (columns) and feature variations (rows) were normalized to $[0; 1]$ to ensure the coefficients are comparable.
Significance levels for individual *t*-tests against the hypothesis of a null coefficient are denoted by stars below the corresponding coefficient (*** for $p \leq .001$, ** for $p \leq .01$, * for $p \leq .05$, and nothing when $p > .05$).
Frequency has a slight effect on Age of acquisition and Clustering coefficient, with small coefficients compared to the respective diagonal ones.
Aside from those two, only diagonal values are significantly non null.
](images/brainscopypaste-computed/paper-variations_regression-globals_to_globalsvariation-heatmap.png){#fig:feature-variations_regression-global}

Second, the comparison with $\nu_{\phi}^0$ and $\nu_{\phi}^{00}$ shows that there are two classes of attractors, depending on whether:
* there is a triple intersection (of $y=x$, $\nu_{\phi}$, and $\nu_{\phi}^0$ or $\nu_{\phi}^{00}$);
* or $\nu_{\phi}$ always remains above or below $\nu_{\phi}^0$ and $\nu_{\phi}^{00}$.

The first class (Number of synonyms and Orthographic neighborhood density) are features for which the substitution process only brings words slightly closer to $\nu_{\phi}^0$ (for Number of synonyms) or $\nu_{\phi}^{00}$ (for Orthographic neighborhood density), and no uniform bias can be observed.
The second class (comprising Word frequency, Age of acquisition, Clustering coefficient, and Number of letters) are features for which the substitution process has a clear bias, positive or negative, with respect to both the purely random situation ($\mathcal{H}_0$) and the semantically plausible random situation ($\mathcal{H}_{00}$).

Word frequency, with $\nu_{\phi}$ always significantly above $\nu_{\phi}^0$ and $\nu_{\phi}^{00}$, exhibits a strong bias towards more frequent words.
This, in turn, is consistent with the hypothesis that substitution is a recall process, since common words are favored over awkward ones.
Age of acquisition, Clustering coefficient and Number of letters, on the other hand, exhibit a clear negative bias for the substitution process (except for high clustering values or very high number of letters).
The three curves are significantly below their respective $\nu_{\phi}^0$ and $\nu_{\phi}^{00}$ curves for most start values, which is consistent with the literature on recall:
words learned earlier, with lower clustering coefficient or with fewer letters are easier to produce than average [@nelson_how_2013; @zevin_age_2002; @baddeley_word_1975].
All these effects are significant with two-tailed *t*-tests at $p < .05$ (and more often $p < .001$) and were verified across the 16 substitution models.

To make sure our observations are not the product of correlations or interactions, we model the variations of the 6 features as a linear function of the start word's feature values:
$$\bm{\phi}(\warrival) - \bm{\phi}(\wstart) = \bm{A} +  \bm{B} \cdot \bm{\phi}(\wstart)$$
where $\bm{\phi}$ is the vector of all 6 features of a word, $\bm{A}$ is an intercept vector, and $\bm{B}$ is a $6 \times 6$ coefficients matrix.
This regression achieves an overall $R^2$ of $.33$.
The corresponding matrix of coefficients $\bm{B}$ is shown in @fig:feature-variations_regression-global:
aside from Age of acquisition and Clustering coefficient on which word frequency has a slight effect, the variation of all other features depends solely on the disappearing word's same feature.
In other words there is little to no interaction between a disappearing word's features in determining the variations that that word will undergo when substituted.

To make things concrete, here is an example substitution taking place in the data set.
Around mid-November 2008 several media websites reported the following quote from Burmese poet Saw Wai (arrested for one of his poems),

> "Senior general Than Shwe is foolish with power.

and a smaller number of media websites, and blogs, reported the following,

> "Senior general Than Shwe is **crazy** with power.

The word *foolish* is acquired at an average of 8.94 years old, appears 675 times in the data set, has a Clustering coefficient of $8.2 \times 10^{-3}$ and is 7 letters long.
The word it was replaced with, *crazy*, is acquired on average at 5.22 years old, appears about 4.1k times in the data set, has a Clustering coefficient of $1.7 \times 10^{-3}$, and is 5 letters long.
Such a change, though minor in appearance, is a typical example of alteration along the lines shown by our results.

<!--
foolish / crazy
  frequency: (6.5147126908725301, 8.3192299386323256)
  aoa: (8.94, 5.22)
  clustering: (-4.7983132551456364, -6.369204119494885)
  letters_count: (7, 5)
-->

### Sentence context

![**Substitution susceptibility for in-quote feature quartiles:**
susceptibility to substitution versus quartile of the feature distribution in the originating quote, with 95% asymptotic confidence intervals (Goodman-based multinomial).
](images/brainscopypaste-computed/paper-susceptibilities-sentencequantiles.png){#fig:feature-susceptibilities-in_sentence}

![**Sentence-relative feature variation:**
$\nu_{\phi_r}$, average sentence-relative feature value of the appearing word as a function of the sentence-relative value of the disappearing word (binned by quartiles), with 95% asymptotic confidence intervals based on Student's *t*-distribution.
$\nu_{\phi_r}^0$ and $\nu_{\phi_r}^{00}$ are similarly converted to be sentence-relative.
Attraction, magnitude and direction of bias with respect to null hypotheses are similar to @fig:feature-variations-global.
However, attractors are always positioned between sentence median ($y=0$) on one side and $\nu_{\phi_r}^0$ and $\nu_{\phi_r}^{00}$ on the other side.
Clustering coefficient, Number of synonyms and Orthographic neighborhood density are limit cases, with triple intersections with one of the null hypothesis curves.
](images/brainscopypaste-computed/paper-variations-quantilebins_sentencerel.png){#fig:feature-variations-sentencerel}

The alterations we study are always made in a context, that is while the author is writing.
We wish to ask, therefore, if taking that context into account can provide more insight into the substitution process.
To do so we adapt the two observables presented above to capture some of the relationships between a word and the sentence it appears in.

Let us start with the first one:
given a feature $\phi$, we define the context-relative susceptibility to substitution with the following three steps.
(1) For each quote in which a substitution appears, compute the distribution of $\phi$ values in that quote (excluding stopwords) and divide it into quartiles.
(2) Count how many times each quartile (first, second, third or fourth) contains a word that is substituted.
This procedure tells us, for $i \in \{1; 2; 3; 4\}$, how many times substitutions fall in the $i$-th quartile of each in-quote distribution of $\phi$;
in other words it gives us the numerator $s_{q_i}$ for the computation of susceptibility, where $q_i$ represents the $i$-th quartile of the distributions of $\phi$ in the quotes.
(3) Finally divide each quartile count by its corresponding $s_{q_i}^0$, that is the number of times the $i$-th quartile would receive substitutions if targets were picked at random;
since the random situation would equally distribute a fourth of all substitutions to each quartile, we divide by the number of substitutions divided by 4.
Taking for instance word frequency, this measure tells us if words that have high- or low-frequency *compared to the quote they appear in* are more or less substituted than at random.

Surprisingly the results for this measure are no different from the context-free measure, as can be seen in @fig:feature-susceptibilities-in_sentence:
low-frequency words compared to the sentence are substituted much more than higher-frequency words, words learned earlier than the rest of the sentence are substituted less than words learned later, shorter words less than longer words, and words with scarce neighborhoods slightly more than words with denser neighborhoods.
Clustering coefficient and Number of synonyms are, here again and across all substitution models, not significantly different from $\mathcal{H}_0$:
with or without context, they do not seem relevant to the selection of substitution targets.

Feature variation is more easily extended to the context-relative case.
To do so we consider all feature values relative to the median word feature in the sentence.
That is, in all the equations of the previous subsection we replace $\phi(w)$ with:
$$\phi_r(w) = \phi(w) - \operatorname{median}\left\lbrace \phi(w) | w \in \text{sentence} \right\rbrace$$
$\nu_{\phi}$, $\nu_{\phi}^0$ and $\nu_{\phi}^{00}$ each transpose to $\nu_{\phi_r}$, $\nu_{\phi_r}^0$ and $\nu_{\phi_r}^{00}$ (note that $\nu_{\phi_r}^0$ now depends on $w$ since it is sentence-relative, whereas $\nu_{\phi}^0$ did not).

The results for sentence-relative feature variations are gathered in @fig:feature-variations-sentencerel.
Here too, the behavior is strikingly similar to the context-free measure:
a single attractor is visible for each feature, and the magnitude and direction of biases are near-identical to those for the previous measure.
The values of the appearing words give an additional insight into the process, however:
the attractor value of a feature, at the intersection of $\nu_{\phi_r}$ and $y=x$, is always between the sentence median, on one side, and $\nu_{\phi_r}^0$ and $\nu_{\phi_r}^{00}$ on the other side (for Number of synonyms it is a triple intersection with $\nu_{\phi_r}^0$; for Clustering coefficient and Orthographic neighborhood density, a triple intersection with $\nu_{\phi_r}^{00}$).
Substitutions, therefore, seem to attract words closer to the sentence median than what a random process would do.
This is true with respect to both null hypotheses (semantically plausible or not) for Frequency, Age of Acquisition and Number of letters, and true with respect to at least one of the two null hypotheses for the remaining features.

\medskip

On the whole, we observe a clear attraction pattern for each feature, with two different classes corresponding to the psychological relevance of each feature for the substitution process.
More awkward words along relevant features (less frequent, learned later, or made of more letters), both globally and with respect to the sentence they appear in, are substituted more often than what would happen if targets were picked randomly in the sentences;
conversely, more common words are substituted less.
Finally, across all features, substituted words are attracted towards a point closer to the sentence median than what a random process, semantically plausible or not, would do.
