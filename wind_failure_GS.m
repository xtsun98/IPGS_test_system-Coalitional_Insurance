function  [F_GS,Pai_L,F_GS0]  = wind_failure_GS(w3,w4,w5,w6,Rd)
%针对不同子区域天然气系统灾害建模
%初始化   
lamda_kL=zeros(19,48);
Pai_L=zeros(19,48);
Lk=[4,6,26,43,29,19,55,20,25,42,40,5,10,25,10.5,98,6,20,26];
F_GS=zeros(19,48);
F_GS0=zeros(19,48);
r=unifrnd(0.0,1,19,48);
ak=8.6784;
bk=10.4035;
ck=-28.1067;
wd=50;
R3=32;R4=31;R5=30;R6=29;
%% P
for t=2:1:48
    for k_L=1:1:19
        switch k_L
            case {13,14}
                lamda_kL(k_L,t)=Lk(k_L)*exp(ak*w3(t)/wd+bk*Rd(t)/R3+ck);
                Pai_L(k_L,t)=Pai_L(k_L,t-1)+(1-Pai_L(k_L,t-1))*(1-exp(-lamda_kL(k_L,t)*t));

            case {7,11,12}
                lamda_kL(k_L,t)=Lk(k_L)*exp(ak*w4(t)/wd+bk*Rd(t)/R4+ck);
                Pai_L(k_L,t)=Pai_L(k_L,t-1)+(1-Pai_L(k_L,t-1))*(1-exp(-lamda_kL(k_L,t)*t));

            case {1,2,3,6,5,9,10,15,16,17,19}
                lamda_kL(k_L,t)=Lk(k_L)*exp(ak*w5(t)/wd+bk*Rd(t)/R5+ck);
                Pai_L(k_L,t)=Pai_L(k_L,t-1)+(1-Pai_L(k_L,t-1))*(1-exp(-lamda_kL(k_L,t)*t));

            case {4,8,18}
                lamda_kL(k_L,t)=Lk(k_L)*exp(ak*w6(t)/wd+bk*Rd(t)/R6+ck);
                Pai_L(k_L,t)=Pai_L(k_L,t-1)+(1-Pai_L(k_L,t-1))*(1-exp(-lamda_kL(k_L,t)*t));
        end
    end
end    
%% F
for tt=1:1:48 
    for k=1:1:17
    if Pai_L(k,tt)<r(k,tt)
        F_GS0(k,tt)=0;
        else  F_GS0(k,tt)=1;  
    end
    end 
end

for pipelinei=1:1:17
    for Ti=1:1:48
        if F_GS0(pipelinei,Ti)==1
            F_GS(pipelinei,Ti+1:Ti+4)=1;
        end
    end
end

for tt=1:1:48 
    for compressor=18:1:19
    if Pai_L(compressor,tt)<r(compressor,tt)
        F_GS0(compressor,tt)=0;
        else  F_GS0(compressor,tt)=1;  
    end
    end 
end

for compressor=18:1:19
    for Ti=1:1:48
        if F_GS0(compressor,Ti)==1
            F_GS(compressor,Ti+1:Ti+4)=1;
        end
    end
end

end







    


