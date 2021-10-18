
load P300
% P300 spellerのデータをオープン
data = y(:, 256*10+1:length(y));
% 最初の10秒間を削除する
for ii = 1:10 % 全てのデータを描画する
    figure(1);
    subplot(10,1,ii);
    plot(data(1,:), data(ii+1,:));
    xlabel('Time (s)');
    if ii<9
        ylabel('EEG (microV)');
        title(Ch{ii});
        ylim([-100, 100]);
    elseif ii ==10
        title('Trigger signal');
    end

end