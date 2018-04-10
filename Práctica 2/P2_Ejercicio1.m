clear all;
close all;
clc;

% Práctica 2
% Ejercicio 1

Ptx=20; % W
Ptx_dBm=10*log10(1000*Ptx); % dBm
Grx=0; % dB
Pn=-113; % dBm
SNR_min=10; % dB
Serx = 0.008; % m^2

Prx_min=SNR_min+Pn;

for y=1:150
    for x=1:301
        paso=0.1;
        
        eje_x(y,x)=(x-151)*paso;
        eje_y(y,x)=y*paso;
        
        angulo(y,x)=atand((x-151)*paso/y*paso);
        
        Gtx=max(13-3*(abs(angulo(y,x))/60).^2,-7);
        
        d=sqrt(eje_x(y,x).^2+eje_y(y,x).^2);
        
        Lp=125+35*log10(d);
        
        Prx=Ptx_dBm+Gtx-Lp+Grx;

        SNR=Prx-Pn;
        
        e=173.2*sqrt(Ptx*Gtx)/d;
        E=20*log10(e);
        
        figure_1(y,x)=E;
        
        if SNR<SNR_min
            SNR=0;
        else 
            SNR=1;
        end
        
        figure_2(y,x)=SNR;
       
    end    
end

figure
contourf(eje_x,eje_y,figure_2); %SNR
colorbar;
title('SNR'),xlabel('Distancia horizontal [Km]'),ylabel('Distancia vertical [Km]');

figure
contourf(eje_x,eje_y,figure_1); %Alcance
title('Zona de cobertura'),xlabel('Distancia horizontal [Km]'),ylabel('Distancia vertical [Km]')
colorbar;

