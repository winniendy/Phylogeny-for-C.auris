#!/bin/bash
#SBATCH --job-name=bam_to_fasta_batch
#SBATCH --qos=bphl-umbrella
#SBATCH --account=bphl-umbrella
#SBATCH --output=bam_to_fasta.%j.out 
#SBATCH --error=fastq_to_fasta.err
#SBATCH --ntasks=1                       
#SBATCH --cpus-per-task=10
#SBATCH --time=40:00:00                   
#SBATCH --mem=100gb                          
#SBATCH --mail-user=yi.huang@flhealth.gov
#SBATCH --mail-type=FAIL,END

# Define input and output files
input_dir="/blue/bphl-florida/yhwinnie/phylo/fasta_convert/input"  # Replace with your input BAM file path
output_dir="/blue/bphl-florida/yhwinnie/phylo/fasta_convert/output"  # Replace with your output FASTA file path

# Create output directory if it doesn't exist
mkdir -p "$output_dir"

# Iterate over all BAM files in the input directory
for bam_file in "$input_dir"/*.bam; do
    # Extract the filename without extension
    filename=$(basename "$bam_file" .bam)
    # Define the output FASTA file path
    output_fasta="$output_dir/${filename}.fasta"

    # Extract mapped sequences in BAM to FASTA
    samtools fasta "$bam_file" > "$output_fasta" 
    
    echo "Conversion complete: $bam_file -> $output_fasta"
done
