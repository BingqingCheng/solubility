for a in box*; do cd $a; 
#if [ -e out.lammpstrj ]; then
#rm out.lammpstrj.tar.gz
sbatch ../analysis.run; 
#fi

cd ..; done
