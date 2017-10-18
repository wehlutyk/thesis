---
author: |
  Sébastien Lerique^[
    Centre d'Analyse et de Mathématique Sociales (CAMS, UMR 8557 EHESS-CNRS, Paris).
    Email: \hbox{\href{mailto:sebastien.lerique@normalesup.org}{sebastien.lerique@normalesup.org}}.
  ] \
  \hfill \
  Supervisor: Jean-Pierre Nadal^[
    Centre d’Analyse et de Mathématique Sociales (CAMS, UMR 8557 EHESS-CNRS, Paris), and Laboratoire de Physique Statistique (LPS, UMR 8550 CNRS-ENS-UPMC-Univ. Paris Diderot, Paris).
    Email: \hbox{\href{mailto:jpnadal@ehess.fr}{jpnadal@ehess.fr}}
  ] \
  Co-supervisor: Camille Roth^[
    Sciences Po, médialab (Paris), and Centre Marc Bloch e.V. (UMIFRE 14 CNRS-MAEE, Berlin).
    Email: \hbox{\href{mailto:camille.roth@sciencespo.fr}{camille.roth@sciencespo.fr}}
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
biblatexoptions:
  - style=authoryear-comp
  - uniquename=false
  - urldate=edtf
  - url=false
  - maxbibnames=20
  - giveninits=true
  - isbn=false
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
  - \usepackage[strict=true]{csquotes}
  - |
    \newbibmacro*{cite:labelyear+extrayear}{% adds the origyear to almost every cite command
    \iffieldundef{labelyear}
      {}
      {\printtext[bibhyperref]{%
        \iffieldundef{origyear}%<--- this is new ...
          {}%
          {\printfield{origyear}%
           \setunit{\addslash}}%<--- ... up until here
         \printfield{labelyear}%
         \printfield{extrayear}}}}
  - |
    \renewbibmacro*{date+extrayear}{% print the origyear in the bibliography as well
    \iffieldundef{labelyear}
      {}
      {\printtext[parens]{%
        \iffieldundef{origyear}%<--- this is new ...
          {}%
          {\printfield{origyear}%
           \setunit{\addslash}}%<--- ... up until here
          \printlabeldateextra}}}
  - |
    \AtEveryBibitem{
      \clearfield{note}%
    }
  - \renewbibmacro{in:}{\ifentrytype{article}{}{\printtext{\bibstring{in}\intitlepunct}}}
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
