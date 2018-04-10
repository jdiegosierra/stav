clear all;
close all;
clc;

% Práctica 4
% Ejercicio 1

Pire=10000000; % mW
Pire_dB=10*log10(Pire); % dBm
Pn=-98; % dBm
Pn_mw=10^(Pn/10); % mW
SINR_min=25; % dB

d=30; % Km
% d=40; % Km
% d=50; % Km
% d=60; % Km
% d=70; % Km
x=[-d:0.2:d];
y=[-d:0.2:d];

G_max=11; % dB

for i=1:length(x)
    for j=1:length(y)
         
        d1=sqrt((x(i).^2)+(y(j).^2));
        d2=sqrt(((d-x(i)).^2)+(y(j).^2));
         
        Lp1=95+30*log10(d1);
        Lp2=95+30*log10(d2);
        
        alfa=atand(x(i)/y(j));
        beta=atand((d-x(i))/y(j));
        theta=alfa+beta;
      
        G=max(11-12*abs(theta/75)^2,-5);
        S=Pire_dB+G_max-Lp1;
        I=Pire_dB+G-Lp2;
        
        Prx=Pire_dB-Lp1+G_max; % dBm
        I_mw=10^(I/10); % mW
        Prx_mw=10^(Prx/10); % mW
        
        SINR(i,j)=10*log10(Prx_mw/(Pn_mw+I_mw));
        SNR(i,j)=S-Pn;
        
        if SINR(i,j)>=SINR_min
            plot(x(i),y(j),'+');
            hold on
            title(sprintf('Contorno de cobertura con d=%g [Km]',d));
            xlabel('Distancia horizontal [Km]'),ylabel('Distancia vertical [Km]')
        end
        
    end
end
            
figure
contourf(x,y,SNR'),colorbar,title(sprintf('SNR con d=%g [Km]',d));

figure
contourf(x,y,SINR'),colorbar,title(sprintf('SINR con d=%g [Km]',d));
