#!/bin/bash
set -e

mkdir -p data
mkdir -p resources/gbif_backbone
mkdir -p resources/ncbi_taxonomy

wget --no-clobber https://hosted-datasets.gbif.org/datasets/backbone/2021-11-26/backbone.zip
wget --no-clobber https://ftp.ncbi.nlm.nih.gov/pub/taxonomy/taxdump_archive/new_taxdump_2022-12-01.zip
wget --no-clobber https://api.gbif.org/v1/occurrence/download/request/0097412-230224095556074.zip

unzip -d resources/gbif_backbone backbone.zip backbone/Taxon.tsv
mv resources/gbif_backbone/backbone/Taxon.tsv resources/gbif_backbone/Taxon.tsv 

unzip -d resources/ncbi_taxonomy new_taxdump_2022-12-01.zip

unzip -d data 0097412-230224095556074.zip
