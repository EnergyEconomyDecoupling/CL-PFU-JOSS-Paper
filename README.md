
<!-- *********** -->
<!-- Note: README.md is generated from README.Rmd.   -->
<!-- Be sure to edit README.Rmd and generate the README.md file by Cmd/Ctl-shift-K -->
<!-- *********** -->
<!-- Define some macros for later use -->

## JOSS paper

This repository contains a paper submitted to the [Journal of Open
Source Software (JOSS)](https://joss.theoj.org) covering the suite of
`R` packages associated with the CL-PFU[^1] database.

## Statement of need

Historically, Societal Exergy Analysis (SEA) practitioners have analyzed
the ECCs of individual countries using linked spreadsheets, often
starting with primary- and final-stage data from the [International
Energy Agency](https://www.iea.org)’s (IEA’s) [extended world energy
balances](https://www.iea.org/data-and-statistics/data-product/world-energy-balances)
(EWEBs) (Ayres, Ayres, and Warr 2003; Serrenho et al. 2014; Brockway et
al. 2014, 2015). Data were stored in varying and inconsistent formats.
An early SEA database (De Stercke 2014) estimated energy efficiencies of
end-use machines using the economic status of countries, thereby
precluding use in energy-economy studies.

The authors of the current paper and others in the field wanted to
expand SEA to cover all countries, but the spreadsheet approach to SEA
was deemed not scalable. A new approach to SEA was needed, one that
scaled across all countries for many years without relying on economic
data to estimate machine efficiencies.

## CL-PFU database

We created a suite of `R` packages and the metapackage `CLPFUDatabase`
to support the creation and use of the CL-PFU database. The CL-PFU
database is a new resouce for the SEA research community and assists SEA
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

<div id="ref-Ayres:2003ec" class="csl-entry">

Ayres, Robert U., Leslie W. Ayres, and Benjamin Warr. 2003. “Exergy,
Power, and Work in the US Economy, 1900–1998.” *Energy* 28 (3): 219–73.
<https://doi.org/10.1016/s0360-5442(02)00089-0>.

</div>

<div id="ref-Brockway:2014aa" class="csl-entry">

Brockway, Paul E., John R. Barrett, Timothy J. Foxon, and Julia K.
Steinberger. 2014. “Divergence of Trends in US and UK Aggregate Exergy
Efficiencies 1960–2010.” *Environmental Science & Technology* 48:
9874–81. <https://doi.org/10.1021/es501217t>.

</div>

<div id="ref-Brockway:2015aa" class="csl-entry">

Brockway, Paul E., Julia K. Steinberger, John R. Barrett, and Timothy J.
Foxon. 2015. “Understanding China’s Past and Future Energy Demand: An
Exergy Efficiency and Decomposition Analysis.” *Applied Energy* 155:
892–903. <https://doi.org/10.1016/j.apenergy.2015.05.082>.

</div>

<div id="ref-De-Stercke:2014" class="csl-entry">

De Stercke, Simon. 2014. “Dynamics of Energy Systems: A Useful
Perspective.” Interim Report IR-14-013. Laxenburg, Austria: IIASA.

</div>

<div id="ref-Heun:2018" class="csl-entry">

Heun, Matthew Kuperus, Anne Owen, and Paul E. Brockway. 2018. “A
Physical Supply-Use Table Framework for Energy Analysis on the Energy
Conversion Chain.” *Applied Energy* 226 (September): 1134–62.
<https://doi.org/10.1016/j.apenergy.2018.05.109>.

</div>

<div id="ref-Serrenho:2014aa" class="csl-entry">

Serrenho, André Cabrera, Tânia Sousa, Benjamin Warr, Robert U. Ayres,
and Tiago Domingos. 2014. “Decomposition of Useful Work Intensity: The
EU (European Union)-15 Countries from 1960 to 2009.” *Energy* 76
(November): 704–15. <https://doi.org/10.1016/j.energy.2014.08.068>.

</div>

</div>

[^1]: “CL-PFU” is an initialism for “Country-Level Primary, Final, and
    Useful.” The CL-PFU database contains many countries as well as
    continental and world aggregations. Technically speaking, we create
    [matsindf](https://github.com/MatthewHeun/matsindf) data frames
    stored as [pins](https://pins.rstudio.com) on a pinboard, not SQL or
    similar databases.
