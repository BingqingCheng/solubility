#!/bin/bash
#SBATCH --account CHENG-SL4-CPU
#SBATCH --partition cclake
#SBATCH --nodes 1
#SBATCH --ntasks 16
#SBATCH --time 12:00:00

#module purge
#module load rhel7/default-peta4

source ~/.bashrc

~/sources/i-pi/bin/i-pi input.xml &> log-ipi &
sleep 500

srun --exclusive --ntasks 16 lmp_mpi_fep < input-script.dat &> log-lmp-1  &

wait


