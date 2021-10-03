load('../EEG-sample/open.mat');
closeEEG=y(:,256*10+1:length(y));
Ch ={'Fz', 'Cz', 'P3', 'Pz', 'P4', 'PO7','Oz','PO8'};
figure(4);
for ii = 1:8
    subplot(4,2,ii);
    plot(closeEEG(1,tt), closeEEG(ii+1,tt));
    xlabel('Time (s)');
    ylabel('EEG (microV)');
    ylim([-100, 100]);
    title(Ch{ii});
end
annotation('textbox', [0.25, 0.02, 0.5, 0.05], ...
           'String', 'Figure 1. EEG during eyes open', ...
           'HorizontalAlignment', 'center', ...
           'VerticalAlignment', 'middle', ...
           "lineStyle", 'none');