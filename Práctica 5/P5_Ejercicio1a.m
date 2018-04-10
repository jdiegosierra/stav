clear all;
close all;
clc;

% Práctica 5
% Ejercicio 1
 
f=2.395; % MHz
Pt1=0; Pt2=0; % dBm
Pn=-102; % dBm

d1=23; % Km
Gtx1=27; % dB
Grx1=Gtx1;
 
%Pérdidas propagación señal
Lfs=92.45+20*log10(d1)+20*log10(f); %[dB]

S=Pt1+Gtx1+Grx1-Lfs; % dBm

j=1;
for d=0:0.05:10
   
    h=sqrt(d^2+d1^2); % Altura
    angulo=atand(d/d1); % Ángulo con la interferencia
     
    if angulo <= 8.1
        G=27-3*((angulo/3.6)^3);
    else
        G=max((-8-10*log10(angulo-8)),-15);
    end
    Gtx2=G; % dB
    Grx2=G; % dB
     
    % Pérdidas
    Lfs2=92.45+20*log10(h)+20*log10(f); % dB
    
    I=Pt2+Gtx2+Grx2-Lfs2; % dB
 
    i=10^(I/10);    %[mW]
    s=10^(S/10);    %[mW]
    pn=10^(Pn/10);  %[mW]
     
    SIR(j)=S-I; % dB
    SINR(j)=10*log10(s/(i+pn)); % dB
    
    j=j+1;
     
end

dd=[0:0.05:10];

plot(dd,SIR)
xlabel('Distancia entre antenas [Km]')
ylabel('SIR [dB]')
    
figure
plot(dd,SINR)
xlabel('Distancia entre antenas [Km]')
ylabel('SINR [dB]')
