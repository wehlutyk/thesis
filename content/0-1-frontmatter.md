---
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
biblio-style: apa
biblio-title: References
# Figure and Section reference formatting. See header-includes for chapter ref formatting.
cref: True
figPrefix:
  - "Fig."
  - "Figs."
secPrefix:
  - "Section"
  - "Sections"
# Additional headers
header-includes:
  # Output in PDF/A-1b
  - \usepackage[a-1b]{pdfx}
  # Biblatex style
  - \usepackage{csquotes}
  - \DeclareLanguageMapping{english}{english-apa}
  # General comments
  - \usepackage[usenames,dvipsnames]{xcolor}
  - \newcommand{\add}[1]{{\color{MidnightBlue}\#~ADD:} {\color{MidnightBlue}#1}}
  - \newcommand{\todo}[1]{{\color{RedViolet}\#~TODO:} {\color{RedViolet}#1}}
  - \newcommand{\change}[1]{{\color{RoyalPurple}CHANGE} {\color{RoyalPurple}[#1]}}
  - \newcommand{\opt}[1]{{\color{Gray}[#1]}}
  - \newcommand{\cam}[1]{{\color{BrickRed}\#~CAM:} {\color{BrickRed}#1}}
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
  - \graphicspath{{images/brainscopypaste/}{images/gistr/}{images/misc/}}
  - \usepackage{svg}
  # Brains Copy Paste start/arrival words
  - \newcommand{\warrival}{w'}
  - \newcommand{\wstart}{w}
---
