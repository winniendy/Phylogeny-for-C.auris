#!/bin/bash
#SBATCH --job-name=fastq_to_fasta_batch
#SBATCH --qos=bphl-umbrella
#SBATCH --account=bphl-umbrella
#SBATCH --output=fastq_to_fasta_%j.out 
#SBATCH --error=fastq_to_fasta.err
#SBATCH --ntasks=1                       
#SBATCH --cpus-per-task=10
#SBATCH --time=40:00:00                   
#SBATCH --mem=100gb                          
#SBATCH --mail-user=yi.huang@flhealth.gov
#SBATCH --mail-type=FAIL,END


module load fastx_toolkit/0.0.14

# Define input and output directories
input_dir="/blue/bphl-florida/yhwinnie/phylo/fasta_convert/input"  # Replace with your input directory path
output_dir="/blue/bphl-florida/yhwinnie/phylo/fasta_convert/output"  # Replace with your output directory path

# Create output directory if it doesn't exist
mkdir -p "$output_dir"

# Iterate over all .fastq files in the input directory
for fastq_file in "$input_dir"/*.fastq.gz; do
    # Get the base name of the file (without path and extension)
    base_name=$(basename "$fastq_file" .fastq.gz)
    # Define the output file path
    fasta_file="$output_dir/${base_name}.fasta"


    # Run the fastq_to_fasta command with decompression
    zcat "$fastq_file" | fastq_to_fasta -o "$fasta_file"

    # Check if the command was successful
    if [ $? -eq 0 ]; then
        echo "Successfully converted $fastq_file to $fasta_file"
    else
        echo "Error converting $fastq_file"
    fi
done
