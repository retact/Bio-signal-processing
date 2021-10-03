load('../EEG-sample/close.mat','y')
closeEEG=y(:, 256*10+1:length(y));
Ch ={'Fz', 'Cz', 'P3', 'Pz', 'P4', 'PO7','Oz','PO8'};
d1=EEGplot2(closeEEG, Ch, [12, 14], 7, 1);
d2=EEGplot2(closeEEG, Ch, [12, 14], 5, 2);
