#for a in {25..700..25}; do 
#for a in 600 650 700 800 900 1000 1200 1400 1600 1800 2000; do 
for a in 5 10 25 35 60; do
if [ ! -e gas-${a}K ]; then
mkdir gas-${a}K; sed "s/TTTTT/$a/g" input-script.dat > gas-${a}K/input-script.dat; cd gas-${a}K; sbatch ../single.run; cd ..; 
fi
done
