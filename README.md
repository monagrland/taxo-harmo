Curation of vascular plant species list for reference database
==============================================================

Case study to illustrate linking of taxonomic identifiers and incorporation of
Wikidata into workflow

Aim: Build reference database of barcode marker sequences for vascular plants
from Germany by matching checklist to NCBI taxonIDs.

We use a checklist dataset from the Bundesamt für Naturschutz published on
GBIF. This appears to be based on a BfN publication (Buttler, May, Metzing,
2018).

Challenges:
 * Species occurrence checklist is published on GBIF, which uses a different
   taxonomy than NCBI, where sequences are published, so the IDs have to be
   mapped to each other
 * Mapping of GBIF to NCBI taxonIDs is not generally available; partially
   crowdsourced on Wikidata but some errors have been observed
 * Matching canonical names (binomials) is error-prone because of homonyms,
   orthographic differences, different accepted synonyms

To ameliorate errors we perform name matching with
[`gndiff`](https://github.com/gnames/gndiff), a specialized tool for comparing
scientific names that accounts for common issues; in addition to canonical
names we also compare authorities, and retrieve Wikidata records corresponding
to the GBIF taxonIDs. Unambiguous exact matches (name, authority, and Wikidata
all agree) are automatically approved, whereas remaining name matches are
sorted and manually curated to screen out spurious matches.

Errors in the source databases are also noted: errors in GBIF are reported in
their web interface, while Wikidata can be edited directly.

File organization:

```
.
├── compare-names.ipynb     # Notebook with curation steps
├── data                    # Input dataset (git ignored)
├── env                     # Conda environments (git ignored)
├── environment.yml         # Conda environment definition file
├── name-match              # Intermediate working files (git ignored)
├── README.md               # This Readme file
├── resources               # Source databases (git ignored)
└── results                 # Results files for manual curation
```


Versions of databases used:
 * GBIF Backbone Taxonomy: 
   https://hosted-datasets.gbif.org/datasets/backbone/2021-11-26/backbone.zip
   (the 2022-11-23 version was only publicly released on 2023-03-29)
 * NCBI Taxonomy:
   "https://ftp.ncbi.nlm.nih.gov/pub/taxonomy/taxdump_archive/new_taxdump_2022-12-01.zip"


Citations
---------

Bundesamt für Naturschutz / Netzwerk Phytodiversität Deutschland. Flora von
Deutschland (Phanerogamen). Occurrence dataset https://doi.org/10.15468/0fxsox
accessed via GBIF.org on 2023-03-16. 
 * GBIF.org (16 March 2023) GBIF Occurrence Download https://doi.org/10.15468/dl.gv8n69 
 * GBIF dataset e6fab7b3-c733-40b9-8df3-2a03e49532c1
 * Exported as "species list" format to file `0097412-230224095556074.zip`, unzip to folder `data/`

Buttler, Karl P., Rudolf May, and Detlev Metzing. Liste der Gefäßpflanzen
Deutschlands. DE: Bundesamt für Naturschutz, 2018.
 * Source (human-readable PDF): https://doi.org/10.19217/skr519
 * Spreadsheet with corrections: https://www.floraweb.de/download/checkliste/skript519.zip
 * FloraWeb homepage: https://www.floraweb.de/downloads.html

