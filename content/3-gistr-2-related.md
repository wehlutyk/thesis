## Related work {#sec:gistr-related}

The empirical study of the evolution of linguistic content has heavily relied on the transmission chain paradigm.
Studies extending the paradigm initially introduced by @bartlett_remembering:_1995 have catalogued a number of contrasts in the way linguistic content is transmitted.
These effects range from the stereotypical personification of objects [@bangerter_transformation_2000], the favouring of negative story aspects [@bebbington_sky_2017], or an increased hierarchical encoding of information [@mesoudi_hierarchical_2004], to biases in favour of social [@mesoudi_bias_2006] or counter-intuitive aspects of stories [@miton_universal_2015;@norenzayan_memory_2006;@barrett_spreading_2001].
Other targeted effects such as emotional selection [@heath_emotional_2001;@eriksson_corpses_2014] or conformity and prestige biases [@acerbi_did_2017] have been studied by isolating the individual transmission step on which the evolution of content hinges.

Often, such effects are identified by selecting two more minimally different types content and contrasting the way they evolve in transmission chains (for instance measuring the speed at which they are degraded).
Any type of content that is significantly better transmitted than other types signals that a bias is acting on that contrast dimension.
This technique is useful to identify content- and context-biases, which are at the core of high-level cultural evolution models such as those introduced by @boyd_culture_1985 and @cavalli-sforza_cultural_1981, or more recently the evolutionary causal matrices introduced by @claidiere_how_2014.
However, it gives little insight into the mechanisms that give rise to such contrasts, their commonalities and differences, what they depend on and how exactly they can be explained in terms of cognitive and situated processing.

Understanding the detail of transformations in chains, especially in the linguistic domain, remains very much a challenge.
Three main strategies have been developed to tackle this problem.
The first is to use tightly constrained linguistic content, for which the transformations can be directly modelled to identify regularities.
The study of the recall of word lists [see @zaromb_temporal_2006 for a review] and of short constrained sentences [@potter_regeneration_1990;@lombardi_regeneration_1992] can be seen as employing that strategy:
word lists and individual replacements in sentences are much simpler than transformations of complete sentences, and are thus more amenable to statistical analysis.
A similar strategy is found in the study of iterated learning on sequences of colour items [@cornish_systems_2013], or in transmission chains of constrained visual patterns such as those used by @claidiere_cultural_2014.
Both cases feature discrete and combinatorial pieces of content, for which it is possible to use natural notions of distance, equality, or regularity in transformation.
At the other end of the spectrum, a second strategy relies on exhaustively hand-coding the content that is transmitted or transformed.
The study of risk perception propagation developed by @moussaid_amplification_2015, for instance, used a free-form interaction setting where subjects were filmed while freely discussing a topic.
The recorded conversations were later hand-coded for important features and the transmission or deformation of specific items of information.
@lauf_analyzing_2013 also partly adopt this strategy by performing manual linguistic analysis of transformations of quotes observed in news stories.
Finally, a third strategy relies on pre-labelled online data sets on which machine learning can extract features that account for the transformation or memorisation of content.
@danescu-niculescu-mizil_you_2012, for instance, study the memorability of movie quotes by exploiting user ratings provided on the Internet Movie Database website.
As we have seen in the previous chapter, it is also possible to analyse the regularities that arise in unlabelled digital traces, at the cost of inferring any missing information.
In the case of blogspace in particular, we saw that most blog and media outlet authors do not quote their exact source when they publish a quote online (indeed it is often not relevant to the story), meaning that the missing source-destination links must instead be inferred to study the evolution of content.
The fact that it is also difficult to access author information (gender or age, experience in writing, but also psychological factors like memory span) rules out any study of individual author effects in transforming the content.

Strategies two and three are additionally closely tied to data collection methods.
Free-form interaction is costly to hand-code, and thus necessarily limited in size.
Conversely, using machine learning to extract features that relate to the memorability of a type of content requires large amounts of pre-labelled data, which often means that an existing public data set must be used.
Such studies thus seldom control the conditions in which the data is generated, which restricts the interactions they can explore to those encoded by existing data.

Overall, studies targeted at understanding the details of transformations of linguistic content seem forced to pick two of the following three properties, and relinquish the third:
realistic content, computational analysis, and control over the generation of the data.
Picking realistic content and computational analysis corresponds to the online corpus strategy.
Picking realistic content and control over data-generation requires hand-coding a substantial part of the data collected, that is strategy two.
Finally, computational analysis and data-generation control corresponds to strategy one, which collects simpler content in the laboratory.
This constraint thus appears as a major challenge to better understanding the changes of linguistic content as it is transmitted through chains.
In particular, it hinders attempts to model the low-level processes which could provide a more parsimonious account of the contrasts observed in linguistic transmission chains, and allow for a deeper integration of the study of cultural evolution with linguistics.

To overcome this obstacle we turn to two related fields of research.
The first, which we term the Web and Smartphone experimental approach, is creating a middle ground between controlled laboratory experiments and the analysis of online corpora.
This approach takes advantage of the ubiquity of internet browsers and mobile computing to develop large-scale controlled experiments out of the laboratory.
@miller_smartphone_2012 discusses the possibilities opened by developing experiments as smartphone applications in particular, and notes that this method changes the logistics and context-awareness of experiments:
large amounts of subjects can be recruited online without having to manage meeting schedules, and experiments can probe participants without interrupting their everyday life.
Such advantages have been exploited in the study of mind-wandering and happiness [@killingsworth_wandering_2010;@mackerron_happiness_2013;@bastian_language_2017].
A closely related method is the development of experiments as web applications, which similarly changes the set of experimental constraints.
In linguistics, the possibility for large-scale data collection has been successfully used in the study of vocabulary size [@keuleers_word_2015;@brysbaert_how_2016];
creating studies that involve many subjects at the same time is also made much simpler by the online logistics, an advantage that has been used for instance in the study of conversation markers of group interactions [@niculae_conversational_2016].
Both these approaches create openings that relax the opposition between small-scale controlled experiments in the laboratory, on one side, and analyses of large-scale but passively collected online data, on the other side.
Once the initial development effort is covered, they make it possible to collect relatively large data sets in short cycles, and combine simplified logistics with a level of control similar to that of laboratory experiments.
The second field we rely on creates an opening for the detailed computational analysis of utterance transformations:
biological sequence alignment, the sub-field of bioinformatics which attempts to uncover commonalities in sequences of DNA, RNA, or amino acids from different species, has developed over the last 50 years a range of efficient algorithms to compare sequences of items of any type.
One such algorithm in particular, introduced by @needleman_general_1970, extends the principles of the Levenshtein distance and is particularly well suited to the analysis of linguistic transformations when combined with standard natural language processing methods.
Inspired by @lauf_analyzing_2013 who use similar tools to prepare their data for manual analysis, we use and extend the Needleman-Wunsch algorithm to reliably extract regularities in the way utterances are transformed through transmission chains.
