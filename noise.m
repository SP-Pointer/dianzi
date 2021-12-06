function x=noise(x);
%噪声
a=zeros(5,5);
b=floor(rand(5,2)*8);
x=gf([a,b],3);%产生噪声并且投射到GF域
end

