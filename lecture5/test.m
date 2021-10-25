load P300
% P300 spellerのデータをオープン
data = y(:, 256*10+1:length(y));
% 最初の10秒間を削除する
for ii = 1:10 
    % 全てのデータを描画する
    figure(1);
    subplot(10,1,ii);
    plot(data(1,:), data(ii+1,:));
end

t60 = find(y(1,:) <= 60, 1, 'last');
% t=60秒のインデックス
t70 = find(y(1,:) <= 70, 1, 'last');
% t=70秒のインデックス
figure(102);
subplot(2,1,1);
plot(y(1, t60:t70), y(10, t60:t70));
title('Ch9');
xlabel('Time [s]');
ylabel('Trigger [V]');
subplot(2,1,2);
plot(y(1, t60:t70), y(11, t60:t70));
title('Ch10');
xlabel('Time [s]');
ylabel('Trigger [V]');


% ターゲット刺激トリガデータの時間差分データを作る
tdiff= [0, data(11, 2:length(data))-data(11, 1:length(data)-1)];
% ターゲット刺激トリガデータと，時間差分データの特徴を図で確認:  
figure(2); 
plot(data(1,:), data(11,:)); 
figure(2);
hold on;
plot(data(1,:), tdiff, 'r');
hold off; axis([61, 62, -1.2, 1.2]);
xlabel('Time [s]');
legend({'Raw trigger data', 'Trig differential'});


% トリガの立ち上がりの時刻のみ正の値になるので取り出す
ttrig= find(tdiff> 0.8);
% ttrig: target triggers
% 実際にトリガ時刻が選ばれているかプロットして確認:
figure(2);
hold on;
plot(data(1, ttrig), data(11, ttrig), 'go');
hold off;
axis([40, 180, -1.2, 1.2]);

% Ch9のトリガデータから，全ての光刺激に対するトリガを抽出する
adiff= [0, data(10,2:length(data))-data(10,1:length(data)-1)];
% adiffが正の値になる時刻を取り出す
atrig= find(adiff> 0.8);
% atrig: all triggers

% 関数ismemberを使ってatrigの何番目にttrigが含まれているか見つける
flg= ismember(atrig, ttrig);
% ノンターゲット刺激のトリガは，atrigからttrigを除いたものになる
ntrig= atrig(~flg);


% 3.2[5] 加算平均処理とベースライン処理% ターゲット刺激の加算平均
TAR = average_wave(data, ttrig);
% ノンターゲット刺激の加算平均：加算平均回数をターゲット刺激と揃える
randorder= randperm(length(ntrig));
NTAR = average_wave(data, ntrig(randorder(1:length(ttrig))));
% 両方の条件の波形を描画する
Channel = {'Fz','Cz','P3','Pz','P4','PO7','Oz','PO8'};
for ii = 1:8
    figure(3);
    subplot(4,2,ii);
    plot(NTAR(1,:), NTAR(ii+1,:));
    hold on;
    plot(TAR(1,:), TAR(ii+1,:), 'r');
    grid on;
    axis([-0.1, 0.7, -6, 4]);
    xlabel('Time [s]');
    ylabel('EEG [\muV]');
    title(Channel{1,ii});
    hold off;
end
legend({'Nontarget', 'Target'});

function b_averaged= average_wave(data, trigger)
fs = 256;
% サンプリング周波数[Hz]
NCh= 8;
% 脳波のチャンネル数
before_time= 0.1;
% トリガの前から0.1 s = 100msのデータを取る
after_time= 0.7;
% トリガの後は700ms取る
tt= -1*before_time: 1/fs : after_time;
% 加算データの時刻のインデックス
Nave = length(trigger);
% 加算平均回数の指定
bef= round(before_time*fs);
% roundは最も近い整数を返す関数
aft = round(after_time*fs);
% 加算するための変数tmpを定義しておく
tmp= zeros(NCh, length(tt));
% zerosは中味が0の行列を作る関数
% tmpへ生データを切り取って足していき，加算回数で割って平均する
for ii = 1:Nave
    tmp= tmp+ data(2:NCh+1, trigger(ii)-bef:trigger(ii)+aft-1);
end
averaged = tmp/Nave;
b_averaged= averaged -repmat(averaged(:,bef+1), 1, length(averaged));
b_averaged= [tt; b_averaged]; % 時刻のインデックスttを1行目に加える
end