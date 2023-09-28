for a in 5 10 25 35 60 {25..700..25}; do
#for a in 5 10 25 35 60; do
tail -n +10000 gas-${a}K/lmplog | awk 'NF==6{print $4}' | autocorr -maxlag 100 | head -n 1 | awk -v a=$a '{print a,$2,$6}'
done
