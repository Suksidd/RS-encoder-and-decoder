clc 
clear all 
m = 8; % Number of bits per symbol 
% prim_poly = 19;    %primitive polynomial 
n = 2^m-1; k = 239; % Word lengths for code 
t=(n-k)/2; 
zero_t = zeros(1,t); 
s0 = 0; s1 = 0; s2 = 0; s3 = 0; 
s4 = 0; s5 = 0; s6 = 0; s7 = 0; 
s8 = 0; s9 = 0; s10= 0; s11= 0; 
s12= 0; s13= 0; s14= 0; s15= 0; 
delta = gf([1 zero_t s15 s14 s13 s12 s11 s10 s9 s8 s7 s6 s5 s4 s3 s2 s1 s0],m); 
teta = gf([1 zero_t s15 s14 s13 s12 s11 s10 s9 s8 s7 s6 s5 s4 s3 s2 s1 s0],m); 
delta0 = delta(3*t+1); 
k = 0; lamda = gf(1,m); 
for r=1:2*t 
    delta1 = lamda .* delta; 
    delta2 = delta1(1:3*t); 
    delta3 = [0 delta2]; 
    new_delta = delta3 + delta0 .* teta;  
    if (delta0 ~=0 && k>=0) 
        teta1 = delta(1:3*t); 
        teta = [0 teta1]; 
        lamda = delta0; 
        k = -k - 1; 
    else 
        k = k + 1; 
    end 
    delta = new_delta; 
    delta0 = delta(3*t+1);     
end  
ELP = delta(t+1:2*t+1) 
EEP = delta(2*t+2:end) 

