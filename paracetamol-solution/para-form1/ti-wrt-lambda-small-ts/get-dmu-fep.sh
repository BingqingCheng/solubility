tt=$1

for f in 0.8 0.85 0.9 0.95 0.97 0.98 0.99 0.995 0.998 0.999 0.9995; do
if [ -e T-$tt-l-1/para.out ]; then
# $6: charmm   $7: debye
# 1 eV = 23.0609 kcal/mol

# FEP from W=a to W=0
tail -n +200 T-$tt-l-1/para.out | awk -v tt=$tt -v ff=$f '{printf("%4.8e\n",exp(-(1.-ff)*($7-($6+1.67827700e+01))/(tt*3.167*10**-6)))}' | autocorr -maxlag 10 | head -n 1 | awk -v tt=$tt -v ff=$f '{print ff,23*(tt*8.6*10**-5)*log($2)/108, 23*(tt*8.6*10**(-5))*$6/$2/108}'

fi

done
