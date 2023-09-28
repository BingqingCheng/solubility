if [ -e dmu.dat ]; then
cat dmu.dat | awk 'BEGIN{sum=0.0; e=0.0;} {sum+=$5; e+=$6;}END{print sum,e}'
else
bash get-dmu-fep.sh > dmu.dat
cat dmu.dat | awk 'BEGIN{sum=0.0; e=0.0;} {sum+=$5; e+=$6;}END{print sum,e}'
fi
