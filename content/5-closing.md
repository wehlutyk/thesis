# Conclusion {-}

Let us come back to our initial example:
When hit with the memory of a particular sentence that we cannot locate, we might phrase it in half a dozen different ways while searching for its source.
In the process, we might even tell a friend about the sentence, providing her with yet another formulation.
What would happen if she told her understanding of that idea to someone else?

We took this example to be a particular case of the evolution of linguistic utterances, which in turn seemed like a useful use case for the exploration of a broader theory of the evolution of culture:
Cultural Attraction Theory.
One of the core claims of this theory, the existence of cultural attractors, has been both a challenge to test empirically and a fruitful line to pursue in the study of cultural evolution.
More generally, the empirical exploration of quantitative approaches to the evolution of culture has proven to be a non-trivial task, not least because of the data collection and analysis challenges involved.
Yet improved empirical approaches are a crucial tool not only to assess the validity of cultural evolutionary theories, but also to help in identifying the benefits and difficulties that come with using them, and to highlight overlooked questions that need further clarification.

We therefore set out to develop two novel empirical methods that would contribute detailed use cases related to CAT, provide reusable improvements to current methods for the broader exploration of cultural evolutionary ideas, and pinpoint questions that require more exploration.
Linguistic utterances appeared as a particularly interesting matter to focus on.
First, they are one of the most versatile artefacts involved in cultural evolution, which renders them more challenging to study but also makes them relevant to a wide array of cultural domains.
Second, language is one of the focal points on which CAT can be differentiated from other theories of cultural change and of underlying approaches to cognition itself.

In @sec:brainscopypaste, then, we analysed substitutions undergone by online quotes in blogspace.
By combining psycholinguistic knowledge with data mining tools, we showed that these transformations attract words, on average, towards feature-specific values, and are thus compatible with the hypothesis of an attractor at the lexical level.
Furthermore, the features' known effects in psycholinguistic experiments are reflected in the biases of these attraction points, suggesting that the evolution of such quotations could be partially explained by known low-level cognitive biases.
To some extent, this approach amounts to an out-of-laboratory experiment where we examined the influence of well-known lexical word features on the accuracy of reproduction of short sentences, an approach that could be much developed to study ecological situations in real life.

In @sec:gistr, we extended the study of the short-term evolution of utterances by examining the full transformations they undergo in artificial transmission chains.
We developed an online transmission chain platform that let us collect large amounts of fully measured and high quality transmission chains.
By using and extending a sequence alignment algorithm originating in bioinformatics, we decomposed transformations into combinations of lower-level operations, and described the detailed dependencies between each of these operations.
We thus proposed a first tentative grammar of word operations for the transformations of short utterances in a simple memorise-and-rewrite task.
The picture we created for transformations provides a detailed view of the way the process operates, and of its effect on the lexical features of sentences in the long term.
Crucially, it provides a first step for descriptive models, and later on for generative models, to link the low level of lexical word transformations, which is well studied in psycholinguistics, with the high level of accumulated evolution, which cultural evolutionary theories model.

Finally, in @sec:discussion we provided a more in depth analysis of the possible role of meaning in the way utterances are transformed.
We discussed a few cases of meaning change arising in the preceding chapter, and showed that in such cases meaning is inherently tied to the context in which utterances are interpreted, and plays an important role in the way utterances evolve over time.
We then presented two major approaches that could be used to understand the way meaning is interpreted in utterances, and proposed concrete methods that could be used to start studying utterance changes at the level of meaning.

We believe that, taken together, these works provide a significant step forward in empirical approaches to the study of short-term cultural evolution:
they fill gaps in the current empirical exploration of CAT, and detail two novel techniques that could be fruitfully reused and extended to improve empirical prospects.
More proximally, they also create an accurate picture of the way utterances are transformed in chains, providing a partial answer to how linguistic content might evolve as it spreads through a social network.

Naturally, this work opens many more questions than it could answer.
As we alluded to in the introduction, analysing meaningful changes in this process cannot be entirely separated from an overall construal of cognition, and of the way cognition and culture interact with each other.
The question of short- and long-term meaningful cultural evolution, and the approaches to study them, is therefore becoming increasingly relevant to other fields.
In particular, the questions we explored in @sec:discussion relate to debates about how cultural and non-cultural aspects of life can be integrated together, and how their respective evolutionary processes influence each other.
Contrasting approaches to these questions, in particular, might be one of the best contributions that empirical improvements can bring to the debate.
We believe doing so could provide a great many interesting insights into the nature of cognition and of meaningful interactions overall.


## Acknowledgements {-}

We are warmly grateful to Ana Sofia Morais for her precious feedback and advice on this research, and to Telmo Menezes, Jean-Philippe Cointet, Jean-Pierre Nadal, Sharon Peperkamp, Nicolas Claidière and Nicolas Baumard for useful suggestions and comments.

This work has also been partially supported by the French National Agency of Research (ANR) through the grant Algopol (ANR-12-CORD-0018).

- parents
- Valeria & Amaïa
- CMB
- Directors
- Friends for supporting conversations


## Software colophon {-}

Finally, this paper was developed using Python's scientific computing ecosystem [@millman_python_2011].
In particular, we directly used NumPy and SciPy [@van_der_walt_numpy_2011], Matplotlib [@hunter_matplotlib:_2007], Pandas [@mckinney_data_2010], scikit-learn [@pedregosa_scikit-learn:_2011], NetworkX [@hagberg_exploring_2008], NLTK [@bird_natural_2009], IPython [@perez_ipython:_2007], and many other libraries from the Python ecosystem.
The software and analyses written for the paper are documented and published under a Free Software license.
They can be found at [github.com/wehlutyk/brainscopypaste](https://github.com/wehlutyk/brainscopypaste).

- Gistr colophon


# References
