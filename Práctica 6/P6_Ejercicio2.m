clear all;
close all;
clc;

% Práctica 6
% Ejercicio 2

B=25*10^-3; % MHz
NF=5; % dB
SNRmin=16; % dB
p1=0.94; % 94% tiempo -> Ray
p2=0.97; % 97% ubicaciones -> Shad
sigma=8; % dB
ptx=10; % W
Ptx=10*log10(ptx*1000); % dBm
Gtx=11; % dBi
Grx=1.5; % dB

Pn=-114+10*log10(B)+NF;      

Mray1=10*log10(0.8/(log(1/p1)));
X1=qfuncinv(1-p2);
Mshadowing1=X1*sigma;

SNR_aux=Ptx+Gtx+Grx-Pn-Mray1-Mshadowing1;

figure
  
hold on;
for d1=-15:0.5:15
    for d2=-15:0.5:15
        d = sqrt((d1^2)+(d2^2));
        SNR=SNR_aux-(117+35.5*log10(d));

        if SNR>SNRmin
            plot(d1,d2,'g*');
        else
            plot(d1,d2,'rx');
        end
    end
end

xlabel('Eje X [Km]')
ylabel('Eje Y [Km]')
title ('SNR en función de la distancia entre la estación base y el usuario')
hold off;
 
% Radio de trabajo 
Prx=SNRmin+Pn;
Prxn1=Prx+Mray1+Mshadowing1;
Lp1=Ptx+Grx+Gtx-Prxn1;

radio1=10^((Lp1-117)/35.5) % Km

% ------------------------ Apartado b -------------------------------------
p1=0.95; % 95% tiempo -> Ray
p2=0.99; % 99% ubicaciones -> Shad

Mray2=10*log10(0.8/(log(1/p1)));
X2=qfuncinv(1-p2);
Mshadowing2=X2*sigma;
  
% Radio de trabajo
Prxn2=Prx+Mray2+Mshadowing2;
Lp2=Ptx+Grx+Gtx-Prxn2;

radio2=10^((Lp2-117)/35.5) % Km
 