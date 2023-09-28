bond_style harmonic
angle_style harmonic
dihedral_style multi/harmonic
special_bonds lj 0.0 0.0 0.5 coul 0.0 0.0 0.8333

pair_style lj/cut/coul/long 9.0 9.0


pair_modify tail yes
kspace_style pppm 1e-5

pair_modify mix arithmetic

