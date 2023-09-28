echo "# name N_para N_EtOH V[A^3] V_error[A^3] c_para[1/A^3] c_para_error"

for a in box35-*-2x2x2; do
#for a in box50-*-2x2x2-40C; do

if [ -e $a/lmplog ]; then
na=$(grep 'HAB' $a/input-config.dat | awk 'NF==9{print $NF}' | sed -e 's/-/ /' -e 's/HAB//' | awk '{print $1}' | tail -n 1 | awk '{print $1*8}')
nw=$(grep 'SV1' $a/input-config.dat | awk 'NF==9{print $NF}' | sed -e 's/-/ /' -e 's/SV1//' | awk '{print $1}' | tail -n 1 | awk '{print $1*8}')

tail -n +2000 $a/lmplog | awk 'NF==6{print $6}' | autocorr -maxlag 100 | head -n 1 | awk -v na=$na -v dd=$a -v nw=$nw '{print dd, na, nw, $2, $6, na/$2, na/($2-$6)-na/($2+$6)}'

fi

done
