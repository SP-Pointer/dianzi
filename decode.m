%译码主体
function output_signal=decode(signal,all_code_signal,all_signal)
output_signal=rs_interpret(signal,all_code_signal,all_signal);
return;
%计算GF域内两个码字的码距子程序：
function ret_distance = gf_dis(a,b)
ret_distance = 0;
a_temp = de2bi(gf2num(a),3);
b_temp = de2bi(gf2num(b),3);
temp = a_temp+b_temp;
temp = mod(temp,2);
ret_distance = sum(temp);
%计算GF域内每个码元与“0”码字的码距，并映射在成实数子程序：
function zero_code_distance = gf2num(gf_a)
zero_code_distance = -1;
if (gf_a == gf(0,3)) zero_code_distance = 0; end
if (gf_a == gf(1,3)) zero_code_distance = 1; end
if (gf_a == gf(2,3)) zero_code_distance = 2; end
if (gf_a == gf(3,3)) zero_code_distance = 3; end
if (gf_a == gf(4,3)) zero_code_distance = 4; end
if (gf_a == gf(5,3)) zero_code_distance = 5; end
if (gf_a == gf(6,3)) zero_code_distance = 6; end
if (gf_a == gf(7,3)) zero_code_distance = 7; end
%得到码距最短的码字：
function min_codeword=rs_interpret(in_msg,all_code_msg,all_msg)
for i=1:512
 rs_dis(i)=rscode_dis(in_msg,all_code_msg(i,:)); 
end
rs_dis_min =min(rs_dis);
index = find(rs_dis == rs_dis_min);
min_codeword = all_msg(index(1),:);
return;
%计算两个RS码的码距子程序：
function code_distance = rscode_dis(code1,code2)
code_distance = 0;
for i = 1:7
 temp = gf_dis(code1(i),code2(i));
 code_distance = code_distance+temp;
end

