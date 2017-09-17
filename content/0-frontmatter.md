---
title: |
  \large PhD Dissertation \
  \LARGE Epidemiology of Representations:\
  An Empirical Approach
author: |
  Sébastien Lerique^[
    Centre d'Analyse et de Mathématique Sociales (CAMS, UMR 8557, CNRS-EHESS, Paris).
    Email: \hbox{\href{mailto:sebastien.lerique@normalesup.org}{sebastien.lerique@normalesup.org}}.
  ] \
  \hfill \
  Supervisor: Jean-Pierre Nadal^[
    CAMS, and Laboratoire de Physique Statistique (LPS, UMR 8550, CNRS-ENS-UPMC-Univ. Paris Diderot, Paris).
    Email: \hbox{\href{mailto:jpnadal@ehess.fr}{jpnadal@ehess.fr}}
  ] \
  Co-supervisor: Camille Roth^[
    CAMS, Centre Marc Bloch (CMB, UMIFRE 14, CNRS-MAEE-HU, Berlin), and Sciences Po, médialab (Paris).
    Email: \hbox{\href{mailto:roth@ehess.fr}{roth@ehess.fr}}
  ]
documentclass: book
# Numbering comes from pandoc itself (not pandoc-crossref)
numbersections: True
secnumdepth: 2
lang: en-GB
geometry: a4paper
mainfont: TeX Gyre Pagella
link-citations: True
colorlinks: True
toc: True
# Figure and Section reference formatting. See header-includes for chapter ref formatting.
cref: True
figPrefix:
  - "Fig."
  - "Figs."
secPrefix:
  - "Section"
  - "Sections"
# We use Latex syntax for all the figures that have long captions, which makes it impossible to cite using pandoc-citeproc. So we cite what we need by hand, and add this here.
nocite: |
  @goodman_simultaneous_1965, @hofmann_letter-value_2011
# Additional headers
header-includes:
  # General comments
  - \usepackage[usenames,dvipsnames]{color}
  - \newcommand{\add}[1]{{\color{MidnightBlue}\#~ADD:} {\color{MidnightBlue}#1}}
  - \newcommand{\todo}[1]{{\color{RedViolet}\#~TODO:} {\color{RedViolet}#1}}
  - \newcommand{\change}[1]{{\color{RoyalPurple}CHANGE} {\color{RoyalPurple}[#1]}}
  - \newcommand{\opt}[1]{{\color{Gray}[#1]}}
  - \newcommand{\cam}[1]{{\color{BrickRed}\#~CAM:} {\color{BrickRed}#1}}
  # Citation inside Latex figure captions (see above the "nocite" field)
  - \newcommand{\goodman}{Goodman (1965)}
  - \newcommand{\hofmannP}{Hofmann, Kafadar, and Wickham 2011}
  - \newcommand{\froese}{Froese and Di Paolo (2011)}
  - \newcommand{\auvray}{Auvray, Lenay, and Stewart (2009)}
  - \newcommand{\jaegher}{De Jaegher, Di Paolo, and Gallagher (2010)}
  # Whenever citations are needed
  - \newcommand{\tb}[1]{\textcolor{blue}{#1}}
  - \newcommand{\cn}{\textsuperscript{\tb{[Citation needed]}}}
  - \newcommand{\cns}{\textsuperscript{\tb{[Multiple citations needed]}}}
  - \newcommand{\rn}{\textsuperscript{\tb{[Internal reference needed]}}}
  # Formatting in monospace, with verbatim spaces, but with colors
  - \usepackage{alltt}
  # Tables
  - \usepackage{booktabs}
  - \usepackage{multirow}
  # Numbered quotes
  - \setlength{\leftmargini}{3em}
  - \newsavebox\nquotebox
  - |
    \newenvironment{nquote}
      {\begin{equation}
       \begin{lrbox}{\nquotebox}
       \begin{minipage}{\dimexpr\columnwidth-2\leftmargini}
       \setlength{\leftmargini}{0pt}%
       \begin{quote}}
      {\end{quote}
       \end{minipage}
       \end{lrbox}\makebox[0pt]{\usebox{\nquotebox}}
       \end{equation}}
  # Mathematics
  - \usepackage{bm}
  - \usepackage{dsfont}
  - \usepackage[chapter]{algorithm}
  - \usepackage{algpseudocode}
  - \usepackage{xfrac}
  # Format numbers
  - \usepackage[group-separator={,},detect-all]{siunitx}
  # Format internal chapter references (pandoc-crossref ignores this for section and figure refs)
  - \PassOptionsToPackage{capitalise}{cleveref}
  # Scale svg figures
  - \usepackage{calc}
  # Images
  - \graphicspath{{images/brainscopypaste/}{images/gistr/}}
  - \usepackage{svg}
  # Brains Copy Paste start/arrival words
  - \newcommand{\warrival}{w'}
  - \newcommand{\wstart}{w}
---

\cleardoublepage
\phantomsection
\addcontentsline{toc}{chapter}{\listfigurename}
{\hypersetup{linkcolor=black}
 \listoffigures}
