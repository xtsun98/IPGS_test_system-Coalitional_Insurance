function PGaim  = objE_and_G(PLoadcut,GLoadinit,GLoadcut,nodenum,f_GG,fGG,f_P2G,fP2G)
%OBJE 此处显示有关此函数的摘要
%   此处显示详细说明
    %目标函数
%     global Load_num PLoadinit RoGG RoP2G lamdaGG lamdaP2G ss
    %临时调试----------------dfGG换掉
%     gLoadcut1=0;
%     for i = 1:nodenum
%         gLoadcut1 = gLoadcut1 + GLoadinit(i)-GLoad(i);
%     end
%     gLoadcut = gLoadcut1;
    
    PGaim=sum(PLoadcut)+sum(GLoadcut)*5000;
   
     %%------------------------
%     pLoadcut=pLoadcut+(lamdaGG(ss-1,1))'*(f_GG-fGG(ss-1,1))+0.5*RoGG*norm((f_GG-fGG(ss-1,1))).^2+...
%         +(lamdaP2G(ss-1,1))'*(f_P2G-fP2G(ss-1,1))+0.5*RoP2G*norm((f_P2G-fP2G(ss-1,1))).^2;
      %Z注意lamda是n阶n*1向量，fgg为n*1向量sum(abs(20-dfP2G(:,ss)*1000*36/3.6))
      %666+sum(abs(20-P_P2G))
      
end

