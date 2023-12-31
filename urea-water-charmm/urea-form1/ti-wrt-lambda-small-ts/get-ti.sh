t=$1

for a in 0 0.00001 0.00002 0.00005 0.0001 0.0002 0.0003 0.0004 0.0005 0.0006 0.0008 0.001 0.0015 0.002 0.003 0.005 0.007 0.01 0.015 0.02 0.03 0.04 0.05 0.06 0.08 0.1 0.15 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.85 0.9 0.93 0.95 0.96 0.97 0.98 0.985 0.99 0.993 0.995 0.997 0.998 0.9985 0.999 0.9995 0.9998 0.9999 1; do
#for i in {0..10}; do
#a=$(echo "$i" | awk '{print 0.1*$1}')

if [ -e T-$t-l-$a/para.out ]; then

#A hartree is equal to 2625.5 kJ/mol, 627.5 kcal/mol
tail -n +100 T-$t-l-$a/para.out | awk '!/#/{print $6-$7}' | autocorr -maxlag 100 | head -n 1 | awk -v a=$a '{print a, 627.5*$2/128, 627.5*$6/128}';
fi
done
