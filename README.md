
<!-- *********** -->
<!-- Note: README.md is generated from README.Rmd.   -->
<!-- Be sure to edit README.Rmd and generate the README.md file by Cmd/Ctl-shift-K -->
<!-- *********** -->
<!-- Define some macros for later use -->

## JOSS paper

This repository contains a paper submitted to the [Journal of Open
Source Software (JOSS)](https://joss.theoj.org) covering the suite of
`R` packages associated with the CL-PFU database[^1].

## CL-PFU database

We created a suite of `R` packages to support the creation and use of
the CL-PFU database. The CL-PFU database is a new resouce for the
Societal Exergy Analysis (SEA) research community and assists SEA
practitioners to analyze energy conversion chains (ECCs). The new
packages enable, for the first time, scalable SEA.

## `R` packages

The `R` packages covered by this paper include three packages that
support the PSUT framework of [Heun et al.
(2018)](https://doi.org/10.1016/j.apenergy.2018.05.109). These packages
are generally useful and available on
[CRAN](https://cran.r-project.org).

| Package                                                 | Purpose                                                                                                               |
|:--------------------------------------------------------|:----------------------------------------------------------------------------------------------------------------------|
| [RCLabels](https://github.com/MatthewHeun/RCLabels)     | Manipulates matrix row and column names in [matsindf](https://github.com/MatthewHeun/matsindf) data frames            |
| [matsbyname](https://github.com/MatthewHeun/matsbyname) | Performs matrix mathematics that respects row and column names                                                        |
| [matsindf](https://github.com/MatthewHeun/matsindf)     | Stores matrices in cells of data frames, thereby enabling analyses with [tidyverse](https://www.tidyverse.org) syntax |

Several additional packages support the creation of the CL-PFU database.
The packages in the following table are available on GitHub.

| Package                                                                         | Purpose                                                                                                                                                                                                       |
|:--------------------------------------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [IEATools](https://github.com/MatthewHeun/IEATools)                             | Converts [IEA EWEB](https://www.iea.org/data-and-statistics/data-product/world-energy-balances) data to RUVY matrices in [matsindf](https://github.com/MatthewHeun/matsindf) data frames                      |
| [MWTools](https://github.com/EnergyEconomyDecoupling/MWTools)                   | Converts [ILO](https://www.ilo.org/) and [FAO](https://www.fao.org/) data to RUVY matrices of human and animal muscle work in [matsindf](https://github.com/MatthewHeun/matsindf) data frames                 |
| [Recca](https://github.com/MatthewHeun/Recca)                                   | Performs `R` energy conversion chain analysis                                                                                                                                                                 |
| [PFUSetup](https://github.com/EnergyEconomyDecoupling/PFUSetup)                 | Identifies input and output locations for the [PFUDatabase](https://github.com/EnergyEconomyDecoupling/PFUDatabase) and [PFUAggDatabase](https://github.com/EnergyEconomyDecoupling/PFUAggDatabase) pipelines |
| [PFUPipelineTools](https://github.com/EnergyEconomyDecoupling/PFUPipelineTools) | Provides basic functionality for all PFU pipelines                                                                                                                                                            |
| [PFUDatabase](https://github.com/EnergyEconomyDecoupling/PFUDatabase)           | Provides a [targets](https://docs.ropensci.org/targets) pipeline to create a data frame of RUVY matrices                                                                                                      |
| [PFUAggDatabase](https://github.com/EnergyEconomyDecoupling/PFUAggDatabase)     | Provides a [targets](https://docs.ropensci.org/targets) pipeline to aggregate RUVY matrices                                                                                                                   |

## References

<div id="refs" class="references csl-bib-body hanging-indent">

<div id="ref-Heun:2018" class="csl-entry">

Heun, Matthew Kuperus, Anne Owen, and Paul E. Brockway. 2018. “A
Physical Supply-Use Table Framework for Energy Analysis on the Energy
Conversion Chain.” *Applied Energy* 226 (September): 1134–62.
<https://doi.org/10.1016/j.apenergy.2018.05.109>.

</div>

</div>

[^1]: “CL-PFU” is an initialism for “Country-Level Primary, Final, and
    Useful.” The CL-PFU database contains many countries as well as
    continental and world aggregations. Technically speaking, we create
    [matsindf](https://github.com/MatthewHeun/matsindf) data frames
    stored as [pins](https://pins.rstudio.com) on a pinboard, not SQL or
    similar databases.
