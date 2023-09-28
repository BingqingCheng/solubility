tt=$1

#if [ -e dmu.dat ]; then
#cat dmu.dat | awk 'BEGIN{sum=0.0; e=0.0;} {sum+=$2; e+=$3;}END{print sum,e}'
#else
bash get-ti.sh $tt > dmu.dat
cat dmu.dat
cat dmu.dat | awk 'BEGIN{sum=0.0; e=0.0; xold=0.0; yold=0.0; eold=0.0;} {sum+=0.5*($2+yold)*($1-xold); e+=0.5*($3+eold)*($1-xold); xold=$1; yold=$2; eold=$3;}END{print "# dmu[kcal/mol]:",sum,e}'
#cat dmu.dat | awk 'BEGIN{sum=0.0; e=0.0; xold=0.0; yold=0.0; eold=0.0;} {sum+=0.5*($2+yold-2.*-97.511)*($1-xold); e+=0.5*($3+eold)*($1-xold); xold=$1; yold=$2; eold=$3; print xold,"dmu[kcal/mol]:",sum,e}'

#fi
