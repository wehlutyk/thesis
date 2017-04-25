---
title: My PhD
documentclass: book
numbersections: True
lang: en-GB
geometry: margin=1.2in
mainfont: TeX Gyre Pagella
link-citations: True
colorlinks: True
toc: True
# Figure formatting
cref: True
figPrefix:
  - "Fig."
  - "Figs."
# Additional headers
header-includes:
  # General comments
  - \usepackage[usenames,dvipsnames]{color}
  - \newcommand{\add}[1]{{\color{MidnightBlue}\#~ADD:} {\color{MidnightBlue}#1}}
  - \newcommand{\todo}[1]{{\color{BrickRed}\#~TODO:} {\color{BrickRed}#1}}
  - \newcommand{\change}[1]{{\color{RedViolet}CHANGE} {\color{RedViolet}[#1]}}
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
