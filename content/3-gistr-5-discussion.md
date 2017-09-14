## Discussion {#sec:gistr-discussion}

\add{refs to substantiate; this should be easier once the final discussion chapter is clear}

We set out to better understand the process at work in the short term evolution of linguistic content.
In an approach complementary to the previous chapter, we decided to design a controlled experiment that would provide the complete data needed to model the process.
We developed an online platform for the purpose, and after adjusting task difficulty and source complexity we were able to gather relatively large data sets of linguistic transmission chains with low levels of spam.
Then, by combining standard NLP methods with our extension of a biological sequence alignment algorithm, we decomposed the utterance transformation process into small, analysable operations that subjects use in their reformulations.

A few important points are worth noting to qualify the results we just presented.
First, several choices in the alignment procedure we followed are sub-optimal, and were made in the interest of concrete progress.
The Needleman-Wunsch algorithm we used does not allow the detection of chunk replacements.
For instance, abbreviations or short paraphrases, which @lauf_analyzing_2013 identify as non-negligible in their data set (e.g. "has no idea" $\rightarrow$ "doesn’t know"), are not captured by our approach.
Extending the algorithm to allow this is technically possible, but involves a substantial amount of additional work, and we opted to leave such extensions for further research.
The algorithm is also blind to syntactic boundaries such as punctuation, which insertions and deletions are likely to respect at least part of the time.
Manual inspection of the alignments showed a few cases where a deletion would affect two contiguous parts of an utterance separated by a comma, for which distinguishing the parts could help in improving the final alignment.
Finally, deep alignments are only explored on the basis of optimal shallow alignments, which are not guaranteed to be the best starting point:
it is possible that the search will find a locally optimal alignment, when a better solution could have been found by starting from other (non-optimal) shallow alignments.
Many other improvements could be made in the future, for instance matching insertion-deletion blocks from exchanges at different depths to overcome local optima, or starting with local instead of global shallow alignments.
The manual evaluation of alignments indicated that the current approach was good enough however, and that these optimisations could indeed be left for further research without jeopardising our model.

Concerning the design of the task, we note that the incentive provided for subjects to perform well also leaves room for improvement (a point related to the spam levels).
Subjects had a monetary incentive with bonuses for outstanding performance, but they did not experience the bonus until after the experiment was completed.
More generally, the setup puts participants in the position of a subject and not of a user:
setting aside what the interface encourages, there is no intrinsic incentive for people to put extra effort into the task.
As @gauld_experiments_1967 phrased it already long ago:
"Errors could, it seemed, be avoided, if the subject was so inclined."
However, analysing the transformation rates of individual subjects showed nothing to that effect:
although some subjects average better than others, it seems that no individual subject is uniformly good or bad at the task.
Initial explorations of the word span of subjects (in Experiment 1) also showed little to no correlation to subject performance.
The best solution to this problem would be to create an intrinsic motivation for the participants by aligning their interests with performance.
@claidiere_argumentation_2017 implement this kind of incentive, by asking participants to defend and convince others of a choice they have previously made.
In our case, such an incentive could guarantee subjects' involvement but would not suffice to improve the quality of the written productions, as people will very easily understand badly edited text in the course of a live interaction (this would make the computational analysis even harder).

Finally, our setup entirely obviates the question of the context in which utterances are processed and reproduced.
This was a deliberate choice, as we decided to use the simplest transmission chain task possible and reserve the introduction of more complexity (such as context effects) for later research.
As a consequence however, we have no control over the situation in which subjects read an utterance, nor did we add contextual paragraphs or preceding utterances to examine framing or priming effects on the interpretations and transformations of subjects.
Preceding text is very likely to have effects on the transformations, as these are reliably observed in the study of intrusions in recall of word lists [@zaromb_temporal_2006].
Manual exploration of the data also showed (rare) cases of words from one utterance bleeding into later transformations:
in one case, a subject reintroduced a word that they had read in an utterance three trials earlier.
This phenomenon is difficult to control beyond the randomisation we applied, and we note that the cases we observed were extremely rare.

In spite of these caveats, we showed that transformations can be usefully analysed as made of bursty deletions and insertions, speckled with word replacements (and exchanges, which we left aside in the analysis).
Deletions are by far the most frequent operation, and they act as a gate for insertions;
in turn, the size of insertions tends to correlate to the size of deletions that they closely follow.
We further observed that all operations are less probable at the beginning of an utterance, as well as in shorter utterances, and that deletions tend to grow in chunk size as well as in chunk numbers towards the end of an utterance.
Finally, we observed that transformations are also bursty at the level of the branch, suggesting that the process follows a punctuated equilibria pattern:
when a subject makes a transformation on a previously stable utterance, the next subjects in the chain might add transformations until the changes are regularised into a newly stable utterance.

Overall, we suggest that adopting this descriptive model provides a clearer picture of the process at work in the evolution of linguistic content than has been previously achieved.
The model creates an intermediary scale between the detailed level of lexical word features and the high level of contrasts in aggregated evolution, thus rendering the process more intelligible.
In particular, we believe that visualisations such as the lineage plots we presented are extremely helpful in identifying the underlying mechanisms that can be then connected to known effects in linguistics.
In the context of Cultural Attraction Theory, this type of approach could prove useful to construct more parsimonious models of the evolution of representations.
In particular, it brings detail to the linguistic instantiation of the wear-and-tear and flop problems introduced by @morin_how_2016:
the first could correspond to the way utterances are gradually transformed by replacements, exchanges, and insertions making up for deletions;
the second could correspond to downright mass deletions in a transformation.

Transposing the analysis from the previous chapter to the current data set also confirmed the trends in lexical features observed in blogspace:
less frequent, longer words that are learned late and have higher clustering coefficient are on average replaced by higher-frequency, shorter words, learned earlier and with lower clustering coefficient.
As we discussed in the previous chapter, these words are overall easier to produce in standard naming or word recall tasks.
Examining the evolution of these features along the branches also showed that the process significantly transforms utterances to use easier words on average:
transformations can thus be seen as creating a gradual drift of utterances at the low-level of lexical features due to a cognitive bias in favour of certain word types.

While one could consider this phenomenon as relevant to Cultural Attraction Theory, it remains extremely low-level and does not indicate any consistent drift or attraction in the semantics of the utterances (nor does it invalidate it).
Manual inspection of the data also gave no sign of an attraction phenomenon at the semantic level.
Two points might be noted nonetheless.
First, the details of transformations seem to follow the patterns identified by @lauf_analyzing_2013 in news stories:
complements, adverbs, modals, and more generally any details not essential to the main meaning seem often deleted or replaced.
Second, examining episodes of bursty changes also suggested that there is a chaotic aspect to chains:
relatively minor changes in the middle of a transformation sometimes lead to a comparatively larger change in meaning down the branch, as an ambiguity is created and resolved differently than previously.
In Experiment 3 for instance, a subject presented with the following utterance,

\begin{nquote} % <!-- #545 -->
  "A dozen hawkers who had been announcing the news of a non existent bomber in Kings Cross have been arrested."
\end{nquote}

introduced several changes including a typographical error that replaced the word "news" with "new";
he or she produced the following utterance:

\begin{nquote} % <!-- #907 -->
  "A dozen hawkers announcing non existent \textbf{new} about a bomber at Kings Cross have been arrested"
\end{nquote}

The "news" $\rightarrow$ "new" change, while superficially minor compared to the rest of the transformation, is quite important once we remove the context provided by the previous utterance.
Indeed, it later went through a long regularisation such that the final utterance of the branch read:

\begin{nquote} % <!-- #1847 -->
  "A dozen hawkers, at New Kings Cross have been arrested."
\end{nquote}

Examining the transformations in the branch suggested that the small typographical error rendered its surroundings ("non existent ... about a bomber") confusing and irrelevant, such that "new" was finally integrated as part of the "Kings Cross" proper noun instead.
This behaviour is not frequent, as many times typographical errors are corrected by subsequent transformations, but it appears to be possible whenever an ambiguity is created or enhanced (not only through typographical errors).

\todo{unpack some of the discussion points and suggestions below}

Other intriguing semantic effects were observed.
In one case for instance, small changes that accumulated in different parts of an utterance ended up combining into a larger semantic change, because the relationship between parts of the utterance had eventually changed.
More broadly, tackling the question of semantic attraction (or more simply semantic transformations) could require the definition of semantic levels at which the transformations should be examined.
As the chaotic behaviour described above illustrates, changes at the semantic level can be created by any ambiguity that is picked up by subjects.
This can range from a typographical error, to a change in punctuation, or a minor change of vocabulary which seems ambiguous to one subject but not to another.
The question is thus shifted from the structure of utterances themselves to what subjects attend to, in an utterance, for a given task or in a given interaction situation.
In other words, analysing the semantic changes of utterances goes hand in hand with a determination of what aspects of an utterance are relevant for a given task or interaction, that is, it requires an approach to utterance pragmatics.

Without delving into utterance pragmatics, a more palatable development of this approach would be to focus on a smaller number of root utterances with less branches in each tree, and explore evolution of content at the very long term.
While such an approach would be more dependent on the initial utterances, it would allow us to explore higher-level evolutionary dynamics along the chain (e.g. recurring sets of changes).
Testing for the existence of attractors, in particular, might require such long-lived chains, as the number of iterations is an important factor to consider.
A second approach, which could be combined with long-lived chains, would be to ask about the role of simple semantics and syntax in the transformations:
beyond lexical features and word categorisations, one could attempt to quantify and thus characterise the change in meaning at each transformation and overall through the chains, possibly through deeper integration with existing NLP methods.
Semantic parsing methods, in particular, can provide a first useful model of the semantics encoded in a sentence.
Depending on the way such information is represented, an alignment technique similar to the one developed here could be used to study the changes in semantic parses along a chain, thus opening the study of the regularities in semantic transformations.
Conversely, the extent to which word meanings (or word relationships with the rest of the utterance) participate in the transformation process could be explored.
Better integrating these results with what is known of the way utterances are cognitively processed and produced could also be fruitful:
known mechanisms in sentence parsing and processing could explain the patterns observed by our model, and integrating with current knowledge of sentence production could make it possible to develop generative models of the transformation process.
Finally, many questions from the last chapter also remain pending.
In particular, if context is an important factor in the transformations observed, we wonder about the role of feedback effects and path dependence in the evolution of content online:
how much are transformations determined by the distribution of utterances that readers are exposed to, in what way, and how does this influence feed back into the distribution itself?
An important role of feedback in the transformations would be grounds for a strong path dependence in the evolution of linguistic content, maybe even at lower cognitive levels.

Answering these more approachable questions would already provide a much more complete view of the dynamics at work in the short-term evolution of linguistic content.
As noted above however, it is likely that further progress in this area will require considering the role of pragmatics in utterance transformations, for instance by exploring more ecological interaction situations than the simple read-and-rewrite task we used.
