#!/bin/bash
#SBATCH --job-name=phame
#SBATCH --qos=bphl-umbrella
#SBATCH --account=bphl-umbrella
#SBATCH --output=phame.%j.out 
#SBATCH --error=phame.err
#SBATCH --ntasks=1                       
#SBATCH --cpus-per-task=10
#SBATCH --time=40:00:00                   
#SBATCH --mem=100gb                          
#SBATCH --mail-user=yi.huang@flhealth.gov
#SBATCH --mail-type=FAIL,END

module load phame
phame complete_phame.ctl
