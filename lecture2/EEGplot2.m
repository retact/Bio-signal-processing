function data = EEGplot2(closeEEG, Ch, timeRange, channel, figNo)
tt=256*timeRange(1)+1:256*timeRange(2); %時間帯を変数ttとして指定
data = closeEEG(channel+1, tt); %抽出するデータの指定
figure(figNo);
plot(closeEEG(1, tt), data);
xlabel('Time (s)');
ylabel('Amplitude (microV)');
ylim([-100,100]);
title(Ch{channel})
end