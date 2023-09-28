dir=$1

for a in box*; do 

mkdir $dir/$a

cp $a/Sk*list $a/input-config.dat $dir/$a

done
