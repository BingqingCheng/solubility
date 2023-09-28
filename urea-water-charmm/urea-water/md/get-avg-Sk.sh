#prefix=$1
for prefix in NN NO OO; do

for a in `seq 1 512`; do 
awk -v a=$a '!/#/{print $a}' Sk-${prefix}-real.dat | autocorr -maxlag 10 | head -n 1 | awk '{print $2,$3,$6}'; 
done > tmp

paste Sk-kgrid.dat tmp > Sk-${prefix}-real-avg.list
rm tmp

done
