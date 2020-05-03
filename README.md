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

### Overview
The goal of this project is to take the information from the IFU PDF file for each diagnostic and enter it into a standard yaml format. These yaml files can be parsed and combined into a single machine-readable dataset.

`data_template.yaml` contains a template for entering clinical testing data. 

`fda_metadata_table.csv` is a manually-updated (and augmented) version of the table marked "Test Kit Manufacturers and Commercial Laboratories Table" available [here](https://www.fda.gov/medical-devices/emergency-situations-medical-devices/emergency-use-authorizations). 

One of the augmentations is the addition of an `id` field. This ID maps the metadata to the information for each test in the `individual_test_info/` directory. This directory is a repository of the origianl PDF document(s) for each diagnostic test. (Note as of this writing only the IFU doc has been downloaded, as it contains trial data. It is thus most importatnt.)

In some cases, the diagnostic test has more than one type documented. (See, for example, those marked "Serology IgM and IgG") in the "technology" field. In this case, fill in info for all techologies into two "trials" sections into the yaml.

### Fields collected
For now, I'm collecting the following fields

 * `type:` - type of trial. e.g. "molecular" or "serology igm" or "serology igg"
 * `n_total:` - total number of patients in clinical trial
 * `n_pos:` - number of patients in clinical trial with sars-cov-2
 * `n_neg:` - number of patients in clinical trial without sars-cov-2
 * `tp:` - number of patients with sars-cov-2 that got a positive result
 * `fp:` - number of patients without sars-cov-2 that got a positive result
 * `tn`: - number of patiens without sars-cov-2 that got a negative result
 * `fn:` - number of patiens with sars-cov-2 that got a positive result
 * `reported_sensitivity_point:` - reported sensitivity or positive percent agreement point estimate
 * `reported_sensitivity_95ci_low:` - reported sensitivity low point of 95% CI
 * `reported_sensitivity_95ci_high:` - reported sensitivity high point of 95% CI
 * `reported_specificity_point:` - reported specificity or negative percent agreement point estimate
 * `reported_specificity_95ci_low:` - reported specificity low point of 95% CI
 * `reported_specificity_95ci_high:` - reported specificity high point of 95% CI
