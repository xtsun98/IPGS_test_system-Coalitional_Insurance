function PGaim  = objE_and_G(PLoadcut,GLoadinit,GLoadcut,nodenum,f_GG,fGG,f_P2G,fP2G)
%OBJE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    %Ŀ�꺯��
%     global Load_num PLoadinit RoGG RoP2G lamdaGG lamdaP2G ss
    %��ʱ����----------------dfGG����
%     gLoadcut1=0;
%     for i = 1:nodenum
%         gLoadcut1 = gLoadcut1 + GLoadinit(i)-GLoad(i);
%     end
%     gLoadcut = gLoadcut1;
    
    PGaim=sum(PLoadcut)+sum(GLoadcut)*5000;
   
     %%------------------------
%     pLoadcut=pLoadcut+(lamdaGG(ss-1,1))'*(f_GG-fGG(ss-1,1))+0.5*RoGG*norm((f_GG-fGG(ss-1,1))).^2+...
%         +(lamdaP2G(ss-1,1))'*(f_P2G-fP2G(ss-1,1))+0.5*RoP2G*norm((f_P2G-fP2G(ss-1,1))).^2;
      %Zע��lamda��n��n*1������fggΪn*1����sum(abs(20-dfP2G(:,ss)*1000*36/3.6))
      %666+sum(abs(20-P_P2G))
      
end

