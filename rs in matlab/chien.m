
clc 
clear all 
landa8=0;landa7=0;landa6=0;landa5=0;landa4=0; 
landa3=0;landa2=32;landa1=37;landa0=45; 
m = 8; % Number of bits per symbol 
n = 2^m-1; k = 239; % Word lengths for code 
poly = gf([landa8 landa7 landa6 landa5 landa4 landa3 landa2 landa1 landa0],m); 
% chien_roots = roots(poly) % GF(256) 
% check_answer = polyval(poly,chien_roots); % Zero vector 
% beta = 1/chien_roots 
alpha = gf([29 128 64 32 16 8 4 2 1],m); 
zarb = poly .* alpha; 
i=1;j=0;sum_mat=[]; 
while (i<=255) 
    sum = zarb(1)+zarb(2)+zarb(3)+zarb(4)+zarb(5)+zarb(6)+zarb(7)+zarb(8)+zarb(9); 
    sum_mat = [sum sum_mat]; 
    zarb = zarb .* alpha; 
    if (sum==0) 
        z=0;j=j+1; 
        k(j)=i; 
    end; 
    i=i+1; 
end

