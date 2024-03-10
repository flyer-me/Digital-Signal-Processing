clear all;clc;

%% 数字信号处理实验二 2022.6.13
FFTNum1 = 8; FFTNum2 = 16;
k_a = (0:FFTNum1-1); k_b = (0:FFTNum2-1);
wk_a = 2*(0:FFTNum1-1)/FFTNum1; wk_b = 2*(0:FFTNum2-1)/FFTNum2;

%% 对R4(n)的分析
x1n = ones(1,4);
X1k_a = fft(x1n,FFTNum1);X1k_b = fft(x1n,FFTNum2);

figure(1);
subplot(4,1,1);stem(x1n);title("R4(n)");
subplot(4,1,2);plot(2*(0:1023)/1024,abs(fft(x1n,1024)));xlim([0,2]);ylabel("幅度");title("1024");
subplot(4,1,3);stem(wk_a,abs(X1k_a));xlim([0,2]);ylabel("幅度");title("x1n 8点DFT");
subplot(4,1,4);stem(wk_b,abs(X1k_b));xlim([0,2]);ylabel("幅度");title("x1n 16点DFT");

%% 对三角波的分析
M =8; xa = 1:floor(M/2); xb = floor(M/2):-1:1;
x2n = [xa,xb];x3n = [xb,xa];

X2k_a = fft(x2n,FFTNum1);X2k_b = fft(x2n,FFTNum2);
X3k_a = fft(x3n,FFTNum1);X3k_b = fft(x3n,FFTNum2);

figure(2);
subplot(2,3,1);plot(x2n); title("三角波X2");
subplot(2,3,2);stem(wk_a,abs(X2k_a));ylabel("幅度");title("x2n 8点DFT");
subplot(2,3,3);stem(wk_b,abs(X2k_b));ylabel("幅度");title("x2n 16点DFT");
subplot(2,3,4);plot(x3n); title("三角波X3");
subplot(2,3,5);stem(wk_a,abs(X3k_a));ylabel("幅度");title("x3n 8点DFT");
subplot(2,3,6);stem(wk_b,abs(X3k_b));ylabel("幅度");title("x3n 16点DFT");

%% 对周期序列的分析
x4n = cos(pi/4*k_a); x5n = cos(pi/4*k_a) + cos(pi/8*k_a);
X4k_a = fft(x4n,FFTNum1); X5k_a = fft(x5n,FFTNum1);

x4n = cos(pi/4*k_b); x5n = cos(pi/4*k_b) + cos(pi/8*k_b);
X4k_b = fft(x4n,FFTNum2); X5k_b = fft(x5n,FFTNum2);

figure(3);
subplot(2,2,1);stem(wk_a,abs(X4k_a)/(FFTNum1/2));xlim([0,2]);ylabel("归一化幅度");title("x4n 8点DFT");
subplot(2,2,2);stem(wk_a,abs(X5k_a)/(FFTNum1/2));xlim([0,2]);ylabel("归一化幅度");title("x5n 8点DFT");
subplot(2,2,3);stem(wk_b,abs(X4k_b)/(FFTNum2/2));xlim([0,2]);ylabel("归一化幅度");title("x4n 16点DFT");
subplot(2,2,4);stem(wk_b,abs(X5k_b)/(FFTNum2/2));xlim([0,2]);ylabel("归一化幅度");title("x5n 16点DFT");

%% 对模拟信号的分析
Fs = 64;
T = 1/Fs;
N1 = 16; N2 = 32; N3 = 64;
n = 0:N3-1;
x6n = cos(8*pi*n*T) + cos(18*pi*n*T) + cos(20*pi*n*T);
X6k_a = fft(x6n,N1); f1 = (0:N1-1)/N1*Fs;
X6k_b = fft(x6n,N2); f2 = (0:N2-1)/N2*Fs;
X6k_c = fft(x6n,N3); f3 = (0:N3-1)/N3*Fs;

figure(4);
subplot(3,1,1);stem(f1,abs(X6k_a)/(N1/2));xlim([0,64]);ylabel("归一化幅度");title("16点DFT");
subplot(3,1,2);stem(f2,abs(X6k_b)/(N2/2));xlim([0,64]);ylabel("归一化幅度");title("32点DFT");
subplot(3,1,3);stem(f3,abs(X6k_c)/(N3/2));xlim([0,64]);ylabel("归一化幅度");title("64点DFT");