function [power8_13] = powercalc(EEG, Ch)
data = EEG(Ch+1,:);
% フーリエ変換したいチャンネルを選ぶ
fftdata= fft(data);
% fftはフーリエ変換する関数
pow_fftdata= abs(fftdata).^2/length(fftdata);
% absは絶対値をとる関数
freq= 0:256/(length(pow_fftdata)-1):256/2;
% 周波数の目盛りを設定
singlePow= [pow_fftdata(1), 2*pow_fftdata(2:length(freq))];
figure;
plot(freq, singlePow);
%スペクトルの表示
mini = find(freq<8, 1, 'last');
% 8Hz未満で最大の行数をみつける
maxi = find(freq<13, 1, 'last');
% 13Hz未満で最大の行数を見つける
power8_13 = sum(singlePow(mini+1:maxi))