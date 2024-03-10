clear all;clc;

%% 数字信号处理实验三 2022.6.15

N = 1000; 
xt = xtg(N);

fp = 120; fs = 150; Rs = 0.1; As = 60; Fs = 1000;
%% 用窗函数设计FIR滤波器 布莱克曼窗
wc = (fp + fs)/(Fs);    %截止频率 对数字角频率pi归一化
B = 2*pi*(fs - fp)/Fs;
Nb = ceil(11*pi/B);     %长度
hn = fir1(Nb-1,wc,blackman(Nb));    %单位脉冲响应

Hw = abs(fft(hn,1024));  %滤波器幅频响应
ywt = fftfilt(hn,xt,N);

f= [0:1023]/1024*Fs;
figure(2);
subplot(2,1,1);plot(f,20*log10(Hw/max(Hw)));axis([0,Fs/2,-120,20]);title("输出信号幅频特性");

t = [0:N - 1]/Fs;
subplot(2,1,2);plot(t,ywt);title("输出信号时域波形");