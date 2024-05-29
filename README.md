This script is using in HiperGator HPG. 

Output files */*.mapped.bam from Pensacola are required.


PhaMe installation is required: https://phame.readthedocs.io/en/stable/install/conda.html;

Or module load phame in HPG.


SLURM is needed. For HiPerGator users, its installation is not needed.

Python3 is needed. The package "pandas" should be installed by pip3 install pandas if not included in your python3.
 
conda create -n phylo -c conda-forge python=3.10 pandas;

conda activate cond;

conda config --add channels bioconda;

conda config --add channels conda-forge;

conda install -c bioconda samtools

After convert mapped.bam to .fasta, input all the fasta files in the workdirs for PhaMe, input the reference genome and gff files in ref_dir.

Adjust control file;

phame complete_phame.ctl
