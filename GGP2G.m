function mpceg=GGP2G()
%the interconnection of electricity and gas network by gas-fired
%generations
mpceg.Ebase=100; %��λ��MW
mpceg.GHV=50;  %����ĸ���ֵ���ڱ�׼״̬����0.0155MWh/Btu;  1.026MBtu/kcf
mpceg.fan=2;  %�������ת��Ч����3.4MBtu/MWh
%combined IEEE case39 and 20-node gas system 
mpceg.GFgen=[
 %number, gas-fired generations_bus_in_electricity_network, Pmax(MW), Pmin(MW), Pini,node in gas network, alpha, beta, gamma, cost
    1  32   700   0   80    12    0  3  0   6460
    2  33   700   0   80    6    0  3  0   6460
    3  35   700   0   80    20    0  3  0   6460
 ];%ת��Ч��0.85

mpceg.P2G=[ 
 %NUMBER, P2G node in gas network,   Gasini, yita, bus in electricity,  Pmax(MW),  Pmin, failure rate(failure/year),  MTTR(h),  ramp,  investment  458.4��Ԫ/MW,  operation cost  ��Ԫ/MWh
1	13	0.2	0.7	12	60	 0	0.002	72	5	458.4	6.2
2	19	0.2	0.7	17	60	 0	0.002	72	5	458.4	6.2
 ];
%gasini��λ��MMCFD

% mpceg.GFgen(:,[3,4]) = mpceg.GFgen(:,[3,4])/100;
% mpceg.P2G(:,[6,7]) = mpceg.P2G(:,[6,7])/100;

