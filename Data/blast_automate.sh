#!/bin/bash
# Script to perform BLAST+ workflow

makeblastdb -in nucleotide_fasta_protein_homolog_model.fasta -dbtype nucl -out CARD_DB

for genome in GCA*.fna; do
  output="${genome%.fna}_blast_results.txt"
  blastn -query "$genome" -db CARD_DB -out "$output" -outfmt "6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore" -evalue 1e-30
done
