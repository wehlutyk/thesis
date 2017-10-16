---
title: |
  \large PhD Abstract \
  \LARGE Epidemiology of representations:\
  an empirical approach
author: |
  Sébastien Lerique^[
    Centre d'Analyse et de Mathématique Sociales (CAMS, UMR 8557 EHESS-CNRS, Paris).
    Email: \hbox{\href{mailto:sebastien.lerique@normalesup.org}{sebastien.lerique@normalesup.org}}.
  ] \
  \hfill \
  Supervisor: Jean-Pierre Nadal^[
    Centre d’Analyse et de Mathématique Sociales (CAMS, UMR 8557 EHESS-CNRS, Paris)}, and Laboratoire de Physique Statistique (LPS, UMR 8550 CNRS-ENS-UPMC-Univ. Paris Diderot, Paris).
    Email: \hbox{\href{mailto:jpnadal@ehess.fr}{jpnadal@ehess.fr}}
  ] \
  Co-supervisor: Camille Roth^[
    Sciences Po, médialab (Paris), and Centre Marc Bloch e.V. (UMIFRE 14 CNRS-MAEE, Berlin).
    Email: \hbox{\href{mailto:camille.roth@sciencespo.fr}{camille.roth@sciencespo.fr}}
  ]
lang: en-GB
geometry: margin=1.2in
mainfont: TeX Gyre Pagella
link-citations: True
colorlinks: True
biblio-style: apa
# Additional headers
header-includes:
# Output in PDF/A-1b
- \usepackage[a-1b]{pdfx}
# Biblatex style
- \usepackage{csquotes}
- \DeclareLanguageMapping{english}{english-apa}
---

# Abstract

Recent years have seen several attempts to unify cognitive science and social science.
The fields of Social cognition and Cultural evolution, involving an increasingly diverse range of disciplines, have emerged as promising approaches over the past decade.
This thesis is concerned with a subject formalised by Dan Sperber in the mid-nineties:
in a series of innovative articles gathered in @sperber_explaining_1996, the author suggests what is now known as Cultural Attraction Theory (CAT), aiming to provide the cognitive and social sciences with a common framework to address interdisciplinary questions.
CAT starts from an ontology made only of "mental representations" (those from cognitive science) and their expressions in the outer world, "public representations".
By proposing to study the distribution of public representations that circulate in a society, it provides a framework in which knowledge from cognitive science and anthropology can be combined to explore the interactions between evolution and culture. <!-- [as exemplified in @baumard_mutualistic_2013]. -->

<!-- Cultural Attraction Theory starts from an ontology made of "mental representations" (those from cognitive science) and their expressions in the outer world, "public representations". It proposes to study the distribution of public representations that circulate in a society, and combine knowledge from cognitive science and anthropology to explain their evolution. As Sperber argues, this naturalistic approach builds on cognitive principles, is amenable to and can benefit from anthropological works, and allows interdisciplinary questions to be rephrased in terms of epidemiology of representations. For instance: what types of representations are only weakly transformed as they are interpreted and produced anew by successive people? Those representations, spreading wider than the others, become cultural. Are they attractors for the interpretation-reproduction process of representations? If so, which cognitive modules are involved in the stability of such representations? -->

Over the last decade, this research programme has benefited from several theoretical developments with genuine mathematical models [@claidiere_role_2007;@claidiere_how_2014].
A growing community also explores these questions with empirical approaches.
Artificial transmission chains in the laboratory, for instance, have been used extensively to study iterated language evolution [@tamariz_cultural_2016].
The paradigm has also been used to study the evolution of short audio loops [@maccallum_evolution_2012], of the perception of risk in news stories [@moussaid_amplification_2015], or of abstract visual patterns transmitted by apes [@claidiere_cultural_2014].
A second empirical approach consists in analysing large numbers of anthropological or historical works on a given subject to rebuild the evolution of a representation as it happened.
This technique has been used by @morin_how_2013 in his study of the way painted portraits change over the centuries, and by @miton_universal_2015 in their examination of the practice of bloodletting.
A third approach is to crawl online content and communities in order to study the spread and propagation of representations in human networks.
While early works on online content were based on atomic propagation and exposure models where simple entities such as URLs and innovations were the central object [see @cointet_how_2007 for a discussion], this stream of research is increasingly modelling linguistic representations as deep objects with complexity of their own, improving on simpler virus-like models.
Indeed several works have now studied large quantities of meaningful sentences, showing that their propagation can depend heavily on social context [@bakshy_social_2009], semantic content and grammatical style [@danescu-niculescu-mizil_you_2012], as well as on competition between items [@weng_competition_2012].

The wide array of disciplines studying these complementary questions, and the variety of techniques used in the process, testify to a major obstacle:
collecting relevant data in usable amounts to analyse cultural evolution is challenging.
The works cited above develop several strategies to face the problem, yet must invariably leave aspects of the question aside:
transmission chains usually operate on very simple representations;
recompiling historical and anthropological works uncovers trends with many explanations competing for causality;
models of online content propagation overlook cognitive levels of explanation by and large.

The guiding rationale for this thesis is the following:
by taking advantage of current computing and web technology, and increasing interdisciplinarity, one can recombine the advantages of these different techniques into approaches that expand the range of questions available to empirical studies of cultural evolution.
In the process, matters which had until then remained at the theoretical level become concrete problems that can be challenged or must be faced to make progress.
In this work we focused on one particular type of linguistic representations:
short written utterances, up to a few sentences long.
These are both widely available for empirical study---as they are widespread in online social network data and relatively straightforward to collect in controlled experiments---, while at the same time extremely varied and versatile.
Using them as our main material, we aim to contribute to the empirical testing of one of the core hypotheses in CAT:
the existence of cultural attractors, and their relevance to the study of cultural evolution.

A first detailed case study examines transformations that quotations, that is a particular case of short utterances found online, undergo as they are propagated from blog to blog or media website.
By coding words with a number of lexical features that are well studied in psycholinguistics, we show that the way words are substituted in quotations is consistent with the hypothesis of cultural attractors and with known effects of the word features.
In particular, words known to be harder to recall in lists have a higher tendency to be substituted, and words easier to recall are produced instead.
Furthermore the particular pattern of substitutions observed shows that, on average, these transformations produce words that are closer to a feature-specific attractor value.
These results support the hypothesis that cultural attractors can result from the combination of individual cognitive biases in the interpretation and reproduction of representations [@lerique_semantic_2017].

A second case study aims to improve on the limitations of the first, by transposing the situation to a controlled transmission chain experiment.
Indeed, having to infer missing information in the above data set---while at the same time keeping the results reliable---constrained us to analyse word substitutions only.
While transmission chain experiments are an obvious next step to counter that caveat, they present an additional challenge:
the space of initial utterances that deserve to be studied is extremely large, and analysing the actual evolution of linguistic content (vs., for instance, contrasting the evolutionary outcomes of different categories of initial utterances) is an open question that depends on the utterances studied.
Indeed current knowledge on utterance transformations seems divided between, on one side, known effects of sentence recall that are studied on maximally simple sentence types, and on the other, high-level biases that appear in the transmission of complex stories, yet for which no detailed lower-level explanation has been provided.
Here we provide first steps to connect these two bodies of knowledge, by creating a detailed descriptive model of the transformations undergone by utterances in transmission chains.
In order to accelerate the exploration of the space of possible utterances, we developed a full transmission chain web experiment that can rapidly gather quality transmission data for a given utterance type [@lerique_gistr_2016].
Then, by applying and extending a sequence alignment technique which originates in bioinformatics, we reliably decompose utterance transformations into small chunks of operations that are combined to create larger changes, thus proposing a first descriptive model of the transformation of utterances.
Relying on a corpus of memorable and non-memorable quotes from movie scripts and a set of short literary stories, we describe the detailed behaviour of individual operations and show that the overall evolution of utterances is compatible with the existence of an attractor at the lexical level.
We further reproduce our previous results in the controlled setting, and discuss the behaviours identified by our descriptive model in light of the cultural attraction hypothesis.

The final chapter connects these works to a broader debate in the philosophy of language and the study of language evolution.
We first present a number of examples from the previous chapter where utterance meaning plays a significant role in transformations, and show that analysing such effects requires a full account of meaning in relation to interpretive context.
We thus argue that the next step in explaining the short-term evolution of such utterances is to concentrate on the mechanisms that determine their actual interpretation in a concrete situation, and discuss two prominent approaches that could be used to do so:
Relevance Theory, and the Enactive approach to language.
We show how both approaches could be applied in the cultural attraction framework, and how each of them is connected to the ongoing debate between representational and dynamical approaches to cognition and language.
Finally, we suggest a number of empirical possibilities to make progress in the application of these theories in the cultural evolution context, and thus better understand the role of meaning in the short-term evolution of utterances.
