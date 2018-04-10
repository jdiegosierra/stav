close all;
clear all;
clc;

% Práctica 3
% Ejercicio 1

Ptx=90; % dBm
% Ptx=92.5; % dBm
% Ptx=95; % dBm

f=2950; % MHz
Pn=-113; % dB
SNR_min=16; % dB

for x=1:1:350 % Km
    for y=0.1:0.1:25; % Km
        
        d=sqrt(x^2+y^2); % Km
        angulo=atand(y/x);
        
        if angulo<=6
            G=33-12*((angulo-3)/6).^2; % dB
        else
            G=10.4+10*log10(cscd(angulo).^2); % dB
        end
        
        sigma_ref=0.0001; % m2
%         sigma_ref=0.01; % m2
%         sigma_ref=5+normrnd(0,0.3); % m2
%         sigma_ref=5+normrnd(0,2); % m2
        
        H_target=y*1000; % Km
        LOS=18+(3.6*sqrt(H_target)); % Km
        H_min=((d-18)/3.6)^2; % m
        
        if H_target<H_min/1000
            X=4*(d-LOS); % dB
        else
            X=0; % dB
        end
        
        Lp=103.4+40*log10(d)+20*log10(f); % dB
        Prx=Ptx+2*G+10*log10(sigma_ref)-Lp-X; % dBm
        SNR=Prx-Pn; % dBm
        
        if SNR>SNR_min
            plot(x,y,'b*');
            hold on
        end
         
    end    
end
ylabel('Altura [Km]'),xlabel('Distancia [Km]')
title(sprintf('Zona de cobertura con Ptx=%g dBm y Sigma=%g m2',Ptx,sigma_ref))
