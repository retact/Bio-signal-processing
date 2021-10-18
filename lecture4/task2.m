%% task2
load('../EEG-sample/open.mat','y');
openEEG = y(:, 256*10+1:length(y))
load('../EEG-sample/close.mat','y');
closeEEG = y(:, 256*10+1:length(y))

% Every 5 seconds
Datalength=5
o_power24 = powercalc_task1(openEEG, 7, Datalength);
c_power24 = powercalc_task1(closeEEG, 7, Datalength);

figure;
plot(Datalength:Datalength:120, o_power24, '->m');
hold on;
plot(Datalength:Datalength:120, c_power24, '-<b', 'MarkerFaceColor', [0 .6 .6]);
hold on;

Datalength=120
o_power1 = powercalc_task2(openEEG, 7, Datalength);
c_power1 = powercalc_task2(closeEEG, 7, Datalength);
yline(o_power1/24,'m')
hold on;
yline(c_power1/24,'b');
xlabel('Time [s]');
ylabel('\alpha band power [\muV^2]');
legend({'Open', 'Close'});

function [s_power] = powercalc_task1(EEG, Ch, Datalen)
original_data= EEG(Ch+1,:);
Fs = 256;
Period = 120;
minf= 8;
maxf= 13; 
s_power= zeros(1, fix(Period/Datalen)); 
freq= 0:Fs/(Datalen*Fs-1):Fs/2; 
mini = find(freq<minf, 1, 'last'); 
maxi = find(freq<maxf, 1, 'last'); 
for ii = 1:fix(Period/Datalen) 
    data = original_data(1, 1+Fs*(ii-1)*Datalen:Fs*ii*Datalen);
    fftdata = fft(data); 
    pow_fftdata = abs(fftdata).^2/length(fftdata); 
    singlePow = [pow_fftdata(1), 2*pow_fftdata(2:length(freq))];
    s_power(ii) = sum(singlePow(mini+1:maxi));
end
end

function [s_power] = powercalc_task2(EEG, Ch, Datalen)
original_data= EEG(Ch+1,:);
Fs = 256;
Period = 120;
minf= 8;
maxf= 13; 
s_power= zeros(1, fix(Period/Datalen)); 
freq= 0:Fs/(Datalen*Fs-1):Fs/2; 
mini = find(freq<minf, 1, 'last'); 
maxi = find(freq<maxf, 1, 'last'); 
for ii = 1:fix(Period/Datalen) 
    data = original_data(1, 1+Fs*(ii-1)*Datalen:Fs*ii*Datalen);
    fftdata = fft(data); 
    pow_fftdata = abs(fftdata).^2/length(fftdata); 
    singlePow = [pow_fftdata(1), 2*pow_fftdata(2:length(freq))];
    s_power(ii) = sum(singlePow(mini+1:maxi));
end
end
