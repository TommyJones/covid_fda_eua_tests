The purpose of this repository is to collect and store clinical testing data for SARS-CoV-2 diagnostic tests authorized by the FDA in a way that is consistent and machine readable.

The list of tests is available here: [https://www.fda.gov/medical-devices/emergency-situations-medical-devices/emergency-use-authorizations](https://www.fda.gov/medical-devices/emergency-situations-medical-devices/emergency-use-authorizations)

## Contributing to this project

If you want to contribute, you can! You have several options:

1. Open an issue
2. Send me a pull request
3. Email me at jones.thos.w@gmail.com
4. Tweet at me @thos_jones

This project could really benefit from the input of a medical professional that understands the biology and chemestry of these tests. It's one thing to pull out some reported numbers. It's entirely another to understand which numbers are relevant/irrelevant and put them in context.

## Data model(s)

The goal of this project is to take the information from the IFU PDF file for each diagnostic and enter it into a standard yaml format. These yaml files can be parsed and combined into a single machine-readable dataset.

`data_template.yaml` contains a template for entering clinical testing data. 

`fda_metadata_table.csv` is a manually-updated (and augmented) version of the table marked "Test Kit Manufacturers and Commercial Laboratories Table" available [here](https://www.fda.gov/medical-devices/emergency-situations-medical-devices/emergency-use-authorizations). 

One of the augmentations is the addition of an `id` field. This ID maps the metadata to the information for each test in the `individual_test_info/` directory. This directory is a repository of the origianl PDF document(s) for each diagnostic test. (Note as of this writing only the IFU doc has been downloaded, as it contains trial data. It is thus most importatnt.)

In some cases, the diagnostic test has more than one type documented. (See, for example, those marked "Serology IgM and IgG") in the "technology" field. In this case, fill in info for all techologies into two "trials" sections into the yaml.

