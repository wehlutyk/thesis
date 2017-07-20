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
Since no existing system would fit our needs, we chose to develop a reusable Web-based platform to run a series of studies that would allow us, once ready, to gather sufficient amounts of high-quality data in short cycles.

HERE

The platform is a complete Web application with accompanying backend server built using current technologies,
^[TODO: details: Elm, DRF, tests, free software on github, etc.
]
which can be used to run small- to large-scale transmission chains in short periods of time.
