% task1
N=8000;
M=3;
df=1/(N*dt);
f=df:df:2000*df;
P=zeros(2001,1);

for i=1:2
    if i==1
       [data, fs]=audioread('hosei-retact-a.wav');
    elseif i==2
       [data, fs]=audioread('hosei-retact-o.wav');
    end
    x=data(20001:20000+3*N);
    figure(i)
    for m=1:M
    X=complex(zeros(2001,1),zeros(2001,1));
        for k=1:2001
            for n= (m-1)*N+1:m*N
                X(k)=X(k)+x(n)*exp(-sqrt(-1)*2*pi*(n-1)*(k-1)/N);
            end
            X(k)=X(k)*dt;
        end
    subplot(5,2,2*m-1); 
    X0=X.*conj(X)/(N*dt);
    plot(f,X0(2:2001))
    set(gca,'FontSize',12,'FontName','Times New Roman')
    xlabel('Frequency (Hz)','FontSize',12)
    ylabel('Fourier Power ( \muV^2/Hz)','FontSize',12)
    subplot(5,2,2*m); 
    X0=X.*conj(X)/(N*dt);
    semilogy(f,X0(2:2001))
    set(gca,'FontSize',12,'FontName','Times New Roman')
    xlabel('Frequency (Hz)','FontSize',12)
    ylabel('Periodogram ( \muV^2/Hz)','FontSize',12)
    P=P+X.*conj(X)/(N*dt);
    end

    P=P/M;
    subplot(5,2,7);
    plot(f,P(2:2001))
    set(gca,'FontSize',12,'FontName','Times New Roman')
    xlabel('Frequency (Hz)','FontSize',12)
    ylabel('Fourier Power ( \muV^2/Hz)','FontSize',12)
    subplot(5,2,8);
    semilogy(f,P(2:2001))
    set(gca,'FontSize',12,'FontName','Times New Roman')
    xlabel('Frequency (Hz)','FontSize',12)
    ylabel('Power Spectrum ( \muV^2/Hz)','FontSize',12)

    % task2
    [amax imax]=max(P(1:200))
    
    % task3
    t=dt:dt:800*dt;
    subplot(5,2,[9,10]);
    plot(t, x(16001:16000+800))
    set(gca,'FontSize',12,'FontName','Times New Roman')
    xlabel('Time (S)','FontSize',12)
    ylabel('Normalized Amplitude ','FontSize',12)
end
