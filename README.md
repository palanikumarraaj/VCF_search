# VCF searcher
## Script to search Chr-Pos or Chr-Pos_Ref-ALT or rsID in VCF files

3 scripts are available with minor modifications to catch the required data in input files

- R based script with similar input file format
- VCF is converted into TSV file format with the given command below

## VCF to TSV 

- Convert your VCF files to TSV files before using the Rscript 


Collect all your VCFs in a location for ease application of scripts

> for f in *.vcf ; do cat $f | grep -v "##" | sed 's/#//g' > $f".tsv" ; done


The above is a simple for loop command used in linux terminals for keeping only required columns

## Rscript variations

3 scripts were provided, each with different set of input query format required:

- chrPos_Count.R

> This script will check for Chr Pos columns in TSV files and count it for creating the output .csv file 

- Catch_ChrPosRefAlt.R

> This script will check for Chr-Pos and its respective Ref and Alt columns in TSV files and count it for creating the output .csv file 


- Catch_ID-counter.R

> This script will check for ID column in TSV files and count it for creating the output .csv file

## Usage

These 3 variants of scripts required input as TSV files and query .csv file format with same headers as VCF file.

- For example: CHROM	POS	ID	REF	ALT  are the available column options for query .csv file format
- Based on the Rscript variant you can use only the required columns in the input .csv file

```sh
Rscript Catch_ID-counter.R rsID-list.csv
```

## I/O formats

2 inputs are required for using the script

1. TSV files converted from VCF file as mentioned above.
2. Input .csv file any of the columns as CHROM POS ID REF ALT based on usage of script

1 output as .csv common usage format
