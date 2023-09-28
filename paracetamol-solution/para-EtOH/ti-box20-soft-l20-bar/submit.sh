#!/bin/bash
#SBATCH --account CHENG-SL4-CPU
#SBATCH --partition cclake
#SBATCH --nodes 1
#SBATCH --ntasks 8
#SBATCH --time 12:00:00

#module purge
#module load rhel7/default-peta4

source ~/.bashrc

#rm /tmp/ipi_*
#sed -i "s/localhost/${HOSTNAME}/" input.xml
#sed -i "s/localhost/${HOSTNAME}/" mof*in

rr=$RANDOM
sed -i "s/RRRRR/${rr}/" input.xml
sed -i "s/RRRRR/${rr}/" inter*.in

i-pi input.xml &> log-ipi &
sleep 10

srun --exclusive --ntasks 4 lmp_mpi_fep < inter0.in &> log-lmp-1  &
#sleep 10

srun --exclusive --ntasks 4 lmp_mpi_fep < inter1.in &> log-lmp-2  &

wait


