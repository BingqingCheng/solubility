#!/bin/bash
#SBATCH --account T2-CS061-CPU #CHENG-SL4-CPU
#SBATCH --partition cclake
#SBATCH --nodes 1
#SBATCH --ntasks 56
#SBATCH --time 02:00:00

#module purge
#module load rhel7/default-peta4

source ~/.bashrc

i-pi input-ipi.xml &> log-ipi &
sleep 10

srun --exclusive --ntasks 56 lmp_mpi_fep < input-script.dat &> log-lmp-1  &

wait


