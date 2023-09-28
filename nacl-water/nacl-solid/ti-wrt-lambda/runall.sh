t=$1

for a in 0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0; do
#for a in 0 0.001 0.005 0.01 0.02 0.05 0.1 0.15 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.85 0.9 0.95 0.97 0.98 0.99 0.003 0.995 0.998 0.999 0.9995 1; do
b=$(echo "$a" | awk '{print 1-$b}')

if [ ! -e T-$t-l-$a ]; then
mkdir T-$t-l-$a
echo $a $b

sed -e "s/AW/$a/" -e "s/HW/$b/" -e "s/TTTTT/$t/" input.xml > T-$t-l-$a/input.xml
sed -e "s/AW/$a/" -e "s/HW/$b/" -e "s/TTTTT/$t/" input-script.dat > T-$t-l-$a/input-script.dat

cd T-$t-l-$a
sbatch ../submit.sh
cd ..
fi
done
