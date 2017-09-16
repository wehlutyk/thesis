## Discussion

We initially aimed to connect the field of cultural evolution with psycholinguistics by asking if cultural attractors appear in a corpus of online news-related quotes gradually transformed by low-level biases.
The data set we used imposed a few constraints on our analysis:
first, it was necessary to infer source-destination links, an operation made more reliable when restricting the scope of transformations to very simple cases, which we did by focusing on single word substitutions.
Second, contrary to laboratory experiments which produce data made of many repeated measures on a small number of cases (e.g. a given list of words), we have a great number of different cases (one case per cluster in which substitutions are found, i.e. 698 cases), with very few measures on each of them (average 9, median 5).
This rendered the prediction of individual words impractical: if we cannot compute a percentage of explained data for a given case, any approximate prediction will be heavily underestimated.
This last factor, added to the potential for variation of external conditions when authors wrote the quotes, led us to use word features to analyze the transformations by aggregating over individual cases.

By characterizing substitutions with 6 features on the disappearing word, we show that authors preferentially substitute words known for being harder to recall:
most prominently words with low frequency [@gregg_word_1976], learned later [@dewhurst_separate_1998], or made up of more letters [@nickels_dissociating_2004], both globally and in comparison to the sentence they appear in.
Further characterizing the substitutions by examining the variation of word features from disappearing to appearing words, we show:
(a) that the operation is contractile on average, that is words are brought closer to an attractor point on each feature;
(b) that authors produce words that are easier to remember than the average of synonyms of the disappearing word (a fact that is reflected in the position of the attraction point).

We do not actually observe quotes converging on a global scale towards attractors in their various dimensions.
Indeed the limits of the data set do not allow us to infer chains of substitutions, and substitutions themselves are not the only type of transformation at work in the data set.
Nonetheless, these findings (a) bring light to this simple type of transformation, and (b) are consistent with known psycholinguistic effects, with the hypothesis of cultural attractors in representations from everyday life, and with the lineage specificity discussed in the iterated learning literature [@claidiere_cultural_2014;@cornish_systems_2013].
They are obtained by successfully applying knowledge from cognitive science to real-life complex data, a task that remains a challenge in the study of cultural evolution.
More broadly, we believe that applying such data mining tools to manage the complexity of real-life data is a promising approach for the joint analysis of cognitive science and culture.

In the simple case presented here, however, much remains to be explored.
Since it is clear that observing cognitive biases in such data is now possible, questions addressed in controlled laboratory situations could be opened by further research.
One question concerns the influence of the context surrounding a quote, be it in terms of other quotes preceding it temporally or of text surrounding it in a post.
A first step could be the application of results from @zaromb_temporal_2006 who have shown, in the simpler task of recall of random word lists, that the source of prior-list intrusions can be predicted based on the associations those preceding lists have formed:
in our case, a substitution could be triggered and directed by associations formed by preceding context.
A further step would be to follow what @cornish_systems_2013 have shown about reciprocal influences between context and transformations (in their case, with transmission chains of artificial content).
Indeed substitutions, and more generally all transformations, also participate in creating the context for later quotes.
One can ask, therefore, what are the reciprocal effects between, on one side, the corpus-level evolution of quotes through iterated transformations, and on the other side, a gradual change in the properties of transformations operated because of the evolution of surrounding context.
Such interactions have been shown to underlie the lineage specificity observed in transmission chains [@claidiere_cultural_2014].
Exploring how similar loop interactions happen in real-life data could indeed be the next step in understanding the coevolution of cultural content and the ways in which it is transformed.
In our particular case, such insight could shed some light on how the feature attractors examined in this paper actually emerge, and help assess their potential role on this coevolution.

## Concluding remarks

The theory of Epidemiology of Representations proposes a unifying framework for the study of cultural evolution.
One of its core claims, the existence of cultural attractors, has been both a challenge to test empirically and a fruitful line to pursue in the study of cultural evolution.
We aimed to contribute to testing this hypothesis by studying a simple everyday-life task where individuals are implicitly trying to reproduce quotations.
To some extent, our work amounts to an out-of-laboratory experiment where we examine the influence of well-known word features on the accuracy of reproduction of short sentences.
Our analysis of substitutions shows that words are attracted, in each dimension, to feature-specific values.
Furthermore, the features' known effects in psycholinguistic experiments are reflected in the biases of these attraction points, meaning that the evolution of such quotations can be partially explained by known low-level cognitive biases.
We believe that such an approach, which combines psycholinguistic knowledge and data mining tools, can be fruitfully developed to improve the study of cultural attractors and explore the reciprocal influences of cognition and culture.

Let us conclude by noting that the question of short- and long-term cultural evolution, and the approaches to study them, are becoming increasingly relevant to other fields.
In biology in particular, work on evo-devo and non-genetic inheritance has accumulated evidence that is poorly accounted for by the modern synthesis of biological evolution, and is creating a demand for new or extended  approaches to joint cultural and biological evolution [see @gilbert_eco-evo-devo:_2015 for instance].
Such an approach has long been called upon by anthropologists like @ingold_beyond_2004 [-@ingold_complementarity_1998], in line with Mauss' initial works [@mauss_les_1936], and the question is not entirely foreign to the enactive-representational debate in cognitive science.
The study of cultural evolution will most likely benefit greatly from the growing interactions between these disciplines.

### Acknowledgements {-}

We are warmly grateful to Ana Sofia Morais for her precious feedback and advice on this research, and to Telmo Menezes, Jean-Philippe Cointet, Jean-Pierre Nadal, Sharon Peperkamp, Nicolas Claidière and Nicolas Baumard for useful suggestions and comments.

This work has also been partially supported by the French National Agency of Research (ANR) through the grant Algopol (ANR-12-CORD-0018).

### Software colophon {-}

Finally, this paper was developed using Python's scientific computing ecosystem [@millman_python_2011].
In particular, we directly used NumPy and SciPy [@van_der_walt_numpy_2011], Matplotlib [@hunter_matplotlib:_2007], Pandas [@mckinney_data_2010], scikit-learn [@pedregosa_scikit-learn:_2011], NetworkX [@hagberg_exploring_2008], NLTK [@bird_natural_2009], IPython [@perez_ipython:_2007], and many other libraries from the Python ecosystem.
The software and analyses written for the paper are documented and published under a Free Software license.
They can be found at [github.com/wehlutyk/brainscopypaste](https://github.com/wehlutyk/brainscopypaste).
