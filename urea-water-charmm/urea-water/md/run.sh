for a in box30-10 box30-20 box30-40 box30-60 box30-80 box35-100 box35-120 box35-135; do mkdir $a-2x2x2; cp $a/input-config.dat $a-2x2x2; cp input-script-2x2x2.dat $a-2x2x2/input-script.dat; cd $a-2x2x2; sbatch ../single.run; cd ..; done

for a in box30-10 box30-20 box30-40 box30-60 box30-80 box35-100 box35-120 box35-135; do mkdir $a-3x3x3; cp $a/input-config.dat $a-3x3x3; cp input-script-3x3x3.dat $a-3x3x3/input-script.dat; cd $a-3x3x3; sbatch ../single.run; cd ..; done
