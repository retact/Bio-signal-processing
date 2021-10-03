load('../EEG-sample/close.mat');
closeEEG=y(:,256*10+1:length(y));

% Task1
tt=256*10+1:256*11;
Ch ={'Fz', 'Cz', 'P3', 'Pz', 'P4', 'PO7','Oz','PO8'};
figure(1);
for ii = 1:8
    subplot(2,4,ii);
    plot(closeEEG(1,tt), closeEEG(ii+1,tt));
    xlabel('Time (s)');
    ylabel('EEG (microV)');
    ylim([-100, 100]);
    title(Ch{ii});
end

annotation('textbox', [0.28, 0.001, 0.5, 0.05], ...
           'String', 'Figure 1. EEG during eyes closed', ...
           'HorizontalAlignment', 'center', ...
           'VerticalAlignment', 'middle', ...
           "lineStyle", 'none');


% Task2
Ch ={'Fz', 'Cz', 'P3', 'Pz', 'P4', 'PO7','Oz','PO8'};
d1=EEGplot_task2(closeEEG, Ch, [12, 14], 7, 2);
d2=EEGplot_task2(closeEEG, Ch, [12, 14], 1, 3);

function data = EEGplot_task2(closeEEG, Ch, timeRange, channel, figNo)
tt=256*timeRange(1)+1:256*timeRange(2);
data = closeEEG(channel+1, tt);
figure(figNo);
plot(closeEEG(1, tt), data);
xlabel('Time (s)');
ylabel('Amplitude (microV)');
ylim([-100,100]);
title(Ch{channel})
end