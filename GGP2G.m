function mpceg=GGP2G()
%the interconnection of electricity and gas network by gas-fired
%generations
mpceg.Ebase=100; %单位：MW
mpceg.GHV=50;  %甲烷的高热值在在标准状态下是0.0155MWh/Btu;  1.026MBtu/kcf
mpceg.fan=2;  %电的能量转化效率是3.4MBtu/MWh
%combined IEEE case39 and 20-node gas system 
mpceg.GFgen=[
 %number, gas-fired generations_bus_in_electricity_network, Pmax(MW), Pmin(MW), Pini,node in gas network, alpha, beta, gamma, cost
    1  32   700   0   80    12    0  3  0   6460
    2  33   700   0   80    6    0  3  0   6460
    3  35   700   0   80    20    0  3  0   6460
 ];%转换效率0.85

mpceg.P2G=[ 
 %NUMBER, P2G node in gas network,   Gasini, yita, bus in electricity,  Pmax(MW),  Pmin, failure rate(failure/year),  MTTR(h),  ramp,  investment  458.4万元/MW,  operation cost  万元/MWh
1	13	0.2	0.7	12	60	 0	0.002	72	5	458.4	6.2
2	19	0.2	0.7	17	60	 0	0.002	72	5	458.4	6.2
 ];
%gasini单位：MMCFD

% mpceg.GFgen(:,[3,4]) = mpceg.GFgen(:,[3,4])/100;
% mpceg.P2G(:,[6,7]) = mpceg.P2G(:,[6,7])/100;

