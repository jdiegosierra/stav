clear all;
close all;
clc;

% Práctica 2
% Ejercicio 2

Ptx=2000; % W
Ptx_dBm=10*log10(1000*Ptx); % dBm
Grx=12; % dB
Pn=-98; % dBm
SNR_min=20; % dB

Prx_min=SNR_min+Pn;

for y=3:100
    for x=1:201
        paso=1;
        
        eje_x(y,x)=y*paso;
        eje_y(y,x)=(x-101)*paso;
        
        angulo(y,x)=atand((x-151)*paso/y*paso);
        Gtx=max(13-3*(abs(angulo(y,x))/60).^2,-7);
        d=sqrt(eje_x(y,x).^2+eje_y(y,x).^2);
        
        if(d<=70)
            Lp=100+30*log10(d);
        else
            Lp=100+30*log10(d)+(d-70);
        end
        
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
