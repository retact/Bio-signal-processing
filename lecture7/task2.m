[data, fs]=audioread('hosei-retact-a.wav');
N=8000;
x=data(20001:20000+3*N);

N=8000; M=3; fs=8000 ; dt=1/fs ;
figure(1)
for m=1:M
    subplot(3,1,m); 
    t=(m-1)*N+1:m*N;
    time=t.*dt;
    plot(time, x((m-1)*N+1:m*N))
    set(gca,'FontSize',12,'FontName','Times New Roman')
    xlabel('Time (S)','FontSize',12)
    ylabel('Normalized Amplitude','FontSize',10)
    title(m);
end


[data, fs]=audioread('hosei-retact-o.wav');
N=8000;
x=data(20001:20000+3*N);

N=8000; M=3; fs=8000 ; dt=1/fs ;
figure(2)
for m=1:M
    subplot(3,1,m); 
    t=(m-1)*N+1:m*N;
    time=t.*dt;
    plot(time, x((m-1)*N+1:m*N))
    set(gca,'FontSize',12,'FontName','Times New Roman')
    xlabel('Time (S)','FontSize',12)
    ylabel('Normalized Amplitude','FontSize',10)
    title(m);
end