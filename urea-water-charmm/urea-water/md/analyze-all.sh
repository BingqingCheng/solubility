for a in box*; do cd $a; sbatch ../analysis.run; cd ..; done
