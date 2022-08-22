function  [F_PS,P_L,F_PS0]  = wind_failure_PS(r,w_critical,w_collapse,w2,w3,w4,w5,w6)
%针对不同子区域电力系统灾害建模
%   
P_L=zeros(46,48);
P_T0=zeros(46,48);
P_T=zeros(46,48);
P_BR=zeros(46,48);
F_PS=zeros(46,48);
F_PS0=zeros(46,48);
%% P_BR,L
for t=1:1:48
    for k_L=1:1:46
        switch k_L
            case {12,14,15,16}
                if w2(t)<w_critical
                    P_L(k_L,t)=0.001;%~P_L
                    else if w2(t)<w_collapse
                            P_L(k_L,t)=0.05*w2(t)-1.5;
                        else P_L(k_L,t)=1;
                        end
                end
        
            case {2,10,11,13,17}
                if w3(t)<w_critical
                    P_L(k_L,t)=0.001;%~P_L
                    else if w3(t)<w_collapse
                            P_L(k_L,t)=0.05*w3(t)-1.5;
                        else P_L(k_L,t)=1;
                        end
                end

            case {1,3,5,6,8,9,18,19,21,22,23}
                if w4(t)<w_critical
                    P_L(k_L,t)=0.001;%~P_L
                    else if w4(t)<w_collapse
                            P_L(k_L,t)=0.05*w4(t)-1.5;
                        else P_L(k_L,t)=1;
                        end
                end
                
            case {4,7,20,24,25,26,27,28,29,30,31,40,41,42}
                if w5(t)<w_critical
                    P_L(k_L,t)=0.001;%~P_L
                    else if w5(t)<w_collapse
                            P_L(k_L,t)=0.05*w5(t)-1.5;
                        else P_L(k_L,t)=1;
                        end
                end

            case {32,33,34,35,36,37,38,39,43,44,45,46}
                if w6(t)<w_critical
                    P_L(k_L,t)=0.001;%~P_L
                    else if w6(t)<w_collapse
                            P_L(k_L,t)=0.05*w6(t)-1.5;
                        else P_L(k_L,t)=1;
                        end
                end                
        end                    
    end
end

%% P_BR,T
Nf=[30,30,45,52,32,20,40,26,52,28,64,30,106,52,30,16,30,45,40,52,36,16,65,48,58,95,30,80,65,52,40,42,38,30,27,29,32,28,30,28,28,28,38,42,36,30];%一条线路上杆塔数量
for t=1:1:48
    for k_T=1:1:46
        switch k_T
            case {12,14,15,16}
                if w2(t)<w_critical
                    P_T0(k_T,t)=0;%~P_T
                    else if w2(t)<180
                            P_T0(k_T,t)= 1.105*exp(-7.5e+08*w2(t).^(-4.8)) ;%Tower-wind 函数
                        else P_T0(k_T,t)=1;
                        end
                end
                P_T(k_T,t)=1-(1-P_T0(k_T,t)).^Nf(k_T);
                
            case {2,10,11,13,17}
                if w3(t)<w_critical
                    P_T0(k_T,t)=0;%~P_T
                    else if w3(t)<w_collapse
                            P_T0(k_T,t)= 1.105*exp(-7.5e+08*w3(t).^(-4.8)) ;%Tower-wind 函数
                        else P_T0(k_T,t)=1;
                        end
                end
                P_T(k_T,t)=1-(1-P_T0(k_T,t)).^Nf(k_T);

            case {1,3,5,6,8,9,18,19,21,22,23}
                if w4(t)<w_critical
                    P_T0(k_T,t)=0;%~P_T
                    else if w4(t)<w_collapse
                            P_T0(k_T,t)= 1.105*exp(-7.5e+08*w4(t).^(-4.8)) ;%Tower-wind 函数
                        else P_T0(k_T,t)=1;
                        end
                end
                P_T(k_T,t)=1-(1-P_T0(k_T,t)).^Nf(k_T);
                
            case {4,7,20,24,25,26,27,28,29,30,31,40,41,42}
                if w5(t)<w_critical
                    P_T0(k_T,t)=0;%~P_T
                    else if w5(t)<w_collapse
                            P_T0(k_T,t)= 1.105*exp(-7.5e+08*w5(t).^(-4.8)) ;%Tower-wind 函数
                        else P_T0(k_T,t)=1;
                        end
                end
                P_T(k_T,t)=1-(1-P_T0(k_T,t)).^Nf(k_T);

            case {32,33,34,35,36,37,38,39,43,44,45,46}
                if w6(t)<w_critical
                    P_T0(k_T,t)=0;%~P_T
                    else if w6(t)<w_collapse
                            P_T0(k_T,t)= 1.105*exp(-7.5e+08*w6(t).^(-4.8)) ;%Tower-wind 函数
                        else P_T0(k_T,t)=1;
                        end
                end
                P_T(k_T,t)=1-(1-P_T0(k_T,t)).^Nf(k_T);              
        end                    
    end
end




%% P_BR
for t=1:1:48
    for k=1:1:46
        P_BR(k,t)=P_L(k,t)+P_T(k,t)-P_L(k,t)*P_T(k,t);
    end
end

%F
for t=1:1:48 
    for k=1:1:46
    if P_BR(k,t)<r(k,t)
        F_PS0(k,t)=0;
        else  F_PS0(k,t)=1;  
    end
    end 
end
%   确定维修时间
TTRnormal=10;
k1=unifrnd(2,4,1,46);
k2=unifrnd(3,5,1,46);

    for BRi=1:1:46
        for Lt=1:1:48
            if F_PS0(BRi,Lt)==1
                F_PS(BRi,Lt+1:Lt+round(k1(1,BRi)*10))=1;     
            end
        end
    end
    
end

