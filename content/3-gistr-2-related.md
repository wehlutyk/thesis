## Related work {#sec:gistr-related}

Inspired by the selectionist models of culture developed by @boyd_culture_1985 and @cavalli-sforza_cultural_1981, a sizeable part of the empirical work on cultural change has focused on identifying content and context biases in the way cultural items are transmitted.
This line of work relies heavily on the transmission chain paradigm initially introduced by @bartlett_remembering:_1995.
For linguistic content in particular, studies using that paradigm now provide a catalogue of contrasts in the way utterances or short stories are transmitted.
These effects range from the stereotypical personification of objects [@bangerter_transformation_2000], the favouring of negative story aspects [@bebbington_sky_2017] or the increased hierarchical encoding of events [@mesoudi_hierarchical_2004], to biases in favour of social [@mesoudi_bias_2006] or counter-intuitive aspects of stories [@norenzayan_memory_2006;@barrett_spreading_2001].
Other effects such as the role of emotions in the selection of items to reproduce [@heath_emotional_2001;@eriksson_corpses_2014], or conformity and prestige biases [@acerbi_did_2017] have been studied by focusing on the individual transmission step on which the evolution of content hinges.

Often, such effects are identified by selecting two or more minimally different types content and contrasting the way they evolve in transmission chains (for instance measuring the speed at which they are degraded).
When a type of content is significantly better transmitted than other types, it signals that a bias is acting on that contrast dimension.
The technique is useful in the context of selectionist models of culture, as it identifies examples of biases which could create selection pressures for specific cultural types and thus drive cultural evolution.
In is also relevant to the more recent approach introduced by @claidiere_how_2014, which proposes the use of evolutionary causal matrices to model the change processes which are attraction-based, rather than selection-based.
However, the method gives little insight into the mechanisms that give rise to such contrasts, their commonalities and differences, what they depend on, and how exactly they can be explained in terms of cognitive and situated processing.

Indeed, understanding the mechanisms behind transformations in chains, or even only quantitatively describing the details of said transformations, remains very much a challenge.
This is especially true in the linguistic domain, where the complexity of language hinders most attempts to understand what is going on in a transformation.
Up to now three main strategies have been developed to delve into to detail of transformations.
The first is to use tightly constrained linguistic content, for instance sentences of a very specific type, or for which only pre-defined changes can happen.
In that case the transformations can be directly modelled to identify regularities.
The study of the recall of word lists [see @zaromb_temporal_2006 for a review], and that of word replacements in short sentences [@potter_regeneration_1990;@lombardi_regeneration_1992], can be seen as employing that strategy:
word lists and individual replacements in sentences are much simpler than transformations of complete sentences, and are thus more amenable to statistical analysis.
Our analysis of word substitutions in the previous chapter can be categorised here too.
A similar strategy is found in non-linguistic studies, such as iterated learning on sequences of colour items for which standard regularity metrics exist [@cornish_systems_2013], or transmission chains of constrained visual patterns such as those used by @claidiere_cultural_2014.
Both cases feature discrete and combinatorial pieces of content, for which it is possible to use natural notions of distance, equality, or regularity in transformation.
This first strategy can be termed the "simple setting" strategy.

At the other end of the spectrum we find the "do-it-by-hand" strategy.
This approach uses more ecological content but relies on exhaustively hand-coding it, and is used in most of the transmission chain studies mentioned above.
The study of risk perception propagation developed by @moussaid_amplification_2015, for instance, used a free-form interaction setting where subjects were taped while freely discussing a topic.
The recorded conversations were later hand-coded for the presence of certain information items introduced at the beginning of the chains.
The linguistic analysis of transformations of quotes in news stories provided by @lauf_analyzing_2013 is also the product of exhaustively hand-coding differences between sentences.

Finally, the third strategy relies on pre-labelled data sets, often from online platforms, on which machine learning techniques can extract features that correlate to the transmission of pieces of content.
This is the "already-coded" strategy.
@danescu-niculescu-mizil_you_2012, for instance, study the memorability of movie quotes by exploiting user ratings provided on the Internet Movie Database website.
As we saw in the previous chapter, analysing the regularities that arise in unlabelled digital traces falls back into the first strategy, as having to infer missing information led to drastically simplifying the transformations considered.

Strategies two and three are additionally closely tied to data collection methods.
Free-form interaction and more generally ecological content is costly to hand-code, and thus necessarily limited in size;
it is also best used in controlled settings where the choice of content can be optimised.
Conversely, using machine learning to extract features that relate to content transmission requires large amounts of pre-labelled data, which often means that an existing public data set must be used.
Such studies thus seldom control the conditions under which the data is generated, which restricts the interactions they can explore to those encoded in existing data sets:
any behaviour or piece of content that is not present in public data sets is off limits.

Overall, studies targeted at understanding the details of transformations of linguistic content seem forced to pick two of the following three properties, and relinquish the third:
realistic content, computational analysis, and control over the generation of the data.
Picking realistic content and computational analysis leads to the "already-coded" strategy.
Picking realistic content and control over data-generation requires hand-coding a substantial part of the data collected, that is strategy two.
Finally, computational analysis and data-generation control leads to the "simple setting" strategy.
This bind thus appears as a major challenge to the better understanding of changes in linguistic content, and more broadly to the study of language-related cultural evolution.
In particular, it hinders attempts to model the low-level processes which could provide a more parsimonious account of the contrasts observed in linguistic transmission chains, and allow for a deeper integration of the study of cultural evolution with linguistics.

To overcome this obstacle we turn to two related fields of research.
The first, which we term the Web and Smartphone experimental approach, is creating a middle ground between controlled laboratory experiments and the analysis of online corpora.
This approach takes advantage of the ubiquity of internet browsers and mobile computing to develop large-scale controlled experiments out of the laboratory.
@miller_smartphone_2012 discusses the possibilities opened by developing experiments as smartphone applications in particular, and notes that this method changes the logistics and context-awareness of experiments:
large amounts of subjects can be recruited online without having to manage meeting schedules, and experiments can probe participants without interrupting their everyday life, both advantages that been exploited in the study of mind-wandering and happiness [@killingsworth_wandering_2010;@mackerron_happiness_2013;@bastian_language_2017].
A closely related method is the development of experiments as web applications, which similarly changes the set of experimental constraints.
In linguistics, the possibility for large-scale data collection has been successfully used in the study of vocabulary size [@keuleers_word_2015;@brysbaert_how_2016];
creating studies that involve many subjects at the same time is also made much simpler by the online logistics, an advantage that has been used for instance in the study of group conversations [@niculae_conversational_2016].
More generally, these approaches relax the opposition between small-scale controlled experiments in the laboratory on one side, and analyses of large-scale but passively collected online data on the other side.
Once the initial development cost is covered, they make it possible to collect relatively large data sets in short cycles, and combine simplified logistics with a level of control similar to that of laboratory experiments.
The second field we rely on creates an opening for the detailed modelling of utterance transformations:
biological sequence alignment, the sub-field of bioinformatics which attempts to uncover commonalities in sequences of DNA, RNA, or amino acids in proteins from different species, has developed over the last 50 years a range of general algorithms to relate sequences of items.
One such algorithm in particular, introduced by @needleman_general_1970, extends the principles of the Levenshtein distance and is particularly well suited to the analysis of linguistic transformations when combined with standard natural language processing methods.
Inspired by @lauf_analyzing_2013 who use similar tools to prepare their data for manual analysis, we use and extend the Needleman-Wunsch algorithm to reliably extract regularities in the way utterances are transformed through transmission chains.
