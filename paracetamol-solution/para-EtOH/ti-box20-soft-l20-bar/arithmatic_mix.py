import numpy as np
import sys

# soften the LJ interaction between para and water
# ll=1: hard LJ; ll=0: no inter
ll = float(sys.argv[1])
para_type = [4, 5, 6, 9, 10, 12, 13, 14, 15]
water_type = [1, 2, 3, 7, 8, 11]

coeff_list = np.genfromtxt('pair_coeff.dat')
coeff_dict = {}
for c in coeff_list:
    coeff_dict[int(c[0])] = c[[1,2,4,5]] # epsilon, sigma

for ii,c_i in coeff_dict.items():
    #print(ii, c_i)
    for ii_2,c_i_2 in coeff_dict.items():
        if (ii_2 < ii): continue
        if (ii in para_type) and (ii_2 in water_type):
            cross = True
        elif (ii_2 in para_type) and (ii in water_type):
            cross = True
        else:
            cross = False

        epsilon = (c_i[0]*c_i_2[0])**0.5
        sigma = (c_i[1]+c_i_2[1])*0.5
        epsilon14 = (c_i[2]*c_i_2[2])**0.5
        sigma14 = (c_i[3]+c_i_2[3])*0.5

        if cross:
            print('pair_coeff', ii, ii_2, epsilon, sigma, ll, epsilon14, sigma14)
        else:    
            print('pair_coeff', ii, ii_2, epsilon, sigma, 1, epsilon14, sigma14)
