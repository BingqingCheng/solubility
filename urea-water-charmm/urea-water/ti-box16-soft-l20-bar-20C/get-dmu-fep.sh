tt=293

for a in {0..19}; do

#echo "$a"
if [ -e l-$a/ti.out ]; then
# $6: l0   $7: l1  ($6+$7)/2: l
# 1 eV = 23.0609 kcal/mol
# 1kbT ~ 0.0258 eV

# FEP from W=0.5 to W=0
be=$(tail -n +1000 l-$a/ti.out | awk -v tt=$tt '{printf("%4.8e\n",exp(-($6-$7)/2./(tt*8.6*10**-5)))}' | autocorr -maxlag 10 | head -n 1 | awk -v tt=$tt -v a=$a '{print "step",a,"->", a+0.5, 23*(tt*8.6*10**-5)*log($2), 23*(tt*8.6*10**(-5))*$6/$2}')
#echo $be

# FEP from W=0.5 to W=1
fe=$(tail -n +1000 l-$a/ti.out | awk -v tt=$tt '{printf("%4.8e\n",exp(-($7-$6)/2./(tt*8.6*10**-5)))}' | autocorr -maxlag 10 | head -n 1 | awk -v tt=$tt -v a=$a '{print "step",a+0.5,"->", a+1, -23*(tt*8.6*10**-5)*log($2), 23*(tt*8.6*10**(-5))*$6/$2}')
#echo $fe

echo $be $fe | awk -v a=$a '{print "step",a,"->", a+1, $5+$11,$6+$12}'
fi
done
