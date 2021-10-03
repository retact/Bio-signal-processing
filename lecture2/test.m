%%% Task1
% load matfile
load('../EEG-sample/close.mat');
% extract main data
closeEEG=y(:,256*10+1:length(y));

% subplot
tt=256*5+1:256*6;
figure(4);
subplot(4,2,1);
plot(closeEEG(1,tt), closeEEG(2,tt));
xlabel('Time (s)');
ylabel('EEG (microV)');
ylim([-100, 100]);
title('EEG wavefromat Fz-eyes closed')

Ch ={'Fz', 'Cz', 'P3', 'Pz', 'P4', 'PO7','Oz','PO8'};
figure(5);
for ii = 1:8 %index ii＝１〜8までLOOPする
    subplot(4,2,ii); %領域の指定
    plot(closeEEG(1,tt), closeEEG(ii+1,tt));
    %データの指定
    xlabel('Time (s)');
    ylabel('EEG (microV)'); %軸のラベル
    ylim([-100, 100]);
    title(Ch{ii});
end

annotation('textbox', [0.25, 0.02, 0.5, 0.05], ...
    'String', 'Figure 1. EEG during eyes closed', ...
    'HorizontalAlignment', 'center', ...
    'VerticalAlignment', 'middle', ...
    "lineStyle", 'none');