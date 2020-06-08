
library(yaml)

library(tidyverse)

files_to_grab <- 
  list.files(
    "individual_test_info", 
    pattern = "yaml$", 
    recursive = TRUE,
    full.names = TRUE
  )

data <- lapply(
  files_to_grab, 
  function(x) {
    info <- read_lines(x)
    
    id <- 
      info[str_detect(info, "^id:")] %>%
      str_replace(
        "^id: (\\d+)($|.+$)",
        "\\1"
      )
    
    trials <- 
      str_detect(info, "type:") %>%
      which %>%
      lapply(
        function(x) {
          trial <- info[x:(x + 14)]
          
          type <- 
            trial[str_detect(trial, "type:")] %>%
            str_replace(
              "^.*type: (.+)$",
              "\\1"
            )
          
          tp <- 
            trial[str_detect(trial, "tp:")] %>%
            str_replace(
              "^.*tp: (.+)$",
              "\\1"
            )
          
          fp <- 
            trial[str_detect(trial, "fp:")] %>%
            str_replace(
              "^.*fp: (.+)$",
              "\\1"
            )
          
          tn <- 
            trial[str_detect(trial, "tn:")] %>%
            str_replace(
              "^.*tn: (.+)$",
              "\\1"
            )
          
          fn <- 
            trial[str_detect(trial, "fn:")] %>%
            str_replace(
              "^.*fn: (.+)$",
              "\\1"
            )
          
          notes <- 
            trial[str_detect(trial, "notes:")] %>%
            str_replace(
              "^.*notes:\\s*(.*)$",
              "\\1"
            )
          
          tibble(
            type = type,
            tp = as.numeric(tp),
            tn = as.numeric(tn),
            fp = as.numeric(fp),
            fn = as.numeric(fn)
          )
          
        })
    
    trials <- do.call(rbind, trials)
    
    trials$id <- id
    
    trials
  })

data <- do.call(rbind, data)

# keep only data for tests where we've filled out info
data <- 
  data %>% 
  filter(! is.na(data$tp)) %>%
  mutate(id = as.numeric(id))

# load metadata table
metadata <- 
  read_csv("fda_metadata_table.csv")

formatted_test_data <- 
  left_join(
    x = data,
    y = metadata,
    by = "id"
  )
