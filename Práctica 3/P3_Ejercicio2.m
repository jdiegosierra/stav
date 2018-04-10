close all;
clear all;
clc;

% Práctica 3
% Ejercicio 2

Ptx=0.01; % W
% Ptx=0.1; % W
% Ptx=1; % W
Ptx_dBm=10*log10(Ptx*1000); % dBm

Gtx=10; % dB
Grx=9; % dB
Lc1=2; % dB
Lc2=1.6; % dB
E_tx=0.85; % 85%
E_rx=0.8; % 80%
f=0.750; % GHz

Pn=-100; %dBm
SNR_min=12; % dB
M=5; % dB

L_tx=Lc1+10*log10(1/E_tx);
L_rx=Lc2+10*log10(1/E_rx);

d=(1:200);
Lp=92.45+20*log10(f)+20*log10(d);

Prx=zeros(1,200);

% Prx
for i=1:200
    Prx(i)=Ptx_dBm+Gtx+Grx-Lp(i)-L_tx+-L_rx;
    SNR=Prx(i)-Pn;
    
        if SNR>SNR_min+5
               plot(i,0,'*');
               hold on;
        else
               plot(i,0,'r'),title(sprintf('Distancia de cobertura del sistema para Ptx=%g',Ptx))
               xlabel('Distancia [Km]')
    end
end

figure
plot(Prx); 
hold on
plot(d,SNR_min+Pn+M, ':r')
title(sprintf('Prx en función de la distancia entre Tx y Rx para Ptx=%g',Ptx))
xlabel('Distancia [Km]'),ylabel('Prx [dBm]');
