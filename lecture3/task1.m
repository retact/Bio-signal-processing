% task1

load('../EEG-sample/open.mat','y');
openEEG = y(:, 256*10+1:length(y))

load('../EEG-sample/close.mat','y');
closeEEG = y(:, 256*10+1:length(y))

figure;
close_alpha= powercalctask(closeEEG(:,1:256*120), 7, 1,'close');
open_alpha= powercalctask(openEEG(:,1:256*120), 7, 2, 'open');


function [power8_13] = powercalctask(EEG, Ch, num, opcl)
data = EEG(Ch+1,:);
fftdata= fft(data);
pow_fftdata= abs(fftdata).^2/length(fftdata);
freq= 0:256/(length(pow_fftdata)-1):256/2;
singlePow= [pow_fftdata(1), 2*pow_fftdata(2:length(freq))];
subplot(2,1,num);
plot(freq, singlePow);
xlabel('Frequency (Hz)');
ylabel('Power (\muV^2)');
title(opcl);
xlim([0,50]);
mini = find(freq<8, 1, 'last');
maxi = find(freq<13, 1, 'last');
power8_13 = sum(singlePow(mini+1:maxi))
end