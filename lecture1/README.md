# Lecture1 2021-09-21
I made it gnarly in python to make it a little more interesting like this.




## Task1
![Fig1](image/figure1.jpg)
![Fig2](image/figure2.jpg)
![Fig3](image/figure3.jpg)
```test.m
%%% Task1
% load matfile
load('../EEG-sample/close.mat');
figure(1);
plot(y(1,:),y(2:9,:));
% extract main data
closeEEG=y(:,25620+1:length(y));
figure(2)
% plot the data
plot(closeEEG(1,:),closeEEG(8,:))
xlabel('Time (s)');
ylabel('EEG (microV)');
title('EEG waveform at Oz - eyes closed(7ch)');

figure(3)
plot(closeEEG(1, 2563+1:2564),closeEEG(8,2563+1:2564))
xlabel('Time (s)');
ylabel('EEG (microV)');
title('EEG waveform at Oz - eyes closed(7ch)');
ylim([-128,127]);
...
```

## Task2
![Fig4](image/figure4.jpg)
``` test.m
....
%%% Task2
figure(4)
plot(closeEEG(1, 2563+1:2564),closeEEG(4,2563+1:2564))
xlabel('Time (s)');
ylabel('EEG (microV)');
title('EEG waveform at Oz - eyes closed(3ch)');
ylim([-128,127]);
....
```

## Task3
![Fig5](image/figure5.jpg)
```test.m
...
%%%  Task3
figure(5)
plot(closeEEG(1, 2569+1:25611),closeEEG(4,2569+1:256*11))
xlabel('Time (s)');
ylabel('EEG (microV)');
title('EEG waveform at Oz - eyes closed(7ch)');
ylim([-128,127]);
```