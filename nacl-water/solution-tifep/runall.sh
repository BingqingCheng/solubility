for a in 0.0 0.0001 0.0002 0.0003 0.0005 0.0007 0.0008 0.001 0.0012 0.0015 0.0017 0.002 0.0025 0.003 0.0035 0.004 0.005 0.006 0.007 0.008 0.01 0.012 0.015 0.017 0.02 0.025 0.03 0.035 0.04 0.045 0.05 0.06 0.07 0.08 0.09 0.1 0.11 0.12 0.13 0.15 0.16 0.17 0.18 0.2 0.22 0.25 0.27 0.3 0.32 0.35 0.37 0.4 0.42 0.45 0.47 0.5 0.52 0.55 0.67 0.6 0.62 0.65 0.67 0.7 0.72 0.75 0.77 0.8 0.82 0.85 0.86 0.87 0.88 0.89 0.9 0.91 0.92 0.93 0.94 0.95 0.96 0.97 0.98 0.985 0.99 0.992 0.995 0.997 0.999 1.0; do
if [ ! -e l-$a ]; then
b=$(echo $a | awk '{print 1-$1}'); 
echo $a $b; 
mkdir l-$a
sed -e "s/WWWWW/$a/" -e "s/HHHHH/$b/" input.xml > l-$a/input.xml
sed -e "s/WWWWW/$a/"  inter.in > l-$a/inter.in
sed -e "s/HHHHH/$b/" nointer.in > l-$a/nointer.in
#sed -e "s/HHHHH/$b/" intra.in > l-$a/intra.in

cd l-$a
sbatch ../submit.sh
cd ..
fi
done
