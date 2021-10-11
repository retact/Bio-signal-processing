load('../EEG-sample/open.mat','y');
openEEG = y(:, 256*10+1:length(y))

load('../EEG-sample/close.mat','y');
closeEEG = y(:, 256*10+1:length(y))

% 振幅スペクトル
data = closeEEG(8,:);
fftdata= fft(data);
figure(1);
plot(abs(fftdata));

% パワースペクトル
pow_fftdata= abs(fftdata).^2/length(fftdata);% /length is normalization.
figure(2);
plot(pow_fftdata);


freq = 0:256/(length(pow_fftdata)-1):256/2;
singlePow= [pow_fftdata(1), 2*pow_fftdata(2:length(freq))];
figure(3);
plot(freq, singlePow);
xlabel('Frequency (Hz)');
ylabel('Power (\muV^2)');
xlim([0,50]);


close_alpha= powercalc(closeEEG(:,1:256*120), 7);
open_alpha= powercalc(openEEG(:,1:256*120), 7);

