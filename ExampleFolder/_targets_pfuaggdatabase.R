library(targets)

# Use the PFUSetup package to establish paths for the example
# Create the pfu_setup object used in the targets scripts 
# _targets_pfudatabase.R and _targets_pfuaggdatabase.R.
pfu_setup <- PFUSetup::get_abs_paths(home_path = "", cloud_storage_path = "",
                                     project_path = "ExampleFolder",
                                     version = "v_example", 
                                     iea_year = "2022")



# Custom parameters
countries <- c("GHA", "ZAF")
years <- c(1971, 2000)  

# Tells whether to do the R and Y chops.
do_chops <- FALSE

# Set the release to be used for input.
psut_release <- "20230811T122618Z-3b7b3"

# Should we release the results?
release <- FALSE


# End user-adjustable parameters.


# Set up for multithreaded work on the local machine.
future::plan(future.callr::callr)

# Set options for all targets.
targets::tar_option_set(
  packages = "PFUAggDatabase",
  # Indicate that storage and retrieval of subtargets
  # should be done by the worker thread,
  # not the main thread.
  # These options set defaults for all targets.
  # Individual targets can override.
  storage = "worker",
  retrieval = "worker"
)

# Pull in the pipeline
PFUAggDatabase::get_pipeline(countries = countries,
                             years = years,
                             do_chops = do_chops,
                             psut_release = psut_release,
                             aggregation_maps_path = pfu_setup[["aggregation_mapping_path"]],
                             pipeline_releases_folder = pfu_setup[["pipeline_releases_folder"]],
                             pipeline_caches_folder = pfu_setup[["pipeline_caches_folder"]],
                             release = release)




