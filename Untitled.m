all_rand_signal=all_signal; %所有可能的信号
all_galois_field=gf(all_rand_signal,3); %将所有的信号映射到GF域，gf是matlab自带的
all_code_signal=reed_solomon_codes(all_galois_field) ; %对所有的信号进行RS编码，得到所有正确的编码
rand_signal=floor((rand(5,3))*8) %产生随机的5组信号并打印，每组3个，floor作用是取整
signal_galois_field=gf(rand_signal,3); %将产生的5组信号映射到GF域
code=reed_solomon_codes(signal_galois_field) %对5组信号进行编码，得到5组正确的RS码
%加噪
ad_signal=code+noise %对编码后的信号加噪，
%译码
for ii = 1:5 %对5组信号进行译码
 output_signal(ii,:) = decode(ad_signal(ii,:),all_code_signal,all_rand_signal);
end
output_signal%输出信号
decoding_accuracy = correct_rate(rand_signal,output_signal)%译码正确率
？1.1