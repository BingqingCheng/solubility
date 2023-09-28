TT=$1

echo "# name N_para N_water V[A^3] V_error[A^3] c_para[1/A^3] c_para_error"

for a in box*-*x*x*-$TT; do
#for a in box50-*-2x2x2-40C; do
ttype=$(echo $a | sed "s/-/ /g" | awk '{print NF}')
mm=$( echo $a | sed "s/-/ /g" | awk '{print $(NF-1)}' | sed "s/x/\*/g" | bc)

if [ $ttype == "4" ]; then

na=$(grep 'HAA' $a/input-config.dat | awk 'NF==9{print $NF}' | sed -e 's/-/ /' -e 's/HAA//' | awk '{print $1}' | tail -n 1 | awk -v mm=$mm '{print $1*mm}')
nw=$(grep 'SOLV' $a/input-config.dat | awk 'NF==9{print $NF}' | sed -e 's/-/ /' -e 's/SOLV//' | awk '{print $1}' | tail -n 1 | awk -v mm=$mm '{print $1*mm}')

elif [ $ttype == "5" ]; then

na=$(echo $a | sed "s/-/ /g" | awk -v mm=$mm '{print $2*mm}')
nw=$(echo $a | sed "s/-/ /g" | awk -v mm=$mm '{print $3*mm}')

fi

tail -n +2000 $a/lmplog | awk 'NF==6{print $6}' | autocorr -maxlag 100 | head -n 1 | awk -v na=$na -v dd=$a -v nw=$nw '{print dd, na, nw, $2, $6, na/$2, na/($2-$6)-na/($2+$6)}'

done
