[data_a, fs_a]=audioread('hosei-retact-a.wav');
figure(1);
plot(data_a)

N=8000;
%20000-50000
x_a=data_a(20001:20000+3*N);
fs_a=8000;
dt=1/fs_a;
t=dt:dt:(3*N)*dt;
figure(2);
plot(t,x_a)
set(gca,'FontSize',12,'FontName','Times New Roman')
xlabel('Time (S)','FontSize',14)
ylabel('Normalized Sound Amplitude','FontSize',14)


[data_o, fs_o]=audioread('hosei-retact-o.wav');
figure(3);
plot(data_o)
N=8000;
%20000-50000

x_o=data_o(20001:20000+3*N);
fs_o=8000;
dt=1/fs_o;
t=dt:dt:(3*N)*dt;
figure(4);
plot(t,x_o)
set(gca,'FontSize',12,'FontName','Times New Roman')
xlabel('Time (S)','FontSize',14)
ylabel('Normalized Sound Amplitude','FontSize',14)