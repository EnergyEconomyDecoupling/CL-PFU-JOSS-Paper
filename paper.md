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

Energy flows through societal energy conversion chains (ECCs)
to enable economic activity and facilitate human flourishing.
To understand economic growth and human well-being, 
the field of energy analysis evaluates ECCs
from the primary stage 
(coal, oil, natural gas) 
to the final stage
(energy purchased by consumers, such as refined petroleum and electricity),
to the useful stage
(heat, mechanical drive, and light),
and sometimes to energy services
(transport, thermal comfort, and illumination).
Societal exergy analysis (SEA), an extension of energy analysis,
quantifies ECCs as exergy, 
the mechanical work potential of energy.


# Statement of need

Historically, societal exergy analysts have
analyzed the ECCs of individual countries
using a large number of linked spreadsheets,
starting with primary and final stage data from the [IEA](https://www.iea.org/data-and-statistics/data-product/world-energy-balances)'s
world energy balances
[@Ayres:2003ec; @Serrenho:2014aa; @Brockway:2014aa; @Brockway:2015aa]. 
Data were in varying and inconsistent formats.
The authors of this paper and others in the field
wanted to expand SEA to cover all countries, but
the spreadsheet approach to data analysis was
deemed not scalable.
We created a suite of `R` packages to create a database^[Strictly speaking, we create data frames of matrices, 
not a structured database.]
of PFU data (the PFU Database)
for all countries in the world from 1960--2020.
The packages enable, for the first time, scalable SEA.
This paper describes the design of those packages and
demonstrates briefly their use.


# Design of `R` packages

The most important decision for the design of SEA packages
involves data format.
We selected the Physical Supply-Use Table (PSUT) framework,
a matrix approach to describing energy flows from 
resource extraction to
processing stages and, ultimately, 
to final demand [@Rocco:2016; @Guevara:2017; @Heun:2018].
The PSUT framework succinctly describes the flow of energy carriers
("products" in PSUT terminology) 
among energy conversion machines 
("industries" in PSUT terminology)
with a set of six matrices as described in the following table.

| Matrix      | rows x columns     | Name                           | Description                                              |
|:------------|:-------------------|:-------------------------------|:---------------------------------------------------------|
| **R**       | industry x product | Resource matrix                | Contains exogeneous energy inputs to an ECC              |
| **U**       | product x industry | Use matrix                     | Describes how each energy conversion device uses energy; the sum of **U_feed** and **U_EIOU** |
| **U_feed**  | product x industry | Feedstock use matrix           | Describes feedstock inputs to energy conversion devices  |
| **U_EIOU**  | product x industry | Energy industry own use matrix | Describes how the energy industry uses energy            |
| **V**       | industry x product | Make matrix                    | Describes how each energy conversion device makes energy |
| **Y**       | product x industry | Final demand matrix            | Describes how each energy carrier is consumed            |

Further development followed from selection of the PSUT data format.
First, the matrix-based PSUT framework brought the challenge that 
different countries and years 
have varying energy energy carriers (products) and
varying energy conversion machines (industries),
meaning that PSUT matrices for different countries and years 
have differing sizes and differing row and column names.
To get around this challenge, we created the
([matsbyname](https://github.com/MatthewHeun/matsbyname/)) 
package which enables matrix mathematics 
that respects matrix row and column names, 
inserting rows or columns of `0`s when needed.
Second,
we knew it would be convenient to perform _matrix_ mathematics 
as easily as _scalar_ mathematics
in `R` data frames
using the [tidyverse](https://www.tidyverse.org) syntax. 
We developed the [matsindf](https://matthewheun.github.io/matsindf/) package 
to enable this functionality.
Finally, manipulating row and column names proved to be a challenge, 
especially for matrices in PSUT data frames, so 
we developed the [RCLabels](https://matthewheun.github.io/RCLabels/) package
for that purpose.
The table below summarizes these packages, 
all of which are generally useful and available on 
[CRAN](https://cran.r-project.org).

| Package | Function |
|:--------|:---------|
| [RCLabels](https://github.com/MatthewHeun/RCLabels/)      | Manipulates row and column names in [matsindf](https://github.com/MatthewHeun/matsindf/) data frames |
| [matsbyname](https://github.com/MatthewHeun/matsbyname/)  | Performs matrix mathematics that respects row and column names |
| [matsindf](https://github.com/MatthewHeun/matsindf/)      | Stores matrices in cells of a data frame, thereby enabling [tidyverse](https://www.tidyverse.org) syntax |


Several calculation steps are required to create the PFU database. 
Each step is assisted by an `R` package that we created.
First, the IEA's primary- and final-stage WEEB data must be converted
to the PSUT format, 
a task completed by the [IEATools](https://github.com/MatthewHeun/IEATools/) package. 
Second, human and animal muscle work must be calculated from 
labor and FAO data following the methodology of @Steenwyk:2022ww
using the [MWTools](https://github.com/EnergyEconomyDecoupling/MWTools) package. 
Third, the IEA's primary- and final-stage ECC data 
are extended to the useful stage by
(a) allocating final stage energy to end-use machines and
(b) multiplying allocated final energy by the 
final-to-useful efficiency of each machine.
This task is accomplished by the
[PFUDatabase](https://github.com/energyeconomydecoupling/PFUDatabase/) 
and 
[Recca](https://github.com/MatthewHeun/Recca) 
packages.
Finally, ECCs must be converted from energy terms to exergy terms. 
This step is assisted by the [Recca](https://github.com/MatthewHeun/Recca) package.
The steps to create the PSUT matrices for each country and each year
are accomplished by a
[targets](https://docs.ropensci.org/targets/)
computation pipeline
available in the [PFUDatabase](https://github.com/energyeconomydecoupling/PFUDatabase/)
package.
These packages are specific to creating the PFU database 
and are summarized in the table below. 

| Package | Function |
|:--------|:---------|
| [IEATools](https://github.com/MatthewHeun/IEATools/) | Converts IEA data to [matsindf](https://github.com/MatthewHeun/matsindf/) format |
| [MWTools](https://github.com/energyeconomydecoupling/MWTools) | Converts ILO and FAO data to human and animal muscle work information in [matsindf](https://github.com/MatthewHeun/matsindf/) format |
| [Recca](https://matthewheun.github.io/Recca/)       | Performs `R` energy conversion chain analysis |
| [PFUDatabase](https://energyeconomydecoupling.github.io/PFUDatabase/) | A [targets](https://docs.ropensci.org/targets/) pipeline to create a data frame of PSUT matrices |
| [PFUAggDatabase](https://energyeconomydecoupling.github.io/PFUAggDatabase/) | A [targets](https://docs.ropensci.org/targets/) pipeline to aggregate PSUT matrices |















Reference for data repository [@Marshall:2023aa].















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


# Example


```r
library(Recca)
```


# Conclusion







# Acknowledgements








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
