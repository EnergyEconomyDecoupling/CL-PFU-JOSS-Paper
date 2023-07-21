---
title: 'MR-PFU: A suite of R packages for energy conversion chain analysis'
tags:
- energy
- exergy
- R
- matrix mathematics
- energy efficiency
authors:
- name: Matthew Kuperus Heun
  orcid: 0000-0002-7438-214X
  affiliation: 1
- name: Zeke Marshall
  orcid: 0000-0001-9260-7827
  affiliation: 2
- name: Paul E. Brockway
  orcid: 0000-0001-6925-8040
  affiliation: 2
- name: Emmanuel Aramendia
  orcid: 0000-0002-5964-6776
  affiliation: 2
affiliations:
- name: Engineering Department, Calvin University
  index: 1
- name: School of Earth and Environment, Leeds University
  index: 2
date: "20 July 2023"
bibliography: paper.bib
output:
  html_document:
    keep_md: yes
---

Max length: 250--1000 words

# Summary

Energy flows through society enable economic activity and facilitate human flourishing.
To understand economic growth and human well-being, 
the field of energy analysis evaluates energy flows
from the primary stage 
(coal, oil, natural gas) 
to the final stage
(energy purchased by consumers, such as refined petroleum and electricity)
and ultimately to the useful stage
(heat, mechanical drive, and light),
the last energy before energy services
(transport, thermal comfort, and illumination).
Societal exergy analysis (SEA), an extension of energy analysis,
quantifies energy flows as exergy, 
the physical work potential of energy.

<!-- The forces on stars, galaxies, and dark matter under external gravitational -->
<!-- fields lead to the dynamical evolution of structures in the universe. The orbits -->
<!-- of these bodies are therefore key to understanding the formation, history, and -->
<!-- future state of galaxies. The field of "galactic dynamics," which aims to model -->
<!-- the gravitating components of galaxies to study their structure and evolution, -->
<!-- is now well-established, commonly taught, and frequently used in astronomy. -->
<!-- Aside from toy problems and demonstrations, the majority of problems require -->
<!-- efficient numerical tools, many of which require the same base code (e.g., for -->
<!-- performing numerical orbit integration). -->


# Statement of need

Historically, SEA has analyzed energy flows through specific countries
using spreadsheets, 
with data in varying and inconsistent formats 
[@Ayres:2003ec; @Serrenho:2014aa; @Brockway:2014aa; @Brockway:2015aa].
Scientists in the field wanted to expand to cover all countries, but
the spreadsheet approach to data analysis would not scale.
We developed a series of `R` packages to enable 
analyses for all countries, as described in the following table.






`Gala` is an Astropy-affiliated Python package for galactic dynamics. Python
enables wrapping low-level languages (e.g., C) for speed without losing
flexibility or ease-of-use in the user-interface. The API for `Gala` was
designed to provide a class-based and user-friendly interface to fast (C or
Cython-optimized) implementations of common operations such as gravitational
potential and force evaluation, orbit integration, dynamical transformations,
and chaos indicators for nonlinear dynamics. `Gala` also relies heavily on and
interfaces well with the implementations of physical units and astronomical
coordinate systems in the `Astropy` package [@astropy] (`astropy.units` and
`astropy.coordinates`).

`Gala` was designed to be used by both astronomical researchers and by
students in courses on gravitational dynamics or astronomy. It has already been
used in a number of scientific publications [@Pearson:2017] and has also been
used in graduate courses on Galactic dynamics to, e.g., provide interactive
visualizations of textbook material [@Binney:2008]. The combination of speed,
design, and support for Astropy functionality in `Gala` will enable exciting
scientific explorations of forthcoming data releases from the *Gaia* mission
[@gaia] by students and experts alike.

# Example usage


```r
library(Recca)
```

# Mathematics

Single dollars ($) are required for inline mathematics e.g. $f(x) = e^{\pi/x}$

Double dollars make self-standing equations:

$$\Theta(x) = \left\{\begin{array}{l}
0\textrm{ if } x < 0\cr
1\textrm{ else}
\end{array}\right.$$

You can also use plain \LaTeX for equations
\begin{equation}\label{eq:fourier}
\hat{f}(\omega) = \int_{-\infty}^{\infty} f(x) e^{i\omega x} dx
\end{equation}
and refer to \autoref{eq:fourier} from text.

# Citations

Citations to entries in paper.bib should be in
[rMarkdown](http://rmarkdown.rstudio.com/authoring_bibliographies_and_citations.html)
format.

If you want to cite a software repository URL (e.g. something on GitHub without a preferred
citation) then you can do it with the example BibTeX entry below for @fidgit.

For a quick reference, the following citation commands can be used:
- `@author:2001`  ->  "Author et al. (2001)"
- `[@author:2001]` -> "(Author et al., 2001)"
- `[@author1:2001; @author2:2001]` -> "(Author1 et al., 2001; Author2 et al., 2002)"

# Figures

Figures can be included like this:

![Caption for example figure.\label{fig:example}](figure.png)
and referenced from text using \autoref{fig:example}.

Figure sizes can be customized by adding an optional second parameter:

![Caption for example figure.](figure.png){ width=20% }

# Acknowledgements

We acknowledge contributions from Brigitta Sipocz, Syrtis Major, and Semyeong
Oh, and support from Kathryn Johnston during the genesis of this project.

# References
