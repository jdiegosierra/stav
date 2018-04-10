clear all;
close all;
clc;

% Práctica 1
% Ejercicio 2

pire_w1=0.001;
pire_w2=0.01;
pire_w3=0.1;
pire_w4=1;

d=linspace(0.1,50,1000);

g_db=10;
g=10.^(g_db/10);

% Campo eléctrico
e1=173.2*sqrt(pire_w1*g)./d;
e2=173.2*sqrt(pire_w2*g)./d;
e3=173.2*sqrt(pire_w3*g)./d;
e4=173.2*sqrt(pire_w4*g)./d;

figure
hold on
plot(e1),xlabel('d[Km]'),ylabel('e[mV/m]')
plot(e2),xlabel('d[Km]'),ylabel('e[mV/m]')
plot(e3),xlabel('d[Km]'),ylabel('e[mV/m]')
plot(e4),xlabel('d[Km]'),ylabel('e[mV/m]')
legend('e(prx=0.001 W)','e(prx=0.01 W)','e(prx=0.1 W)','e(prx=1 W)');
hold off

seq=0.25;

d_metros=linspace(100,50000,1000);

% Potencia recibida
pr1=pire_w1*g*seq./(4*pi*d_metros.^2);
pr2=pire_w2*g*seq./(4*pi*d_metros.^2);
pr3=pire_w3*g*seq./(4*pi*d_metros.^2);
pr4=pire_w4*g*seq./(4*pi*d_metros.^2);

pr1_db=10*log10(pr1*1000);
pr2_db=10*log10(pr2*1000);
pr3_db=10*log10(pr3*1000);
pr4_db=10*log10(pr4*1000);


figure
hold on
plot(pr1_db),xlabel('prx[dBm]'),ylabel('d[m]')
plot(pr2_db),xlabel('prx[dBm]'),ylabel('d[m]')
plot(pr3_db),xlabel('prx[dBm]'),ylabel('d[m]')
plot(pr4_db),xlabel('prx[dBm]'),ylabel('d[m]')
legend('prx(ptx=0.001 W)','prx(ptx=0.01 W)','prx(ptx=0.1 W)','prx(ptx=1 W)');
hold off

N_dbm=-100;

% SNR
SNR1=pr1_db-N_dbm;
SNR2=pr2_db-N_dbm;
SNR3=pr3_db-N_dbm;
SNR4=pr4_db-N_dbm;


figure
hold on
plot(SNR1),xlabel('pr[dBm]'),ylabel('[dB]'),title('SNR')
plot(SNR2),xlabel('pr[dBm]'),ylabel('[dB]'),title('SNR')
plot(SNR3),xlabel('pr[dBm]'),ylabel('[dB]'),title('SNR')
plot(SNR4),xlabel('pr[dBm]'),ylabel('[dB]'),title('SNR')
legend('SNR(ptx=0.001 W)','SNR(ptx=0.01 W)','SNR(ptx=0.1 W)','SNR(ptx=1 W)');
hold off
