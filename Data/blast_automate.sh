#!/bin/bash
# Script to perform BLAST+ workflow

# Creat BLAST database
makeblastdb -in nucleotide_fasta_protein_homolog_model.fasta -dbtype nucl -out CARD_DB

# BLAST
for genome in GCA*.fna; do
  output="${genome%.fna}_blast_results.txt"
  blastn -query "$genome" -db CARD_DB -out "$output" -outfmt "6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore" -evalue 1e-30
done

# Concatenate all blast output files into a single file
cat *_blast_results.txt > combined_blast_results.txt

echo "All BLAST outputs have also been combined into 'combined_blast_results.txt'."