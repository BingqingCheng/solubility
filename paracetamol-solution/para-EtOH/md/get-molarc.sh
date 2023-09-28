TT=$1

echo "# name N_para N_water V[A^3] V_error[A^3] c_para[1/A^3] c_para_error"

for a in box*-*x*x*-$TT; do
mm=$( echo $a | sed "s/-/ /g" | awk '{print $(NF-1)}' | sed "s/x/\*/g" | bc)


na=$(grep 'HAB' $a/input-config.dat | awk 'NF==9{print $NF}' | sed -e 's/-/ /' -e 's/HAB//' | awk '{print $1}' | tail -n 1 | awk -v mm=$mm '{print $1*mm}')
nw=$(grep 'SV1' $a/input-config.dat | awk 'NF==9{print $NF}' | sed -e 's/-/ /' -e 's/SV1//' | awk '{print $1}' | tail -n 1 | awk -v mm=$mm '{print $1*mm}')


tail -n +2000 $a/lmplog | awk 'NF==6{print $6}' | autocorr -maxlag 100 | head -n 1 | awk -v na=$na -v dd=$a -v nw=$nw '{print dd, na, nw, $2, $6, na/$2, na/($2-$6)-na/($2+$6)}'

done
