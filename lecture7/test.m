[data, fs]=audioread('hosei-retact-a.wav');
figure(1);
plot(data)

N=8000;
x=data(20001:20000+3*N);
fs=8000;
dt=1/fs;
t=dt:dt:(3*N)*dt;
figure(2);
plot(t,x)
set(gca,'FontSize',12,'FontName','Times New Roman')
xlabel('Time (S)','FontSize',14)
ylabel('Normalized Sound Amplitude','FontSize',14)

N=8000; M=3; fs=8000 ; dt=1/fs ;
for m=1:M
figure(10+m)
t=(m-1)*N+1:m*N;
time=t.*dt;
plot(time, x((m-1)*N+1:m*N))
set(gca,'FontSize',12,'FontName','Times New Roman')
xlabel('Time (S)','FontSize',14)
ylabel('Normalized Amplitude','FontSize',14)
end