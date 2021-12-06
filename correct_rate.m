function out=correct_rate(signal1,signal2)%signal1和signal2是发送信号和解码后的信号
out=length(find(signal1==signal2))/15;%a为正确率，find函数判断两个信号不同元素的个数，find函数是matlab自带的

