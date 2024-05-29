This script is using in HiperGator HPG. 

Output files */*.mapped.bam from Pensacola are required.
PhaMe installation is required: https://phame.readthedocs.io/en/stable/install/conda.html
Or modile load phame in HPG.

SLURM is required.
 
conda create -n phylo -c conda-forge python=3.10 pandas
conda activate conda
conda config --add channels bioconda
conda config --add channels conda-forge
conda install -c bioconda samtools
