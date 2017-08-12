## Discussion {#sec:gistr-discussion}

\add{refs to substantiate}

### Model results

We set out to better understand the process at work in the short term evolution of linguistic content.
In an approach complementary to the previous chapter, we decided to design a controlled experiment that would provide the complete data needed to develop a model of the process.
We developed an online platform for the purpose, and after adjusting task difficulty and source complexity were able to gather relatively large data sets of linguistic transmission chains with low levels of spam.
Then, by combining standard NLP methods with an algorithm adapted from biological sequence alignment, we decomposed the utterance transformation process into small, analysable operations that subjects use in their reformulations.
We showed that transformations can be usefully analysed as made of bursty deletions and insertions, speckled with word replacements (and exchanges, which we left aside in the analysis).
Deletions are by far the most frequent operation, and they act as a gate for insertions which then tend to correspond in size to any deletions they follow.
We further observed that all operations are less probable at the beginning of an utterance, as well as in shorter utterances, and that deletions tend to grow in chunk size as well as in chunk numbers towards the end of an utterance.
Transposing the analysis from the previous chapter to the current data sets confirmed the trends observed in blogspace:
less frequent, longer words that are learned late and have higher clustering coefficient are on average replaced by higher-frequency, shorter words, learned earlier and with lower clustering coefficient.
As we discussed in the previous chapter, these words are overall easier to produce in standard naming or word recall tasks.
Examining the evolution of these features along the branches also showed that the process significantly transforms utterances to use easier words on average:
the phenomenon can thus be seen as a gradual drift of utterances at the low-level of lexical features due to a cognitive bias in favour of certain word types.
Finally, we observed that transformations are also bursty at the level of the branch, suggesting that the process follows a punctuated equilibria pattern:
when a subject makes a transformation on a previously stable utterance, the next subjects in the chain might add transformations until the changes are regularised into a newly stable utterance.

Manual inspection of the data indicated that the details of transformations follow the patterns identified by @lauf_analyzing_2013 in news stories:
complements, adverbs, modals, and more generally any details not essential to the main meaning seem often deleted or replaced.
However, examining episodes of bursty changes also suggested that there is a chaotic aspect to chains:
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

Overall we suggest that adopting this descriptive model, which achieves a scale in between the detailed level of lexical word features and the high-level of contrasts in aggregated evolution, provides a better understanding of the process underlying the evolution of linguistic content transmitted in chains.
In the context of Cultural Attraction Theory, this type of approach could prove useful to construct more parsimonious models of the evolution of representations.
In particular, it brings useful detail to the linguistic instantiation of the Wear-and-Tear and Flop problems introduced by @morin_how_2016:
the first corresponds to the way utterances are gradually transformed by replacements, exchanges, and insertions making up for deletions;
the second corresponds to downright mass deletions in a transformation.
A modelling approach such as the one we presented here appears as a useful level of analysis to better understand these phenomena.
It should also help in connecting these questions with known effects in linguistics.


### Caveats

A few important points are worth noting to qualify the work we just presented.
First, several choices in the alignment procedure we followed are obviously sub-optimal, and were made in the interest of time.
The Needleman-Wunsch algorithm we used does not allow the detection of chunk replacements.
For instance, abbreviations or short paraphrases, which @lauf_analyzing_2013 identify as non-negligible in their data set (e.g. "has no idea" $\rightarrow$ "doesn’t know"), are not captured by our approach.
Extending the algorithm to allow this is technically possible, but involves a substantial amount of additional work.
The algorithm is also blind to syntactic boundaries such as punctuation, which insertions and deletions are likely to respect at least part of the time.
Manual inspection of the alignments showed a few cases where a deletion would affect two contiguous parts of an utterance separated by a comma, for which distinguishing the parts could help in improving the final alignment.
Finally, deep alignments are only explored on the basis of optimal shallow alignments, which are not guaranteed to be the best starting point:
it is possible that the search will find a locally optimal alignment, when a better solution could have been found by starting from other (non-optimal) shallow alignments.
There are many other possible improvements that we did not explore fully for lack of time, for instance matching insertion-deletion blocks from exchanges at different depths to overcome local optima, or starting with local instead of global shallow alignments.
The manual evaluation of alignments indicated that the current approach was good enough however, and that these optimisations could be left for further research without jeopardising our model.

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
This phenomenon is difficult to control for beyond the randomisation we applied, and we note that the cases we observed were extremely rare.
More broadly however, context and interaction are integral pants of the way an utterance is interpreted by subjects, and exploring their role is one of the most important avenues to be explored in this space.


### Future questions

One possibility for further research on this approach is to ask about the role of utterance semantics:
beyond lexical features and word categorisations, one could attempt to quantify the change in meaning at each transformation and overall through the chains, possibly through more integration with existing NLP methods.
Conversely, the extent to which the meaning of words (or their relationship to the rest of the utterance) participate in the transformation process could be explored.
Better integrating these results with what is known of the way utterances are cognitively processed is also a necessary next step:
it should be possible, for instance, to explain the patterns observed by this transformation model based on existing sentence parsing and processing models.
More to the point, it should also be possible to develop generative models of the process based on current knowledge in sentence processing and production.

Many questions from the last chapter also remain pending.
In particular, if context is an important factor in the transformations observed, we wonder about the role of feedback effects in the evolution of content online:
how much are transformations determined by the distribution of utterances that readers are exposed to, and how does this influence feed back into the distribution itself?
How much does the exact task given to subjects influence this process, and would the publication of a blog post be any different to that of a news story in this respect?
Answering these questions would provide a much more complete view of the dynamics at work in the short-term evolution of linguistic content.

A different way of approaching these questions would be to ask how much of the process can be explained by models such as the one we presented.
In other words, it would be useful to evaluate the extent to which one can explain the transformations and the evolution of utterances with similar (though possibly better optimised) models which remain mostly at the surface of utterances.
Indeed, our model does not include any information about the semantic or syntactic structure of utterances, beyond the semantic comparison of word pairs through context-free vector similarity (a measure that is arguably quite coarse, and superseded by current NLP methods which can include context).
Yet on hand evaluation it performs surprisingly well.
An answer to that question hinges on the capacity to evaluate model fit in a standardised way, that is being able to compare a model's predictions to empirical data.
Since in this case model predictions would be actual utterances, such a capacity is equivalent to being able to evaluate the distance between the meanings of two utterances in a standardised way (which is precisely one of the goals pursued with this modelling approach).
Our next chapter will focus on the challenge posed by this question.

<!--
The need for embedding

Any quantitative study relies on abstracting out details of particular cases by reducing (most often averaging) values in each dimension to a few indicators.
Being able to render a precise view of the studied phenomenon then depends on being able to determine which are the right dimensions to describe it, and having access to them [@becker_epistemology_1996].

Embedding experiments in the everyday life of subjects gives access to dimensions that can be otherwise unavailable:
through the use of smartphones, an experiment designer can trigger interactions with subjects (for instance asking questions) at any moment of the day, or have measures running while subjects are offline (using the ever-increasing number of sensors present on the devices), both of which are impossible with digital traces.
Above all, embedding an experiment means getting greater access to context, which opens the possibility of understanding phenomena the way they are meant in the lives of subjects, and not only in the way they are construed by the experiment designer.

*Daydreaming* is an example experiment developed as a smartphone application with Vincent Adam, Mikaël Bastian, Jérôme Sackur, and Gislain Delaire, that took advantage of this embedding.
The experiment, focused on our awareness of daily mind-wandering, would probe subjects during a month at random moments of the day to ask them if they were mind-wandering (and, if so, what were the qualities of their thoughts).
^[See \url{http://daydreaming-the-app.net/} for more details.]
While our team spent over a year developing the application, it allowed asking questions related to ecological situations which cannot exist in laboratory or passive collection studies.
\autoref{f:dd-question} shows a sample question asked to the subjects, and \autoref{f:dd-results} shows an example of the results produced at the end of the experiment (this particular screen shows the results for one subject; seeing their own results was part of the reward for subjects participating in the study).

![Example questionnaire in the Daydreaming app \label{f:dd-question}](images/daydreaming-questionnaire.png){width=35%}

![Results on weekly mind-wandering rhythms from the Daydreaming app \label{f:dd-results}](images/daydreaming-results-rhythms.png){width=35%}

* *Embedding*:
as explained above, smartphone-based experiments allow for real-life embedding:
the experiment designer can choose when and how interactions with the experiment and between subjects take place, and measure any number of variables the device gives them access to (geolocation, time, phone agitation through its accelerometers, general noise level, etc.), virtually at any moment.
-->
