
% Author: Shadi Ghiasi
% Please refer to the following paper for the definition of the model
%Title: Quantification of Different Regulatory Pathways Contributing to Heartbeat Dynamics during Multiple Stimuli: a Proof of the Concept
%DOI:10.1109/EMBC.2019.8856461


% The distenagling model takes three inputs three different experimental sessions
%(Stressor_1, Stressor_2,Stresoor_12)
% and the coresponding restings states before each single stimulus
% (Stressor_1_r, Stressor_2_r
% These inputs are vagal quantification of heartbeat dynamics by
% estimatig the HF value of HRV times series.
% Model's input:
% HF_Stressor_1
% HF_Stressor_2
% HF_Stresoor_12



% Model's output:
% alpha_p
% beta_p

% Model's verification: 
% alpha_prime_p>alpha_p
% beta_zegond_p>beta_p

function [alpha_p,beta_p,alpha_prime_p,beta_zegond_p]= Model_Disentangling(HF_Stressor_1,HF_Stressor_1_r,HF_Stressor_2,HF_Stressor_2_r,HF_Stresoor_12)



%% Applying disentangling model
C_Stressor_1=(HF_Stressor_1).^2;
C_Stressor_2=(HF_Stressor_2).^2;
C_Stresoor_12=abs(HF_Stresoor_12).^2;


C_Stressor_1_r=(HF_Stressor_1_r).^2;
C_Stressor_2_r=(HF_Stressor_2_r).^2;



% model's output
if C_Stresoor_12<C_Stressor_2
    
    alpha_p=(C_Stresoor_12-C_Stressor_2)./(-C_Stressor_1-C_Stressor_2);
else
    alpha_p=(-C_Stressor_2/(C_Stresoor_12)+1)./(C_Stressor_1/C_Stressor_2+1);
end
beta_p=1-alpha_p;




%%  model's verification
% Case 2:  stressor_1, stressor_12, rest
if C_Stresoor_12<(C_Stressor_1_r)
    alpha_prime_p=(C_Stresoor_12-C_Stressor_1_r)./(-C_Stressor_1-C_Stressor_1_r);
else
    alpha_prime_p=(-C_Stressor_1_r/(C_Stresoor_12)+1)./((C_Stressor_1/C_Stressor_1_r)+1);
end
% Case 3: stressor_2,stressor_12,rest
if C_Stresoor_12<C_Stressor_2
    alpha_zegond_p=(C_Stresoor_12-C_Stressor_2)./(-C_Stressor_2_r-C_Stressor_2);
else
    alpha_zegond_p=((-C_Stressor_2/C_Stresoor_12)+1)./((cl_rem/C_Stressor_2)+1);
    
end

beta_prime_p=1-alpha_pri,e_p;
beta_zegond_p=1-alpha_zegond_p;



end



