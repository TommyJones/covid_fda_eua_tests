# this script gets and/or updates ifu pdf files

# read in metadata table - note this table must be updated manually
dat <- readr::read_csv("fda_metadata_table.csv")

# download and store data sheets (IFU if relevant/available)
for (j in 1:nrow(dat)) {
  
  folder <- paste0("individual_test_info/", dat$id[j])
  
  if (! file.exists(folder))
    dir.create(folder)
  
  download.file(
    url = dat$ifu_url[j],
    destfile = paste0(folder, "/", dat$id[j], "_ifu.pdf")
  )
  
}

