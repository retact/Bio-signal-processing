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