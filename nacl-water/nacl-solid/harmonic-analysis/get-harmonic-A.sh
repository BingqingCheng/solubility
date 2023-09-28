myTemp=$1

# q_vib = k_B T / (hbar omega), with omega = sqrt(eigenvalue). In the iPi output, this is in atomic units, i.e. 1 atomic unit of angular frequency is 1wau = 1/(time), where time=hbar/hartree. Then we need hbar omega / (k_B * temperature) = 315775.025*kelvin/temperature * omega*  (where omega* is the dimensionless omega in atomic units)
tail -n +5 i-pi.phonons.eigval | awk -v myTemp=$myTemp '{sum+=log(sqrt($1)/(myTemp/315775.025))} END {printf "A_harm[kcal/mol]: %.4f\n", myTemp*0.001987204259*sum}'
