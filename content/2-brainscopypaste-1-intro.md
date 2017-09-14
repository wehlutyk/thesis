# Word substitutions in blogspace quotations {#sec:brainscopypaste}

## Introduction

The reciprocal influence between cognition and culture has a long history in both social science and psychology.
While this question has been the subject of intense debate in the social sciences in the 20th century, today's discussion is mostly structured by proponents from cognitive science, who construe culture as an evolutionary process analogous and parallel to biological evolution.
That analogy can be traced a long way back, with milestones such as Kroeber's works [-@kroeber_nature_1952], Dawkins' *Memetics* [-@dawkins_selfish_2006], and later the development of *Dual Inheritance Theory* by @boyd_culture_1985 and @cavalli-sforza_cultural_1981 among others.
More recently, Dan Sperber has drawn on this principle to explicitly connect anthropology and cognitive science through the theory of *Epidemiology of Representations* [@sperber_explaining_1996], and the study of cultural evolution has been growing steadily since.

The collection of works by @aunger_darwinizing_2000 [in particular @bloch_well-disposed_2000; and @kuper_if_2000] has shown how memetics cannot account for the levels of transformation culture undergoes as it is transmitted.
@mesoudi_multiple_2008 discuss the uses of transmission chain experiments to test what dual inheritance theory can explain about cultural evolution.
@morin_how_2013 and @miton_universal_2015, by carefully compiling a series of anthropological works, demonstrate how cognitive biases have influenced the evolution of cultural artifacts over several centuries.
@kirby_cumulative_2008 and @cornish_systems_2013 have shown how evolutionary pressures lead to the emergence of structured and expressive artificial languages in simulations and laboratory experiments.
Such transmission chain experiments have also been explored in non-human primates by @claidiere_cultural_2014.

The theory of Epidemiology of Representations proposes a unifying framework for all these works by recasting them as questions of spread and transformation of representations:
these are alternatively located in the mind ("mental representations" in Sperber's terminology), or in the outer world ("public representations") as expressions of mental representations in diverse cultural artifacts (pieces of text, utterances, pictures, building techniques, etc.).
A human society is then modeled as a large dynamical system of people constantly interpreting public representations into mental representations, and producing new public representations based on what they have previously interpreted.
Two key points are that (a) transmission is not reliable (representations change significantly each time they are interpreted and produced anew, as opposed to e.g. memetics), and (b) the reciprocal influences of cognition and culture can be captured by studying the evolution of public representations themselves, which is what the above-cited studies are doing.

The theory makes an additional strong hypothesis, which this paper focuses on:
as transformations accumulate, some representations evolve to be very stable and spread throughout an entire society without changing any more (they are called "cultural representations", because they characterize a given culture).
This process should manifest itself as attractors (called "cultural attractors") in the dynamical system that models cultural evolution, that is:
there should be areas of the representation space where cognitive effects in transformations bring representations closer to a given stable asymptotic point.^[
Attractors need not be points in fact, they can also be sub-areas; in that case any transformation brings representations in the area closer to (or confined to) the target sub-area.
]

This hypothesis, a cornerstone of the theory because of the intelligibility it gives to cultural evolution, has been hard to test in concrete situations as quantitative data on out-of-laboratory cultural artifacts is not easy to collect.
One approach, as mentioned above, has been the meta-analysis of large bodies of anthropological studies [see @miton_universal_2015, for instance].
This paper exemplifies a second approach, taking advantage of the ever-increasing avalanche of available digital footprints since the 2000's.
Indeed, tools and computing power to analyze such data are now widespread, and the body of research aimed at describing online communities and content is growing accordingly.
For instance, the propagation of cultural artifacts across social networks has been studied in blogspace [@gruhl_information_2004] and in emails [@liben-nowell_tracing_2008];
@cointet_socio-semantic_2009 described the reciprocal influence between the social network topology and the distribution of issues;
@leskovec_meme-tracking_2009 detailed the characteristic times and diffusion cycles both within these social networks and with respect to the topical dynamics of news media, and @danescu-niculescu-mizil_you_2012 studied the characteristics of particularly memorable quotes that circulate in those networks.
We believe these works can connect the field of cultural evolution with psycholinguistics to advance the testing of cultural attractors.

\bigskip

To show this we analyze how quotes in blogs and media outlets are modified when they are copied from website to website.
These public representations should normally not change as they spread on the Web (as opposed to more elaborate expressions or opinions, not identified as quoted utterances), but empirical observation shows that they are in fact occasionally transformed [@simmons_memes_2011]:
authors spontaneously transform quotes, not only cropping them but also replacing words.
For instance the quote "we will not be scared of these cowards" (a substring of a quote from former Pakistani President Asif Ali Zardari) is also found as "we will not be **afraid** of these cowards".
More meaningful changes often happen too, such as the transformation of McCain's "I admire Senator Obama and his accomplishments" during the 2008 US presidential campaign, into "I **respect** Senator Obama and his accomplishments".
Since authors are implicitly required to copy quotes exactly, we can assume that most transformations, especially simple ones such as those shown above, are the result of automatic (i.e. hard to control) low-level cognitive biases of the authors.

We thus ask the following question: given such representations that seem to evolve precisely because of the kind of automatic cognitive biases evoked in the theory of epidemiology of representations, do cultural attractors appear, and if so how do cognitive biases participate in them?
We chose to restrict our analysis to substitutions (i.e., one word being replaced by another), both to keep the analysis tractable and because of missing information in our data set.^[
As explained further down, source-destination links between quotes must be inferred from the data set, an operation which is much more reliable if we restrict our analysis to substitutions.
This also impedes us from observing the effect of accumulated transformations in the long term, limiting our results to a view of the individual evolutionary step.
]
While this limits the scope of our results to the particular data set we use, the methodological point we also make is left intact.  By characterizing words using 6 well-studied features, we identify what makes a substitution more likely, and how a word changes when it is substituted.
This exploratory approach uncovers a number of transmission biases consistent with known effects in linguistics.
While the transformations we describe are not the only ones at work in this data set, our analysis also indicates that feature-specific attractors could exist because of the substitution process.
This study can be viewed as analyzing part of the transmission step operating in transmission chains of artificial languages like those studied by @kirby_cumulative_2008, yet with natural language out of the laboratory.

The next section describes our hypotheses along with a review of the psycholinguistics literature.
Then, we describe the data set and detail the various assumptions that were made in order to analyze it.
Next, we introduce the measures we built to observe cognitive biases operating in quote transmission.
Finally, we discuss the relevance of these results for the study of cultural evolution, followed with general guidelines for further work.

## Related work

The study of cultural evolution on the part of cognitive science emerged only recently.
While formal models of cultural transmission appeared with the development of dual inheritance theory [@cavalli-sforza_cultural_1981;@boyd_culture_1985] and have included the notion of cultural attractor since then [@claidiere_role_2007;@claidiere_how_2014], collecting data to test and iterate over such models has been more challenging.
The first above-mentioned method consists in rebuilding the history of a given type of representation by compiling anthropological or historical works on the subject [as for instance @morin_how_2013; and @miton_universal_2015, have done].
A second approach uses cultural evolution experiments in the laboratory, with an array of methods reviewed by @mesoudi_multiple_2008.
Transmission chains, in particular, have been used extensively to study the evolution of human language [see @tamariz_cultural_2016 for a review].
Other recent examples include studies of the evolution of simple audio loops through consumer preference [@maccallum_evolution_2012], the emergence of structure in visual patterns transmitted by baboons [@claidiere_cultural_2014], and the amplification of risk perception through chains of casual conversation [@moussaid_amplification_2015].

Research on online content points to a third approach to this question.
By investigating the transformations of quotations in a large corpus of US blog posts and online news stories initially collected and studied by @leskovec_meme-tracking_2009, @simmons_memes_2011 and later @omodei_multi-level_2012 show that even for quotations, a type of public representation that should change the least when transmitted on the Web, it is still possible to witness significant transformations.
These studies focus on the influence of the quotation source (e.g. news outlet vs. blog) or of the surrounding public space (e.g. quotation frequency in the corpus), and suggest diffusion-transformation models to capture the dynamics of the population of quotations.
But the cognitive features which may determine or, at least, influence these transformations, are overlooked.
On the other hand cognitive and linguistic features have been used in diffusion studies not involving transformation: @danescu-niculescu-mizil_you_2012, for instance, show that particularly memorable quotations (taken from movie scripts in this case) use more distinctive words and have more common syntax than less memorable quotations; they are also the quotes that adapt best to new contexts of use.
One source of ideas to study the transformations of such quotes, then, might be the psycholinguistic literature studying word and sentence recall.

@potter_regeneration_1990 suggest that immediate recall of sentences is based on the retention of an unordered list of words which is then regenerated as a sentence at the moment of production.
Priming recall with other words can lead to replacement in the recalled sentence if the primed words are consistent with the overall meaning of the sentence.
Regenerated syntax can also be influenced by priming recall with another syntactic structure [@potter_syntactic_1998], or with verbs whose category constraints call for a different structure [@lombardi_regeneration_1992].

Compared to full sentences, recall of word lists provides a situation that is easier to fully explore and has been extensively studied.
In particular, the Deese, Roediger, and McDermott paradigm [introduced by @deese_prediction_1959; and later popularized by @roediger_creating_1995] has shown that it is possible to construct lists of words which reliably create the false memory of an external word related to those in the list.
This is done by using lists of words produced by free association from the target intrusion word;
the intruding recall then happens with probability nearly proportional to the average semantic association strength between the intruding word and the words in the list.
A sizable literature studies this type of task with varying complexities in the design of the lists, a good review of which is given by @zaromb_temporal_2006.
One notable effect is that the semantic relations between words greatly influence, and correlate to, the order in which words are recalled [@tulving_subjective_1962;@howard_when_2002], and that this reordering of items improves subjects' repeated recalls [@tulving_subjective_1966].
The frequency and type of intrusions in lists of random words are also influenced by associations created by the presentation of previous lists [@zaromb_temporal_2006].
Indeed, the question of how such temporal associations (contributing to contextual information retrieval in recall) interact with the prior semantic associations of subjects (contributing to associative information retrieval) is at the core of many of these studies.

These effects do not transpose simply to sentence recall however, as not only syntax but also effects of attention come into play for both retrieval and encoding.
@jefferies_automatic_2004, for instance, show that attention is central to the encoding and retention of unrelated propositions, on top of more automatic syntactic and semantic processes.
This involvement of executive resources also seems to contribute to the much greater memory span subjects exhibit for sentences compared to word lists [see @jefferies_automatic_2004 again, for more details].

Given this complexity we decided to focus on more aggregate measures, where variations of the conditions in which sentences are read and produced have a chance of being statistically smoothed out.^[
Aside from our lack of control on the precise conditions of encoding and recall in our data set, the analysis techniques mentioned above are better suited to data consisting of a high number of measures over a smaller number of lists (in which case it makes sense to ask e.g. what proportion of intrusions come from prior lists).
As is explained further down however, our data set is shaped the opposite way: a great number of sentences, with only very few to no measures at all on each sentence.
]
If a cognitive bias in the substitution of words manifests itself with simple measures, then it will be worth applying predictive models of the substitution process in further research.

Lexical features, then, are obvious well-studied word measures that can be analyzed in aggregate.
Indeed word frequency [see @yonelinas_nature_2002 for a review], age-of-acquisition [@zevin_age_2002], number of phonemes [see for instance @rey_phoneme_1998;@nickels_dissociating_2004], and phonological neighborhood density [@garlock_age-of-acquisition_2001] to name a few, all have known effects on word recognition or production.
More complex features based on word networks built from free association or phonological data have also been analyzed:
@nelson_how_2013 for instance, show the importance of clustering coefficient in such a semantic network by studying the role it plays in a variety of recall and recognition tasks (extralist and intralist cuing, single item recognition, and primed free association).
@chan_network_2010 show that pictures are named faster and with fewer mistakes when they have a lower clustering coefficient in an underlying phonological network.
@griffiths_google_2007 analyze a task where subjects are asked to name the first word which comes to their mind when they are presented with a random letter from the alphabet.
The authors show that there is a link between the ease of recall of words and their authority position (pagerank) in a language-wide semantic network built from external word association data [@austerweil_human_2012 further develop this tool to give a parsimonious account of the fact that related words are often retrieved together from memory].

On the whole, research on lexical features hints towards two antagonistic types of effects [also known as the "word-frequency paradox", @mandler_word-frequency_1982].
On one hand, part of the literature shows that recall is easier for the least "awkward" words;
those whose age of acquisition is earlier, length is smaller, semantic network position is more central --- this is particularly true in retrieval, that is in tasks where participants are asked to form spontaneous associations or utter a word in response to a given signal.
On the other hand, when the task consists in recognizing a specific item in a list, "awkward" words are actually more easily remembered, possibly as they are more informative and plausibly more discernible [see again @yonelinas_nature_2002 for a review].
The jury is still out as to whether reformulation alteration, that is spontaneous replacement of words when asked to rewrite a given utterance, is rather of the former or latter sort.
We also aim to shed some light on this debate, considering oddness as a dimension of the purported fitness of utterances.
