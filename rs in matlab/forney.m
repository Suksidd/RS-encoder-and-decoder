clc 
clear all 
landa7=0;landa5=0;landa3=0;landa1=19; 
omega7=0;omega6=0;omega5=0;omega4=0;omega3=0;omega2=0;omega1=0;omega0=152; 
m = 8; % Number of bits per symbol 
n = 2^m-1; k = 239; % Word lengths for code 
P = gf([omega7 omega6 omega5 omega4 omega3 omega2 omega1 omega0],m); 
Q = gf([landa7 0 landa5 0 landa3 0 landa1],m); 
X = P / Q 
% chien_roots = roots(poly); % GF(256) 
% check_answer = polyval(poly,chien_roots); % Zero vector 
% beta = 1/chien_roots; 

