# Lecture1 2021-09-21
I made it gnarly in python to make it a little more interesting like this.  
 
![eeg-anime](image/eeg-anim.gif)

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

...
```

## Task2
![Fig4](image/figure4.jpg)
``` test.m
....
%%% Task2
figure(4)
plot(closeEEG(1, 256*3+1:256*4),closeEEG(4,256*3+1:256*4))
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
closeEEG=y(:,1:length(y));
figure(5)
plot(closeEEG(1, 256*9+1:256*11),closeEEG(4,256*9+1:256*11))
xlabel('Time (s)');
ylabel('EEG (microV)');
title('EEG waveform at Oz - eyes closed(7ch)');
ylim([-128,127]);
```
