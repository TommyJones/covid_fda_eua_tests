# source: https://www.finddx.org/covid-19/dx-data/

# read in and format the find_dx data

library(tidyverse)

library(janitor)

# format data
format_data <- function(path) {
  readxl::read_xlsx(path) %>%
    clean_names() %>%
    lapply(function(x) {
      x[x == "Not available"] <- NA
      x
    }) %>%
    as_tibble()
}

antibody <- format_data("find_dx_data/COVIDDxData (antibody).xlsx")

antigen <- format_data("find_dx_data/COVIDDxData (antigen).xlsx")

molecular <- format_data("find_dx_data/COVIDDxData (molecular).xlsx")






