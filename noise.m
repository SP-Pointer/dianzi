function x=noise(x);
%����
a=zeros(5,5);
b=floor(rand(5,2)*8);
x=gf([a,b],3);%������������Ͷ�䵽GF��
end

