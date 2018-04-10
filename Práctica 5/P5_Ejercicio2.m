clear all;
close all;
clc;

% Práctica 5
% Ejercicio 2
 
f=2.396; % MHz
Pt1=0; Pt2=0; Pt3=0; % dBm
Pn=-100; % dBm

d1=23; % Km
Gtx1=26.5; % dB
Grx1=Gtx1; % dB
 
% Pérdidas
Lfs=92.45+20*log10(d1)+20*log10(f); % dB

S=Pt1+Gtx1+Grx1-Lfs; % dBm

d3=3; % Km 
h3=sqrt(d3^2+d1^2); % Altura
angulo3=atand(d3/d1); % Ángulo con la interferencia

G3=23.5-6*(angulo3-4); % El ángulo es 7,4314
Gtx3=G3; % dB
Grx3=G3; % dB

% Pérdidas
Lfs3=92.45+20*log10(h3)+20*log10(f); % dB

I3=Pt3+Gtx3+Grx3-Lfs3; % dB

j=1;
for d=0:0.05:10
     
    h2=sqrt(d^2+d1^2); % Altura
    angulo=atand(d/d1); % Ángulo de la interferencia
     
    if angulo<=4
        G=26.5-3*((angulo/4)^2);
    elseif (4<angulo) && (angulo<=10)
        G=23.5-6*(angulo-4);
    else angulo>10
        G=max((-(angulo-4)/1.5),-10);
    end
    
    Gtx2=G; % dB
    Grx2=G; % dB
     
    % Pérdidas
    Lfs2=92.45+20*log10(h2)+20*log10(f); % dB
    
    I2=Pt2+Gtx2+Grx2-Lfs2; % dB

    i2=10^(I2/10); % mW
    i3=10^(I3/10); % mW
    s=10^(S/10); % mW
    pn=10^(Pn/10); % mW
    
    I=I2+I3; % dB
    i=i2+i3; % mW
    
    SIR(j)=10*log10(s/i); % dB
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
