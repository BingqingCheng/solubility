#!/bin/bash
#SBATCH --account CHENG-SL4-CPU #T2-CS061-CPU #CHENG-SL3-CPU
#SBATCH --partition cclake
#SBATCH --nodes 1
#SBATCH --ntasks 16
#SBATCH --time 12:00:00

#module purge
#module load rhel7/default-peta4

source ~/.bashrc


rr=$RANDOM
sed -i "s/RRRRR/${rr}/" input.xml
sed -i "s/RRRRR/${rr}/" inter.in
sed -i "s/RRRRR/${rr}/" nointer.in

i-pi input.xml &> log-ipi &
sleep 10

srun --exclusive --ntasks 8 lmp_mpi < inter.in &> log-lmp-1  &
#sleep 10

srun --exclusive --ntasks 8 lmp_mpi < nointer.in &> log-lmp-2  &

wait


