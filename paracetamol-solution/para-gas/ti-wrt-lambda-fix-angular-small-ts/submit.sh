#!/bin/bash
#SBATCH --account CHENG-SL3-CPU
#SBATCH --partition cclake
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 12:00:00

#module purge
#module load rhel7/default-peta4

source ~/.bashrc

~/sources/i-pi-BC/bin/i-pi input.xml &> log-ipi &
sleep 10

srun --exclusive --ntasks 1 lmp_mpi_fep < input-script.dat &> log-lmp-1  &

wait


