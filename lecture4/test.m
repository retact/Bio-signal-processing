load('../EEG-sample/open.mat','y');
openEEG = y(:, 256*10+1:length(y))

load('../EEG-sample/close.mat','y');
closeEEG = y(:, 256*10+1:length(y))

o_power120 = powercalc2(openEEG, 7);
c_power120 = powercalc2(closeEEG, 7);
figure;
plot(1:120, o_power120, ':ok');
hold on;
plot(1:120, c_power120, '-sk', 'MarkerFaceColor', [0,0,0]);
xlabel('Time [s]');
ylabel('\alpha band power [\muV^2]');
legend({'Open', 'Close'});

load P300
% P300 spellerのデータをオープン
data = y(:, 256*10+1:length(y));
% 最初の10秒間を削除する
for ii = 1:10 % 全てのデータを描画する
    figure(1);
    subplot(10,1,ii);
    plot(data(1,:), data(ii+1,:));
end