## Methods {#sec:gistr-methods}

### Experiment design principles and process

#### Advantages and challenges of transmission chain

An obvious way to address the questions raised in the previous chapter is to use a transmission chain experiment to study the evolution of online quotations in a controlled setting:
each subject reads, retains, and rewrites sentences that are then passed on to the next subject in a chain of reformulations.
If designed carefully, such a setup can reproduce an idealised version of the read-remember-rewrite process which, we hypothesised, participates in the evolution of quotations in blogspace and media outlets.
It also provides the information that our previous data set lacked in order to analyse the complete transformations of quotations, as well as the long-term effect of those changes:
the links between parent and child sentences are naturally encoded in the data, such that the transformations undergone by each sentence can be studied in full detail without restricting ourselves to simpler changes as was necessary for the inference procedure used with digital traces from blogspace.
By creating an artificial setting, the experiment design also lets us control the reading and writing conditions as well as the context in which sentences appear, which further removes one of the inevitable uncertainties of the previous protocol (albeit at the cost of less ecological conditions).

As previously, our approach is exploratory, which renders the laboratory transmission chain paradigm difficult to apply directly:
we aim to collect data that will allow us to study both the complete set of transformations undergone by short utterances such as online quotations, and the interactions and cumulative effect of such changes;
yet we do not know in advance the types of changes that subjects will make, or the extent to which such changes vary according to the type of linguistic content.
Transmission chain studies typically start with an a priori hypothesis focused on a well-identified type of content, which is then empirically tested by contrasting the evolutionary outcome of two classes of sentences.
Our goal here, however, is to provide first steps in characterising the process by which such evolution of linguistic content arises, and observe how it accumulates in the long term.
The setup must thus allow us to collect enough data to extract regularities in successive transformations operated by different subjects on different sentences, and provide a resolving power similar to that of substitutions in online quotations so that we can compare results with the previous chapter.
Since our main target is the set of detailed transformations and their interactions, versus targeting the contrast of accumulated outcomes, it is also crucial to fine-tune the difficulty of the read-write task and the complexity of the source sentences, in order to trigger a set of transformations varied enough that it could approach some of the changes encountered in real life situations.
Our progress therefore involves a non-trivial trial-and-error component:
indeed, a task made too easy or too difficult, and more so a set of source sentences that are too complex or too straightforward, will lead to either mass deletions or perfect conservation (or the former followed by the latter), none of which can help characterise the more intricate changes that linguistic content undergoes in the ecological setting we aim to simulate.


#### Web and smartphone experiments

Complementary to laboratory studies and to approaches using online digital traces, a new empirical approach based on Web browsers and mobile computing is striking a different balance in the trade-offs of experimental work which seems very promising in addressing the problems outlined above.
Indeed, browsers (both on desktop and mobile) and smartphones have evolved into powerful, ubiquitous application environments for which one can develop any kind of experiment involving text, graphics, and human interactions.
At the cost of increased engineering requirements and a different approach to subject recruitment, Web and smartphone experiments give the designer full control over what data is collected and the way interactions are framed (similar to laboratory experiments), and make it possible to quickly collect data sets at scales comparable to what filtered and cleaned digital traces provide.

This approach makes a number of unusual trade-offs, the benefits of which can be summarised as follows:

* *Control*:
  similar to laboratory experiments, and unlike digital trace analysis, it is possible to use complex designs where all the interactions of the subjects are framed and observed by the experimenter.
  This includes for instance the presentation of the experiment (e.g. as a game or a self-improvement aid, aside from being a scientific study) and, more importantly, the ways in which the system mediates the interactions between the subjects.
* *Scale*:
  if and when needed, the technical platform can scale the number of subjects to the tens of thousands at low marginal cost.
  Interactions between subjects can also scale to involve synchronous or asynchronous contact between hundreds of people, without having to manage per-subject scheduling.
* *Speed of data collection*:
  once the initial development is completed (see costs below), the data collection cycle is short.
  One day can be enough to collect a data set comparable in size and quality to the final substitutions set extracted and analysed in the previous chapter.
  This is especially relevant for exploratory work which is made much easier with shorter trial-and-error cycles.
* *Flexible recruitment*:
  while also a challenge (see costs below), subject recruitment is more flexible than in the laboratory:
  services like Prolific Academic
  ^[\url{https://www.prolific.ac/}]
  let the experimenter recruit at reasonable costs in pools of tens of thousands of subjects with fine-grained demographic filters.
  Wider audiences can be achieved by offering non-financial rewards, framing the experiment as a self-improvement application, or turning it into a game.

The corresponding costs are the following:

* *Technical challenge*:
  developing Web and smartphone experiments involves a substantial amount of engineering, and makes use of an array of technologies that most researchers, even technical, are not familiar with.
  While some all-in-one kits exist,
  ^[See e.g. \url{http://funf.org/} and \url{http://www.epicollect.net/}.]
  creating an experiment that meets one's research questions often requires learning average skills in most of the various technologies at play:
  a native or cross-platform smartphone development environment, Web application development, backend server programming, and some server administration skills.
  Most importantly, the paradigms and problems encountered are often new to researchers:
  most programming is asynchronous due to network communication or the user interface, and technicalities such as user management or email validation can grow into difficult engineering challenges.
* *Spam-control*:
  subjects are not constrained or encouraged by the face-to-face interaction of a laboratory experiment, neither are they (in most experiments) in the course of an interaction with friends that provides natural incentives for what they write, as can be the case with digital traces.
  Participants must have an incentive to perform the experiment's tasks well.
  If the spam introduced by one subject can be isolated in the design of the experiment, one possibility is to filter it once the data is collected and make payment depend on its prevalence.
  But if the spam introduced by one subject naturally propagates to data seen by other subjects in the experiment, as is the case for transmission chains, effective anti-spam pressures and motivations need to be factored into the design.
* *Recruitment cost*:
  while recruiting a few dozen or even a few hundred subjects is generally cheaper (not counting the cost of developing the experiment) than the equivalent for a laboratory experiment,
  ^[Global competition on online platforms like Prolific Academic drive subject payments down.]
  and can be very easy for fast prototyping and pilots, recruitment cost rises linearly with the number of subjects and the time they spend on the experiment, unless a different strategy is used.
  Turning an experiment into a playful application or an application useful to the subjects (effectively making them users) involves yet another set of skills, can prove challenging, and must be factored into the development cost.


#### Web-based transmission chains

The balance achieved by the Web-based approach is particularly adapted to the experimental  requirements we outlined above.
Since no existing system would fit our needs, we chose to develop a reusable Web-based platform to run a series of studies that would allow us, once ready, to gather sufficient amounts of quality data in short cycles.
We further decided to implement the simplest possible version of the transmission chain paradigm that is still viable, and leave the exploration of more complex setups for future research:
the task we used asks subjects to read and memorise a short utterance, wait a few seconds, then rewrite what they have read as accurately as possible.

Subjects' productions are arranged in chains, such that what a given subject produces is used as the source utterance for the subject appearing next in a chain.
In particular, the utterances to memorise are presented with no surrounding context, no distraction task is used between the reading and writing phases, and the material incentive for the task is purely monetary (although as we describe below we fine-tuned the interface to strongly encourage subjects to be conscientious).
This simple setup lets us quickly gather data sets of several thousand utterance transformations, ensuring our results will be comparable to those from the set of \num{6177} substitutions we extracted in the previous chapter.
Two parameters are left to vary:
the reading time for the source utterances, computed as the number of words in an utterance multiplied by a reading factor that is to be adjusted, and the set of initial source utterances.

The experiment is available to subjects as a website, and passing it involves the following steps:

* Welcome and sign up ([@fig:gistr-welcome;@fig:gistr-signup]),
* Answering a preliminary questionnaire (@fig:gistr-questionnaire),
  ^[An early version of the experiment also included a word span test at this stage.
  However, similarly to the age of subjects that we collect in the questionnaire, this data turned out to not be relevant in the analyses.
  The magnitude of transformations depends far more on the conscientiousness of subjects, and this non-trivial test was later removed during one of the frontend rewrites.
  ]
* Subjects then start training for the main task, where they are asked to repeatedly memorise and rewrite short utterances as accurately as possible.
  As the instructions in @fig:gistr-instructions indicate, an utterance is presented to the subject and after a short pause they are asked to rewrite it as remembered.
  The process loops until the subject has completed all the utterances assigned to them (calibrated so that completing the experiment lasts at most one hour).
  The real trials start after 3 to 5 training trials, depending on the overall experiment length.

Each utterance from the initial set is used to create several parallel chains in order to allow for comparisons across chains with the same initial utterance.
The final data thus consists in a set of reformulation trees, where each tree branch is a transmission chain started from the tree root, and continuing until it reaches a target depth defined for the experiment.
^[We therefore use the terms "chain" and "branch" interchangeably in what follows.
]
The number of branches in a tree is also adjusted for each run of the experiment.
Except for those who drop out before finishing the experiment, all subjects are exposed exactly once to each tree in random order, such that all the reformulations in a given tree are made by distinct subjects, and nearly all subjects (excluding dropouts) are present in each tree.
Finally, note that when exposed to a tree, subjects are always randomly assigned to the tip of one of the branches that have not yet reached the target depth:
subjects are thus randomly distributed across branches, but their depth-ordering loosely corresponds to time of arrival on the tree.
In particular, if a subject starts the experiment after most other subjects have completed it, he or she will be mostly exposed to utterances deep in the branches.
Due to the chained nature of the data, there is no economical way of countering this ordering bias.
^[The following three approaches could be combined to counter ordering bias.
(1) Have each subject do a single trial, that is, use as many subjects as there are reformulations in the full experiment;
this is extremely expensive as there is a fixed minimal price for each subject, in order to give time to explore the interface, answer the initial questionnaire, and train for the task.
(2) Have each subject wait an adjustable amount of time between each trial, to open the possibility of ordering subjects differently from their time of arrival;
this is also expensive, as it means paying subjects for waiting most of the time they spend on the experiment.
(3) Optimise the order of tree presentations of each subject so as to spread subjects across depths;
while this approach could achieve some level of spread when combined with (2), it is contingent on the starting times of subjects and their synchronisation, which we do not control (subjects find the experiment through Prolific Academic notifications and are free to start whenever they want).
]
@Fig:gistr-trees shows a representation of the shape of the final trees.

<div id="fig:gistr-start">

![Welcome screen](images/gistr/gistr-welcome.png){#fig:gistr-welcome width=48%}
<span> </span>
![Signup form](images/gistr/gistr-signup.png){#fig:gistr-signup width=48%}

Initial steps for a subject entering the experiment.
</div>

![Initial questionnaire.
Subjects can additionally submit feedback on the questionnaire or any other aspect of the experiment on most screens of the website.
](images/gistr/gistr-questionnaire.png){#fig:gistr-questionnaire width=90%}

![Instructions for the main task
](images/gistr/gistr-instructions-training.png){#fig:gistr-instructions width=75%}

![Two example reformulation trees generated by the setup:
the text on the left is the initial utterance for all branches of a tree, represented by a red dot in the right-hand graph; each grey dot in the graph represents an utterance produced by a subject on the basis of the preceding dot.
Most subjects created one reformulation in each tree;
however, since subjects from Prolific Academic do not always complete the whole set of utterances assigned to them, we recruit additional subjects to fill the trees that were left incomplete.
This leads the other, already complete trees to receive more reformulations than needed, making some of their branches run deeper than the target depth (as is the case for the trees shown here).
All branches are cropped to the target depth for analysis.
](images/gistr/gistr-trees.png){#fig:gistr-trees width=75%}

Technically, the platform is a complete Web application based on current technologies, with accompanying backend server to collect and distribute utterances.
^[The frontend first used the Ember.js framework [@ember.js_contributors_ember.js:_2017], and was later rewritten and extended using the Elm programming language [@czaplicki_elm:_2017].
The backend is a Python application written on top of the Django REST framework [@christie_django_2017].
Most of the critical logic in the software is verified using automated tests, and the full source code is available under a Free Software licence at \url{https://github.com/interpretation-experiment/gistr-app} (frontend), and \url{https://github.com/interpretation-experiment/spreadr} (backend).
]
The experiment is available at \url{https://gistr.io} and subject recruitment was done using Prolific Academic, a service analogous to Amazon Mechanical Turk and geared towards academic research.
^[The public url of the experiment was not advertised anywhere else, and checking the subjects' Prolific Academic ID confirmed that only people from that platform participated in each experiment.
]

Using the Prolific Academic service allowed us to select among a pool of over \num{26000} subjects, for which we used the following criteria:

* First language English speaker
* At least 18 years old
* Current country of residence and place of most time spent before turning 18 must both be the UK
* Normal or corrected to normal vision
* No diagnosed literary difficulties
* Completed secondary school
* Not having participated in any of the preceding experiments

Only the first two constraints were enforced for the first experiment, and the full set was used for all subsequent runs.
The full filter provided over \num{2300} eligible subjects, from which the service automatically sampled the number of subjects we requested.





















.
