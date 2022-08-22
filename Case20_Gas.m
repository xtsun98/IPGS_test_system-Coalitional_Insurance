function mpc=Case20_Gas()
%gasnode20    Power flow data for Belgian 20 natural gas node.  former unit
%%gas well data
%flow base
mpc.flowB=25/6;
mpc.gaswell=[
% %gasnode  maxoutput 10^6 m^3/day minoutput 10^6 m^3/day gasprice($/MBTU) initialoutput/MMCFD   state 
%    1 1    16   2  24.8   12       1
%    2 20	  30   4  20.8   19.997   1
%gasnode  maxoutput (Mm^3/h) minoutput Mm^3/h gasprice($/MWh)
1  0.48308  0.36958  0.28
2  0.35000  0        0.31
5  0.20000  0        0.30
8  0.91717  0.84767  0.32
13 0.05000  0        0.32
14 0.04000  0        0.32
15 0.2000  0        0.32
16 0.2000  0        0.32
20 0.2000  0        0.32
];
%%storage data
mpc.storage=[
%gasnode maxoutput 10^6 m^3/day minoutput 10^6 m^3/day  capacity
%gasprice($/MBTU)   initial output  maxinput   mininput   iniinput
%storing effciency   releasing effciency  initial storing gas  state  cost
   1 15   1.2   0   6   23.8    1.2    1.2   0   1.2    0.9   0.9    2   0  600
   2 16   8.4   0   42  24.8    3.9    8.4   0   3.0    0.9   0.9    5   0  4200
   3 9    4.8   0   24  24.8    4.4    4.8   0   4.0    0.9   0.9    8   0  2400
   4 4    0.96  0   4.8 23.8    0.96   0.96  0   0.96   0.9   0.9    2.4 0  480
];
%%node data
mpc.node=[
%Node	Demand Mm^3/h  max pressure/bar	min pressure/bar 	initial pressure  state	
    1	0           77   0    57.51
    2	0           77   0    57.37
    3	0.16325     80   30   56.77
    4	0           80   0    55.02
    5	0           77   0    56.54
    6	0.16808     80   30   54.37
    7	0.21900     80   30   54.27
    8	0           66.2 30   57.73
    9	0           66.2 0    57.73
    10	0.26521     66.2 30   55.97
    11	0           66.2 0    54.97
    12	0.08833     66.2 0    53.83
    13	0           66.2 0    53.10
    14	0           66.2 0    52.99
    15	0.28533     66.2 0    51.66
    16	0.65067     66.2 30   50.00
    17	0           66.2 0    54.06
    18	0           70   0    63.00
    19	0.00925     76.2 0    33.96
    20	0.07996     76.2 25   31.62
];
%%pipeline data
mpc.pipeline=[
% Pipelinenum	From node	To node	Cij(Mm3/Bar*d)  initial flow(Mm3/Bar*d)  cost(M$)  n0  nmax
1	1	2	3.0117   12      8   2   1
% 2	1	2	3.0117   12      8   2   1
3	2	3	2.4590   20.4    12  2   1
% 4	2	3	2.4590   20.4    12  2   1
5	3	4	1.1813   16.48   52  1   1
6	5	6	0.3166   4.80    86  1   2
7	7	6	0.3856   0.76    58  1   1
8	4	7	0.4763   0.76    58  1   1
9   4   14  0.8122   0.76    58  1   1
10  9   10  1.3468   19.04   40  2   1
% 11  9   10  0.1643   19.04   40  2   1
12  10  11  1.2047   12.68   50  2   1
% 13  10  11  0.147   19.04   40  2   1
14	11	12	0.9294   10.43   84  1   1
15	12	13	0.9524   8.31    80  1   1
16	13	14	2.6937   9.512   10  1   1
17	14	15	1.9048   22.464  20  1   1
18  15	16	1.2047   15.616  50  1   2
19  11	17	0.2268   2.141   21  1   1
20  18  19  0.0413   2.141   21  1   1
21  19  20  0.1688   2.141   21  1   1
% 
% 6	8	9	0.4763   -4.49   38  1   1
% 7	9	10	0.8122   11.92   200 1   1 
% 8	3	11	1.3468   19.04   40  2   1     
% 9	11	12	1.2047   12.68   50  2   1
% 10	16	4	0.9294   10.43   84  1   1
% 11	17	16	0.9524   8.31    80  1   1
% 12	18	17	2.6937   9.512   10  1   1
% 13	20	19	1.9048   22.464  20  1   1
% 14	4	13	1.2047   15.616  50  1   2
% 15	13	14	0.2268   2.141   21  1   1
% 16	14	15	0.4132   2.141   160 1   1
% 17	4	5	0.4132   2.141   160 1   1
];
%compressor data
mpc.compressor=[
%    Compressornum,	From node,	To node,	Initial ratio,	Max ratio,	Min ratio, Flow limit10^6(m3/h), initial flow
%     1	19	18	1 1.2	1	30   19.045
%     2	7	8	1 1.2	1	30   2.141
   1	8	9	1 1.2	1	2.521   2.141
   2	17	18	1 1.2	1	2.521   19.045
];    mpc.pipelineflowmax=2;