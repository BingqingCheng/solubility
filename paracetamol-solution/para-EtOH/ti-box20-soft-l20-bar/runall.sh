for a in {0..19}; do
#for a in 0 10; do
if [ ! -e l-$a ]; then
mkdir l-$a
b=$(echo "$a+1" | bc)
echo $a $b

cp input.xml l-$a/input.xml
sed -e "s/LLLLL/$a/" inter0.in > l-$a/inter0.in
sed -e "s/MMMMM/$b/" inter1.in > l-$a/inter1.in

cd l-$a
sbatch ../submit.sh
cd ..
fi
done
