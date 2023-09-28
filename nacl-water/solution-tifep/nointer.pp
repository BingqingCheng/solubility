# water is SPC/E here
set type 1 charge -0.0  # Cl
set type 2 charge  0.4238
set type 3 charge +0.0  # Na
set type 4 charge -0.8476

# Defining the pair style. In this case is a LJ with cutoff and Coulombic interaction is treated not
# with a cutoff but with PPPM
pair_style lj/cut/coul/long 10.0
kspace_style pppm 1.0e-5
#kspace_modify gewald 0.1

#pair_coeff 1 1 0.012785 4.830 # Cl
#pair_coeff 2 2 0.0000 1.00000 # H
#pair_coeff 3 3 0.3526418 2.160 # Na
#pair_coeff 4 4 0.1553 3.166 # O

pair_coeff 1 1 0.0 1.0 # Cl-Cl
pair_coeff 1 2 0.0 1.0 # Cl-H
pair_coeff 1 3 0.0 1.0  # Cl-Na
pair_coeff 1 4 0.0 1.0 # Cl-O
pair_coeff 2 2 0.0 1.0
pair_coeff 2 3 0.0 1.0 # H-Na
pair_coeff 2 4 0.0 1.0 # H-O
pair_coeff 3 3 0.0 1.0 # Na-Na
pair_coeff 3 4 0.0 1.0 # Na-O
pair_coeff 4 4 0.1553 3.166

# Defining the bond style and the angle style.
# After the definition, the coefficient are defined. The firs number refer to the index of the bonds
# (1-> first bond type ; 2->second bond type) and MUST match the .data file. Same for the angle.
# The first number is the force constant while the second is the equilibrium length.
bond_style harmonic
bond_coeff 1 1000.0 1.0
angle_style harmonic
angle_coeff 1 100.0 109.47

pair_modify tail yes
