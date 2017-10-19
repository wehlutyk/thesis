---
title: |
  \large Résumé long de thèse\
  \LARGE Épidémiologie des représentations:\
  une approche empirique
author: |
  Sébastien Lerique^[
    Centre d'Analyse et de Mathématique Sociales (CAMS, UMR 8557 EHESS-CNRS, Paris).
    Mél.: \hbox{\href{mailto:sebastien.lerique@normalesup.org}{sebastien.lerique@normalesup.org}}.
  ] \
  \hfill \
  Directeur: Jean-Pierre Nadal^[
    Centre d'Analyse et de Mathématique Sociales (CAMS, UMR 8557 EHESS-CNRS, Paris), et Laboratoire de Physique Statistique (LPS, UMR 8550 CNRS-ENS-UPMC-Univ. Paris Diderot, Paris).
    Mél.: \hbox{\href{mailto:jpnadal@ehess.fr}{jpnadal@ehess.fr}}
  ] \
  Co-directeur: Camille Roth^[
    Sciences Po, médialab (Paris), et Centre Marc Bloch e.V. (UMIFRE 14 CNRS-MAEE, Berlin).
    Mél.: \hbox{\href{mailto:camille.roth@sciencespo.fr}{camille.roth@sciencespo.fr}}
  ]
lang: fr-FR
geometry: a4paper
mainfont: TeX Gyre Pagella
link-citations: True
colorlinks: True
biblatexoptions:
  - style=authoryear-comp
  - uniquename=false
  - urldate=edtf
  - url=false
  - maxbibnames=20
  - giveninits=true
  - isbn=false
biblio-title: Bibliographie
# Additional headers
header-includes:
  # Output in PDF/A-1b
  - \usepackage[a-1b]{pdfx}
  # Biblatex style
  - \usepackage{csquotes}
  - \DeclareLanguageMapping{french}{french-apa}
  # Don't use small caps for citations (Biblatex does that for French)
  - \DefineBibliographyExtras{french}{\restorecommand\mkbibnamefamily}
---

# Résumé long

Les années récentes voient se développer les tentatives de rapprochement entre sciences cognitives et sciences sociales.
"Cognition sociale" et "Évolution culturelle" sont des exemples de thèmes émergents, abordés de manières multiples avec des apports de diverses disciplines.
Cette thèse concerne un thème formalisé au milieu des années 90 par Dan Sperber.
Dans une série d'articles novateurs rassemblés dans @sperber_explaining_1996, ce dernier propose un programme de recherche aujourd'hui connu sous le nom de théorie de l'attraction culturelle (*Cultural Attraction Theory* en anglais, noté CAT), visant à fournir un cadre commun dans lequel les sciences cognitives et les sciences sociales peuvent s'atteler à des questions interdisciplinaires.
Ce programme part d'une ontologie ne comportant que des représentations mentales (celles des sciences cognitives), et des représentations publiques (l'expression hors du cerveau d'une représentation mentale).
En proposant d'étudier la distribution et la dynamique d'évolution des représentations publiques circulant dans une société, Sperber développe un cadre permettant de combiner des travaux en anthropologie et en sciences cognitives pour l'étude des interactions entre évolution et culture.

La CAT a fait l'objet de développements théoriques récents avec une véritable modélisation mathématique [voir par exemple @claidiere_role_2007;@claidiere_how_2014].
Une communauté croissante aborde également les questions d'évolution et d'attraction culturelle avec des approches empiriques.
Le paradigme des chaînes de transmissions artificielles, par exemple, a été beaucoup utilisé dans l'étude de l'évolution itérée du langage [@tamariz_cultural_2016].
D'autres exemples de son utilisation sont l'étude de l'évolution de courtes boucles sonores modélisant une forme d'évolution musicale [@maccallum_evolution_2012], de la perception du risque dans des articles de presse [@moussaid_amplification_2015], ou de motifs visuels abstraits transmis par des babouins [@claidiere_cultural_2014].
Une deuxième approche consiste à compiler un grand nombre de travaux anthropologiques ou historiques à propos d'un phénomène culturel bien précis, afin de reconstruire l'évolution d'un type de représentation et en analyser les tendances.
C'est la méthode utilisée par @morin_how_2013 dans son étude de l'évolution, au cours des siècles, de la façon dont les portraits sont peints, et par @miton_universal_2015 dans leur étude de la pratique médicinale de la saignée.
Une troisième approche consiste à récolter des données de communautés en ligne pour analyser la propagation de représentations dans des réseaux sociaux.
Si bien les travaux pionniers de ce champ étaient basés sur des modèles d'exposition et de propagation atomique, où les objets d'étude étaient des entités simples et sans changements tels que des URLs [voir @cointet_how_2007 pour une discussion], les travaux récents modélisent les représentations linguistiques avec une complexité croissante, et développent progressivement une description des phénomènes de transformations qu'un modèle de contenus atomiques ne peut pas atteindre.
Plusieurs travaux étudiant de grandes bases de données de phrases réalistes ont déjà montré que la propagation ou la mémorisation de contenus linguistiques dépendra lourdement du contexte social [@bakshy_social_2009], du contenu sémantique et du style grammatical [@danescu-niculescu-mizil_you_2012], ainsi que de la situation de compétition avec d'autres contenus transmis [@weng_competition_2012].

L'éventail des disciplines impliquées et la diversité des méthodes mises en place dans l'étude de ces questions sont un signe de la difficulté à récolter des données pertinentes pour l'étude de l'évolution culturelle.
Les travaux cités ci-dessus développent plusieurs stratégies pour faire face à cet obstacle, mais laissent invariablement de côté certains aspects de la question :
les chaînes de transmission utilisent généralement des représentations extrêmement simples;
l'analyse quantitative de travaux anthropologiques ou historiques identifie des tendances pour lesquelles de nombreuses explications entrent en compétition;
enfin, les modèles de propagation de contenus en ligne ont tendance à négliger le rôle de la cognition dans les phénomènes étudiés.

Le fil directeur de cette thèse est le suivant :
en capitalisant sur les possibilités actuelles des technologies informatiques, et en particulier les possibilités expérimentales des navigateurs web, il est possible de combiner les avantages de ces différentes techniques pour étendre le champ des questions d'évolution culturelle qui peuvent être étudiées empiriquement.
Ce faisant, des sujets qui étaient jusque là restés au niveau théorique peuvent se manifester concrètement, ou même devenir des problèmes qu'il faudra résoudre pour avancer.
Les travaux présentés dans cette thèse se concentrent sur un type particulier de représentation linguistique :
de courts énoncés écrits, composés au plus de quelques phrases.
Ce type de représentation est à la fois adapté à l'étude empirique (il est courant dans les réseaux sociaux en ligne, et relativement facile à utiliser dans des expériences contrôlées) et extrêmement versatile et varié.
En prenant ces énoncés comme matériau principal, la présente thèse se propose de contribuer à l'étude empirique d'une des questions centrales de la CAT :
l'existence d'attracteurs culturels, et leur pertinence dans l'étude de l'évolution culturelle à court terme.

Un premier cas d'étude se concentre sur les transformations que des citations, c'est-à-dire un cas particulier d'énoncé qui en théorie ne devrait pas changer, subissent lorsqu'elles se propagent en ligne, de billets de blogs en article de presse et vice versa.
En codant les mots de ces citations avec des variables lexicales dont les effets sont bien connus en psycholinguistique, nous montrerons que la façon dont des mots individuels sont substitués est en accord avec l'hypothèse des attracteurs culturels, et avec les effets connus de ces variables lexicales en psycholinguistique.
En particulier, les mots connus pour être plus difficiles à rappeler dans des tâches de rappel de listes ont tendance à être plus substitués, et les mots plus faciles à produire dans ces tâches sont aussi plus souvent introduits en remplacement.
Le motif particulier des substitutions observées montre également que ces transformations introduisent des mots qui sont en moyenne plus proches d'une valeur spécifique à chaque variable lexicale, valeur qui agit comme un attracteur sur cette dimension.
Ces résultats soutiennent l'hypothèse selon laquelle des attracteurs culturels peuvent résulter de l'interaction de biais cognitifs individuels dans l'interprétation et la reproduction de représentations [@lerique_semantic_2017].

Un deuxième cas d'étude vise à s'affranchir des limitations de cette première étude, en transposant la situation à une expérience contrôlée de chaîne de transmission.
En effet, le besoin d'inférer les informations manquantes dans le jeu de données en ligne utilisé précédemment, sans pour autant perdre en fiabilité des résultats, nous a contraint à analyser uniquement les substitutions de mot à mot, laissant de côté des transformations plus complexes.
Une chaîne de transmission standard semble être la solution évidente à ce problème, mais deux problèmes supplémentaires apparaissent :
d'une part, l'espace des énoncés initiaux qui pourraient être étudiés est extrêmement vaste, et ce choix peut avoir un impact sur les transformations observées ;
d'autre part, analyser l'évolution détaillée de contenus linguistiques (versus, par exemple, contraster le résultat de l'évolution de deux classes de contenus initiaux) est un problème non trivial qui dépend également du type d'énoncé utilisé.
Les connaissances actuelles sur la façon dont des phrases mémorisées et répétées peuvent être spontanément transformées semblent divisées entre, d'un côté, des résultats en psycholinguistique sur le rappel immédiat de phrases maximalement simples, et de l'autre, des tendances de haut niveau qui apparaissent lors de la transmission en chaîne d'histoires plus complexes, mais pour lesquelles des explications détaillées au niveau cognitif n'ont pas encore été développées.
On se propose ici de fournir les premières briques d'un pont entre ces deux corps d'études, en créant un modèle descriptif détaillé des transformations que les énoncés subissent lors de leur transmission en chaîne.
Afin d'accélérer l'exploration de l'espace des énoncés initiaux possibles, nous avons développé une plateforme web complète pour la réalisation de chaînes de transmission, nous permettant de récolter rapidement des jeux de données de qualité pour un type d'énoncé initial donné [@lerique_gistr_2016].
En appliquant et développant un algorithme d'alignement de séquences issu de la bio-informatique, nous décomposerons les transformations des énoncés en des opérations élémentaires, opérations qui sont ensuite recombinées pour former les changements plus complexes observés dans les chaînes de transmission.
Nous proposerons ainsi un premier modèle descriptif de la transformation de ces énoncés.
En se basant sur deux corpus d'énoncés, l'un fait de paires de phrases mémorables et non-mémorables, et l'autre fait de courtes histoires littéraires, nous décrirons le comportement détaillé des opérations élémentaires, et montrerons que l'évolution globale des énoncés au cours des chaînes est compatible avec l'existence d'un attracteur au niveau lexical.
Finalement, nous reproduirons les résultats du corpus en ligne et discuterons ces résultats à la lumière de l'hypothèse de l'attraction culturelle.

Le dernier chapitre relie ces travaux à un débat plus général en philosophie du langage et dans l'étude de l'évolution du langage.
Nous commençons par discuter quelques exemples venus du deuxième cas d'étude où le sens des énoncés joue un rôle important dans les transformations, pour montrer que l'analyse de ces effets requiert une théorie complète du sens des énoncés, en lien avec leur contexte d'interprétation.
L'étape suivante dans l'explication de l'évolution de tels énoncés à court terme est donc l'analyse des mécanismes d'interprétation des énoncés dans des situations concrètes.
Nous présenterons deux approches importantes pour s'atteler à ce problème :
la Théorie de la Pertinence et l'Approche Énactive du langage.
Nous montrerons comment ces deux approches peuvent être appliquées dans le cadre de l'attraction culturelle, et comment chacune est reliée au débat actuel entre explications représentationnelles et dynamiques de la cognition et du langage.
Enfin, nous esquisserons quelques possibilités de travaux empiriques qui pourraient faciliter l'application de ces théories dans le contexte de l'évolution culturelle, afin de mieux comprendre le rôle du sens linguistique dans l'évolution d'énoncés à court terme.
