[data, fs]=audioread('hosei-retact-a.wav');
x=data(20001:20000+3*N);
fs=8000;
dt=1/fs;
t=dt:dt:(3*N)*dt;

N=8000;
M=3;
df=1/(N*dt);
f=df:df:2000*df;
P=zeros(2001,1);
for m=1:M
X=complex(zeros(2001,1),zeros(2001,1));
    for k=1:2001
        for n= (m-1)*N+1:m*N
            X(k)=X(k)+x(n)*exp(-sqrt(-1)*2*pi*(n-1)*(k-1)/N);
        end
        X(k)=X(k)*dt;
    end
figure(2*m-1)
X0=X.*conj(X)/(N*dt);
plot(f,X0(2:2001))
set(gca,'FontSize',12,'FontName','Times New Roman')
xlabel('Frequency (Hz)','FontSize',14)
ylabel('Fourier Power ( \muV^2/Hz)','FontSize',14)
figure(2*m)
X0=X.*conj(X)/(N*dt);
semilogy(f,X0(2:2001))
set(gca,'FontSize',12,'FontName','Times New Roman')
xlabel('Frequency (Hz)','FontSize',14)
ylabel('Periodogram ( \muV^2/Hz)','FontSize',14)
P=P+X.*conj(X)/(N*dt);
end

P=P/M;
figure(30)
plot(f,P(2:2001))
set(gca,'FontSize',12,'FontName','Times New Roman')
xlabel('Frequency (Hz)','FontSize',14)
ylabel('Fourier Power ( \muV^2/Hz)','FontSize',14)
figure(31)
semilogy(f,P(2:2001))
set(gca,'FontSize',12,'FontName','Times New Roman')
xlabel('Frequency (Hz)','FontSize',14)
ylabel('Power Spectrum ( \muV^2/Hz)','FontSize',14)
[amax imax]=max(P(1:200))

t=dt:dt:800*dt;
figure(50);plot(t, x(16001:16000+800))
set(gca,'FontSize',12,'FontName','Times New Roman')
xlabel('Time (S)','FontSize',14)
ylabel('Normalized Amplitude ','FontSize',14)