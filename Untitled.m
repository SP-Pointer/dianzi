all_rand_signal=all_signal; %���п��ܵ��ź�
all_galois_field=gf(all_rand_signal,3); %�����е��ź�ӳ�䵽GF��gf��matlab�Դ���
all_code_signal=reed_solomon_codes(all_galois_field) ; %�����е��źŽ���RS���룬�õ�������ȷ�ı���
rand_signal=floor((rand(5,3))*8) %���������5���źŲ���ӡ��ÿ��3����floor������ȡ��
signal_galois_field=gf(rand_signal,3); %��������5���ź�ӳ�䵽GF��
code=reed_solomon_codes(signal_galois_field) %��5���źŽ��б��룬�õ�5����ȷ��RS��
%����
ad_signal=code+noise %�Ա������źż��룬
%����
for ii = 1:5 %��5���źŽ�������
 output_signal(ii,:) = decode(ad_signal(ii,:),all_code_signal,all_rand_signal);
end
output_signal%����ź�
decoding_accuracy = correct_rate(rand_signal,output_signal)%������ȷ��
��1.1