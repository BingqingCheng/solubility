#for a in {25..500..25}; do 
#for a in 600 650 700 800 900 1000 1200 1400 1600 1800 2000; do 
for a in 5 10 15 20 25 30 35 40 50 60; do
if [ ! -e I-${a}K ]; then
mkdir I-${a}K; sed "s/TTTTT/$a/g" input-script.dat > I-${a}K/input-script.dat; cd I-${a}K; sbatch ../single.run; cd ..; 
fi
done
