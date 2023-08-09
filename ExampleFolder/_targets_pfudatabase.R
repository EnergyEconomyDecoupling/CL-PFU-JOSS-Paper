# Available on CRAN

# Available from EnergyEconomyDecoupling on GitHub
# with devtools::install_github("EnergyEconomyDecoupling/xxxxxx")
library(PFUDatabase)
library(PFUSetup)

# Create the pfu_setup object for file paths.
# Setting home_path and cloud_storage_path to "" (empty string)
# gives relative paths.
pfu_setup <- PFUSetup::get_abs_paths(
  home_path = "", 
  cloud_storage_path = "",
  project_path = "ExampleFolder", 
  iea_data_path = file.path("ExampleFolder",
                            "IEA extended energy balance data",
                            "GHA-ZAF-TJ-Extended-Energy-Balances-sample-2022.csv"),
  version = "v_example")

# Custom parameters
years <- c(1971, 2000)      # The years to be analyzed

countries <- c("GHA", "ZAF")


# Additional exemplar countries are countries which aren't included in the workflow
# as individual countries, but from which allocation or efficiency data may be 
# obtained and assigned to countries in the workflow using the exemplar system.
additional_exemplar_countries <- c("AFRI", # Africa 
                                   "ASIA", # Asia
                                   "EURP", # Europe 
                                   "MIDE", # Middle East
                                   "NAMR", # North America
                                   "OCEN", # Oceania 
                                   "SAMR", # South America 
                                   "BUNK") # Bunkers

# Which type of matrix objects should be created?
# "matrix" is the built-in matrix object in R.
# "Matrix" will provide sparse matrices.
matrix_class <- "Matrix"

# Should we specify non-energy flows?
specify_non_energy_flows <- TRUE

# Should we apply fixes to the IEA data?
apply_fixes <- TRUE

# Should we do a release of the results?
release <- FALSE

# End user-adjustable parameters.

# WRLD should not be in both countries and additional_exemplar_countries
if (("WRLD" %in% countries) & ("WRLD" %in% additional_exemplar_countries)) {
  # Remove WRLD from additional_exemplar_countries
  additional_exemplar_countries <- additional_exemplar_countries[!(additional_exemplar_countries == "WRLD")]
}

# WRLD should always be in countries or in additional_exemplar_countries.
if (!("WRLD" %in% countries) & !("WRLD" %in% additional_exemplar_countries)) {
  # Add WRLD to additional_exemplar_countries
  additional_exemplar_countries <- c("WRLD", additional_exemplar_countries)
}

# Set up for multithreaded work on the local machine.
future::plan(future.callr::callr)

# Set options for all targets.
targets::tar_option_set(
  storage = "worker", 
  retrieval = "worker"
)

# Pull in the pipeline
PFUDatabase::get_pipeline(countries = countries,
                          additional_exemplar_countries = additional_exemplar_countries,
                          matrix_class = matrix_class,
                          specify_non_energy_flows = specify_non_energy_flows,
                          apply_fixes = apply_fixes,
                          years = years,
                          how_far = "all_targets",
                          iea_data_path = pfu_setup[["iea_data_path"]],
                          country_concordance_path = pfu_setup[["country_concordance_path"]],
                          mw_concordance_path = pfu_setup[["mw_concordance_path"]],
                          amw_analysis_data_path = pfu_setup[["amw_analysis_data_path"]],
                          hmw_analysis_data_path = pfu_setup[["hmw_analysis_data_path"]],
                          phi_constants_path = pfu_setup[["phi_constants_path"]],
                          # Temperature data not required for V1, argument set to NULL.
                          ceda_data_folder = NULL,
                          fao_data_path = pfu_setup[["fao_data_path"]],
                          ilo_data_path = pfu_setup[["ilo_data_path"]],
                          machine_data_path = pfu_setup[["machine_data_folder"]],
                          exemplar_table_path = pfu_setup[["exemplar_table_path"]],
                          fu_analysis_folder = pfu_setup[["fu_analysis_folder"]],
                          reports_source_folders = pfu_setup[["reports_source_folders"]],
                          reports_dest_folder = pfu_setup[["reports_dest_folder"]],
                          pipeline_releases_folder = pfu_setup[["pipeline_releases_folder"]],
                          pipeline_caches_folder = pfu_setup[["pipeline_caches_folder"]],
                          release = release)

