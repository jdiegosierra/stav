clear all;
close all;
clc;

% Práctica 4
% Ejercicio 2

Pire=300000; % mW
Pire_dB=10*log10(Pire); % dBm
Pn=-114; % dBm
Pn_mw=10^(Pn/10); % mW
SINR_min=11.5; % dB

d=5; % Km
x=[-d:0.1:d];
y=[-d:0.1:d];

% sigma=0;
% sigma=2;
% sigma=4;
sigma=6;

G=0; % dB

for i=1:length(x)
    for j=1:length(y)
         
        d1=sqrt((x(i).^2)+(y(j).^2));
        d2=sqrt(((d-x(i)).^2)+(y(j).^2));
         
        Lp1=125+35*log10(d1)+normrnd(0,sigma);
        Lp2=125+35*log10(d2)+normrnd(0,sigma);
       
        I=Pire_dB+G-Lp2;
        
        Prx=Pire_dB-Lp1+G; % dBm
        I_mw=10^(I/10); % mW
        Prx_mw=10^(Prx/10); % mW
        
        SINR(i,j)=10*log10(Prx_mw/(Pn_mw+I_mw));
        
        if SINR(i,j)>=SINR_min
            plot(x(i),y(j),'+');
            hold on
            title(sprintf('Contorno de cobertura con sigma=%g',sigma));
            xlabel('Distancia horizontal [Km]'),ylabel('Distancia vertical [Km]')
        end
        
    end
end
