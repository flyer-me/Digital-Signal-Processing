clear; clc;

%% 实验：DCT进行图像变换
% 亮度亮度量化表
lighttable=[16 11 10 16 24 40 51 61 ;
            12 12 14 19 26 58 60 55 ;
            14 13 16 24 40 57 69 56 ;
            14 17 22 29 51 87 80 62 ;
            18 22 37 56 68 109 103 77;
            24 35 55 64 81 104 113 92;
            49 64 78 87 103 121 120 101;
            72 92 95 98 112 100 103 99];

X = imread('lena.bmp');
X = double(X);
[a,b] = size(X);
Y = blkproc(X,[8 8],'dct2');    %DCT
X1 = blkproc(Y,[8 8],'idct2');  %还原

T = 0.05;%量化因子
Y1 = blkproc(Y,[8 8],'round(x./P1)',T*lighttable); %量化


X2 = blkproc(Y1,[8 8],'idct2');
figure(1);
subplot(1,4,1);imshow(uint8(X));title("原图");
subplot(1,4,2);imshow(uint8(Y));title("分块DCT变换图");
subplot(1,4,3);imshow(uint8(X1));title("分块DCT恢复图");
subplot(1,4,4);imshow(uint8(X2));title("压缩0.05恢复图");