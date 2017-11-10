#!/bin/bash
### set the number of processing elements (PEs) or cores
### set the number of PEs per node
#PBS -l nodes=1:ppn=1:xk
### set the wallclock time (will run at least minwclimit and max walltime
#PBS -l minwclimit=40:00:00 -l walltime=47:00:00
### If we set the job preemptee it may be killed. If the job is preemptee
### you get both bonus... let's see if we get killed often with preeemptee 
###PBS -l flags=preemptee
### set the job name
###PBS -N CL_2IDX 
### set the job stdout and stderr
#PBS -e $PBS_JOBID.err
#PBS -o $PBS_JOBID.out
#PBS -q normal
### set email notification
##PBS -M username@host
### In case of multiple allocations, select which one to charge
##PBS -A xyz

#cd in the dir you are when you submit the job 
cd $PBS_O_WORKDIR
pmemd=/mnt/b/projects/sciteam/baml/Source/amber_git/amber/bin/pmemd.cuda
suffix="lig"
### Step 1 Minimize
aprun -n 1 $pmemd -O -i 01mi.in -o 01mi.out -p ${suffix}_<ID>.prmtop -c ${suffix}_<ID>.inpcrd  -ref ${suffix}_<ID>.inpcrd  -x  01mi.trj -inf 01mi.info -r 01mi.rst7
### Step 2 MD Equilibration
aprun -n 1 $pmemd -O -i 02md.in -o 02md.out -p ${suffix}_<ID>.prmtop -c 01mi.rst7  -ref 01mi.rst7  -x  02md.trj -inf 02md.info -r 02md.rst7
### Step 3 Minimize
aprun -n 1 $pmemd -O -i 03mi.in -o 03mi.out -p ${suffix}_<ID>.prmtop -c 02md.rst7  -ref 02md.rst7  -x  03mi.trj -inf 03mi.info -r 03mi.rst7
### Step 4 Minimize
aprun -n 1 $pmemd -O -i 04mi.in -o 04mi.out -p ${suffix}_<ID>.prmtop -c 03mi.rst7  -ref 03mi.rst7  -x  04mi.trj -inf 04mi.info -r 04mi.rst7
### Step 5 Minimize
aprun -n 1 $pmemd -O -i 05mi.in -o 05mi.out -p ${suffix}_<ID>.prmtop -c 04mi.rst7  -ref 04mi.rst7  -x  05mi.trj -inf 05mi.info -r 05mi.rst7
### Step 6 MD Equilibration
aprun -n 1 $pmemd -O -i 06md.in -o 06md.out -p ${suffix}_<ID>.prmtop -c 05mi.rst7  -ref 05mi.rst7  -x  06md.trj -inf 06md.info -r 06md.rst7
### Step 7 MD Equilibration
### Step 8 MD Equilibration
aprun -n 1 $pmemd -O -i 08md.in -o 08md.out -p ${suffix}_<ID>.prmtop -c 06md.rst7  -ref 05mi.rst7  -x  08md.trj -inf 08md.info -r 08md.rst7
### Step 9 MD Equilibration
### Step 10 MD Equilibration
aprun -n 1 $pmemd -O -i 10md.in -o 10md.out -p ${suffix}_<ID>.prmtop -c 08md.rst7  -ref 05mi.rst7  -x  10md.trj -inf 10md.info -r 10md.rst7
