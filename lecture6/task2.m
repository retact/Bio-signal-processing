%Task2

load P300
data = y(:, 256*10+1:length(y));

tdiff = [0, data(11, 2:length(data))-data(11, 1:length(data)-1)];
ttrig = find(tdiff > 0.8);
adiff = [0, data(10,2:length(data))-data(10, 1:length(data)-1)];
atrig = find(adiff > 0.8);
flg = ismember(atrig, ttrig);
ntrig = atrig(~flg);

TAR = average_wave(data, ttrig);
randorder = randperm(length(ntrig));
NTAR = average_wave(data, ntrig(randorder(1:length(ttrig))));
Channel = {'Fz','Cz','P3','Pz','P4','PO7','Oz','PO8'};

DIFF = [TAR(1,:); TAR(2:9,:)-NTAR(2:9, :)];

for ii = 1:8
    figure(2); 
    subplot(8, 1, ii); 
    plot(DIFF(1,:), DIFF(ii+1,:));
    grid on; 
    axis([-0.1, 0.7, -7, 7]);
    xlabel('Time [s]'); 
    ylabel('EEG [\muV]');
    title(Channel{ii});
end