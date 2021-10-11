% task2

load('../EEG-sample/close.mat','y');
closeEEG = y(:, 256*10+1:length(y))

figure;
close7_alpha= powercalctask2(closeEEG(:,1:256*120), 7, 1,'close 7ch');
close1_alpha= powercalctask2(closeEEG(:,1:256*120), 1, 2, 'close 1ch');

function [power8_13] = powercalctask2(EEG, Ch, num, opcl)
data = EEG(Ch+1,:);
fftdata= fft(data);
pow_fftdata= abs(fftdata).^2/length(fftdata);
freq= 0:256/(length(pow_fftdata)-1):256/2;
singlePow= [pow_fftdata(1), 2*pow_fftdata(2:length(freq))];
subplot(2,1,num);
plot(freq, singlePow);
xlabel('Frequency (Hz)');
ylabel('Power (\muV^2)');
xlim([0,50]);
title(opcl);
mini = find(freq<8, 1, 'last');
maxi = find(freq<13, 1, 'last');
power8_13 = sum(singlePow(mini+1:maxi))
end