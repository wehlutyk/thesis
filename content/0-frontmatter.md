---
title: |
  \large PhD Dissertation \
  \LARGE Epidemiology of Representations:\
  An Empirical Approach\
  \large ---original title may change---
author: |
  Sébastien Lerique^[
    Centre d'Analyse et de Mathématique Sociales (CAMS, UMR 8557, CNRS-EHESS, Paris).
    Email: \hbox{\href{mailto:sebastien.lerique@normalesup.org}{sebastien.lerique@normalesup.org}}.
  ] \
  \hfill \
  Advisor: Jean-Pierre Nadal^[
    CAMS, and Laboratoire de Physique Statistique (LPS, UMR 8550, CNRS-ENS-UPMC-Univ. Paris Diderot, Paris).
    Email: \hbox{\href{mailto:nadal@lps.ens.fr}{nadal@lps.ens.fr}}
  ] \
  Co-advisor: Camille Roth^[
    CAMS, Centre Marc Bloch (CMB, UMIFRE 14, CNRS-MAEE-HU, Berlin), and Sciences Po, médialab (Paris).
    Email: \hbox{\href{mailto:camille.roth@sciencespo.fr}{camille.roth@sciencespo.fr}}
  ]
documentclass: book
numbersections: True
lang: en-GB
geometry: margin=1.2in
mainfont: TeX Gyre Pagella
link-citations: True
colorlinks: True
toc: True
# Figure and Section reference formatting
cref: True
figPrefix:
  - "Fig."
  - "Figs."
secPrefix:
  - "Section"
  - "Sections"
# Additional headers
header-includes:
  # General comments
  - \usepackage[usenames,dvipsnames]{color}
  - \newcommand{\add}[1]{{\color{MidnightBlue}\#~ADD:} {\color{MidnightBlue}#1}}
  - \newcommand{\todo}[1]{{\color{BrickRed}\#~TODO:} {\color{BrickRed}#1}}
  - \newcommand{\change}[1]{{\color{RedViolet}CHANGE} {\color{RedViolet}[#1]}}
  - \newcommand{\opt}[1]{{\color{Gray}[#1]}}
  # Whenever citations are needed
  - \newcommand{\tb}[1]{\textcolor{blue}{#1}}
  - \newcommand{\cn}{\textsuperscript{\tb{[Citation needed]}}}
  - \newcommand{\cns}{\textsuperscript{\tb{[Multiple citations needed]}}}
  - \newcommand{\rn}{\textsuperscript{\tb{[Internal reference needed]}}}
  # Mathematics
  - \usepackage{bm}
  # Format numbers
  - \usepackage[group-separator={,}]{siunitx}
  # Scale svg figures
  - \usepackage{calc}
  # Brains Copy Paste images
  - \graphicspath{{images/brainscopypaste/}}
  # Brains Copy Paste start/arrival words
  - \newcommand{\warrival}{w'}
  - \newcommand{\wstart}{w}
---
