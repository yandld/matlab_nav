clear;
clc;
close all;

A = [
             -1.3077,   -0.2050,    1.0347,    1.4384,   -0.0301,    1.5326,    0.0859,   -1.4023,    0.6966,    0.1873,
             -0.4336,   -0.1241,    0.7269,    0.3252,   -0.1649,   -0.7697,   -1.4916,   -1.4224,    0.8351,   -0.0825,
              0.3426,    1.4897,   -0.3034,   -0.7549,    0.6277,    0.3714,   -0.7423,    0.4882,   -0.2437,   -1.9330,
              3.5784,    1.4090,    0.2939,    1.3703,    1.0933,   -0.2256,   -1.0616,   -0.1774,    0.2157,   -0.4390,
              2.7694,    1.4172,   -0.7873,   -1.7115,    1.1093,    1.1174,    2.3505,   -0.1961,   -1.1658,   -1.7947,
             -1.3499,    0.6715,    0.8884,   -0.1022,   -0.8637,   -1.0891,   -0.6156,    1.4193,   -1.1480,    0.8404,
              3.0349,   -1.2075,   -1.1471,   -0.2414,    0.0774,    0.0326,    0.7481,    0.2916,    0.1049,   -0.8880,
              0.7254,    0.7172,   -1.0689,    0.3192,   -1.2141,    0.5525,   -0.1924,    0.1978,    0.7223,    0.1001,
             -0.0631,    1.6302,   -0.8095,    0.3129,   -1.1135,    1.1006,    0.8886,    1.5877,    2.5855,   -0.5445,
              0.7147,    0.4889,   -2.9443,   -0.8649,   -0.0068,    1.5442,   -0.7648,   -0.8045,   -0.6669,    0.3035,    
];


B = [
             -0.6003,    0.1240,   -0.2725,    0.0335,   -0.9792,   -0.1332,    0.3075,    0.4517,    1.0391,    0.8261,
              0.4900,    1.4367,    1.0984,   -1.3337,   -1.1564,   -0.7145,   -1.2571,   -0.1303,   -1.1176,    1.5270,
              0.7394,   -1.9609,   -0.2779,    1.1275,   -0.5336,    1.3514,   -0.8655,    0.1837,    1.2607,    0.4669,
              1.7119,   -0.1977,    0.7015,    0.3502,   -2.0026,   -0.2248,   -0.1765,   -0.4762,    0.6601,   -0.2097,
             -0.1941,   -1.2078,   -2.0518,   -0.2991,    0.9642,   -0.5890,    0.7914,    0.8620,   -0.0679,    0.6252,
             -2.1384,    2.9080,   -0.3538,    0.0229,    0.5201,   -0.2938,   -1.3320,   -1.3617,   -0.1952,    0.1832,
             -0.8396,    0.8252,   -0.8236,   -0.2620,   -0.0200,   -0.8479,   -2.3299,    0.4550,   -0.2176,   -1.0298,
              1.3546,    1.3790,   -1.5771,   -1.7502,   -0.0348,   -1.1201,   -1.4491,   -0.8487,   -0.3031,    0.9492,
             -1.0722,   -1.0582,    0.5080,   -0.2857,   -0.7982,    2.5260,    0.3335,   -0.3349,    0.0230,    0.3071,
              0.9610,   -0.4686,    0.2820,   -0.8314,    1.0187,    1.6555,    0.3914,    0.5528,    0.0513,    0.1352,
];


C = [
              0.5152,   -1.1742,   -0.4446,   -0.3206,   -1.5651,   -0.2365,   -1.6702,   -0.9444,    0.2398,   -0.0708,
              0.2614,   -0.1922,   -0.1559,    0.0125,   -0.0845,    2.0237,    0.4716,   -1.3218,   -0.6904,   -2.4863,
             -0.9415,   -0.2741,    0.2761,   -3.0292,    1.6039,   -2.2584,   -1.2128,    0.9248,   -0.6516,    0.5812,
             -0.1623,    1.5301,   -0.2612,   -0.4570,    0.0983,    2.2294,    0.0662,    0.0000,    1.1921,   -2.1924,
             -0.1461,   -0.2490,    0.4434,    1.2424,    0.0414,    0.3376,    0.6524,   -0.0549,   -1.6118,   -2.3193,
             -0.5320,   -1.0642,    0.3919,   -1.0667,   -0.7342,    1.0001,    0.3271,    0.9111,   -0.0245,    0.0799,
              1.6821,    1.6035,   -1.2507,    0.9337,   -0.0308,   -1.6642,    1.0826,    0.5946,   -1.9488,   -0.9485,
             -0.8757,    1.2347,   -0.9480,    0.3503,    0.2323,   -0.5900,    1.0061,    0.3502,    1.0205,    0.4115,
             -0.4838,   -0.2296,   -0.7411,   -0.0290,    0.4264,   -0.2781,   -0.6509,    1.2503,    0.8617,    0.6770,
             -0.7120,   -1.5062,   -0.5078,    0.1825,   -0.3728,    0.4227,    0.2571,    0.9298,    0.0012,    0.8577,
];

alpha = -0.3;
beta = 0.5;


for i=1:10
C  = alpha*A'*B' + beta*C';
C = C';
alpha = alpha + 0.1;
 beta = beta - 0.1;
end
C
