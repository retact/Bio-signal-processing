function [s_power] = powercalc2(EEG, Ch)
original_data= EEG(Ch+1,:);
Fs = 256;
Datalen= 1;
Period = 120;
minf= 8;
maxf= 13; 
s_power= zeros(1, fix(Period/Datalen)); 
freq= 0:Fs/(Datalen*Fs-1):Fs/2; 
mini = find(freq<minf, 1, 'last'); 
maxi = find(freq<maxf, 1, 'last'); 
for ii = 1:fix(Period/Datalen) 
    % データを分割，フーリエ変換
    data = original_data(1, 1+Fs*(ii-1):Fs*ii);
    fftdata= fft(data); 
    pow_fftdata= abs(fftdata).^2/length(fftdata); 
    singlePow= [pow_fftdata(1), 2*pow_fftdata(2:length(freq))];
    s_power(ii) = sum(singlePow(mini+1:maxi));
end
