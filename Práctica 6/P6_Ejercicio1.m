clear all;
close all;
clc;

% Práctica 6
% Ejercicio 1

f=2.4*10^9; % Hz
c=3*10^8;
lambda=c/f;

ht=800; % m
h=975; % m
 
d1=sqrt((5000.^2)+((h-ht).^2)); % Hipotenusa
 
for i=1:100
    for j=1:60
        x(i,j)=i*250; % d=[100:100:25000]
        y(i,j)=j*25; % h=[50:25:1500]
         
        d2(i,j)=sqrt(x(i,j).^2+(h-y(i,j)).^2);
         
        hp=ht+((y(i,j)-ht)/(5000+x(i,j)))*d1;
        heff=975-hp; % Altura eficaz
        v(i,j)=heff.*((2/lambda)*((1/5000)+(1/d2(i,j))))^0.5;
         
        % Pérdidas por difracción
        if v(i,j)>-0.7
            L_difrac(i,j)=6.9+20*log10(sqrt(((v(i,j)-0.1)^2)+1)+v(i,j)-0.1);
        else
            L_difrac(i,j)=0;
        end
    end
end
 
contourf(x,y,L_difrac,30),colorbar,title('Pérdidas por difracción [dB]')
