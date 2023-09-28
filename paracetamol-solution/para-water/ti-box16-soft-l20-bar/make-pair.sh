for a in {0..20}; do ll=$(echo $a | awk '{print $1*0.05}') ; python arithmatic_mix.py $ll > pair-$a.pp; done
