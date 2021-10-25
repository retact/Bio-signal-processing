%% task2
load P300
data = y(:, 256*10+1:length(y));

tdiff= [0, data(11, 2:length(data))-data(11, 1:length(data)-1)];
ttrig= find(tdiff> 0.8);

length(ttrig)

%% task3
adiff= [0, data(10,2:length(data))-data(10,1:length(data)-1)];
atrig= find(adiff> 0.8);

flg= ismember(atrig, ttrig);
ntrig= atrig(~flg);

length(ntrig)