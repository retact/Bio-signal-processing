%%% Task1
% load matfile
load('close.mat');
figure(1);
plot(y(1,:),y(2:9,:));
% extract main data
closeEEG=y(:,256*10+1:length(y));
figure(2)
% plot the data
plot(closeEEG(1,:),closeEEG(8,:))
xlabel('Time (s)');
ylabel('EEG (microV)');
title('EEG waveform at Oz - eyes closed(7ch)');

figure(3)
plot(closeEEG(1, 256*3+1:256*4),closeEEG(8,256*3+1:256*4))
xlabel('Time (s)');
ylabel('EEG (microV)');
title('EEG waveform at Oz - eyes closed(7ch)');
ylim([-128,127]);


%%% Task2
figure(4)
plot(closeEEG(1, 256*3+1:256*4),closeEEG(4,256*3+1:256*4))
xlabel('Time (s)');
ylabel('EEG (microV)');
title('EEG waveform at Oz - eyes closed(3ch)');
ylim([-128,127]);

%%%  Task3
closeEEG=y(:,1:length(y));
figure(5)
plot(closeEEG(1, 256*9+1:256*11),closeEEG(4,256*9+1:256*11))
xlabel('Time (s)');
ylabel('EEG (microV)');
title('EEG waveform at Oz - eyes closed(7ch)');
ylim([-128,127]);