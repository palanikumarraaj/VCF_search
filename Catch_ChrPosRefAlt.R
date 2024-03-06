library(dplyr)
# Step 1: Collecting input files
tsv_files <- list.files(pattern = "\\.tsv$")
args <- commandArgs(trailingOnly = TRUE) # accept input file and output file name from the user
vcf_rawdata <- args[1] # push input file i.e. virulence excel sheet
input_csv <- read.csv(vcf_rawdata, header = TRUE)
input_csv[, tsv_files] <- NA
##working
# Step 2: Count matching patterns
for (tsv_file in tsv_files) {
  tsv_data <- read.delim(tsv_file, sep = "\t", header = TRUE)
  for (i in 1:nrow(input_csv)) {
    row <- input_csv[i, ]
    match_index <- which(
      tsv_data$CHR == row$CHR &
        tsv_data$POS == row$POS &
        tsv_data$REF == row$REF &
        tsv_data$ALT == row$ALT
    )
    input_csv[i, tsv_file] <- ifelse(length(match_index) > 0, 1, 0)
  }
  
  rm(tsv_data) # Remove TSV data to save memory
}
# Step 3: Write output CSV
samplename <- gsub(".csv", "", vcf_rawdata)
write.csv(input_csv, paste0(samplename,"_ChrPosRefAltCount.csv"), row.names=FALSE)
