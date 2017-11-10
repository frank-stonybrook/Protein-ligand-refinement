#! /bin/bash
#$ -S /bin/bash
#$ -R yes
#$ -V
#$ -cwd
#$ -N charge_job_name
#$ -j y
##$ -t 1-30
##$ -l  highmem=1
#$ -q cpu_short
#$ -P kenprj

antechamber=/home/alberto/amber_git/amber/bin/antechamber
suffix="lig"
antechamber -i ${suffix}_ID.pdb -fi pdb -o ${suffix}_ID.mol2 -fo mol2  -c bcc -s 2 -nc net_charge
