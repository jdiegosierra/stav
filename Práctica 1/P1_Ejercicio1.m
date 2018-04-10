clear all;
close all;
clc;

% Práctica 1
% Ejercicio 1

pire_kw1=1;
pire_kw2=5;
pire_kw3=10;
pire_kw4=15;
pire_kw5=20;

d=linspace(0.1,50,1000);

% Campo eléctrico
e1=173.2*sqrt(pire_kw1)./d;
e2=173.2*sqrt(pire_kw2)./d;
e3=173.2*sqrt(pire_kw3)./d;
e4=173.2*sqrt(pire_kw4)./d;
e5=173.2*sqrt(pire_kw5)./d;

figure
hold on
plot(e1),ylabel('e[mV/m]'),xlabel('d[Km]')
plot(e2),ylabel('e[mV/m]'),xlabel('d[Km]')
plot(e3),ylabel('e[mV/m]'),xlabel('d[Km]')
plot(e4),ylabel('e[mV/m]'),xlabel('d[Km]')
plot(e5),ylabel('e[mV/m]'),xlabel('d[Km]')
legend('e(pire=1 KW)','e(pire=5 KW)','e(pire=10 KW)','e(pire=15 KW)','e(pire=20 KW)');
hold off

e=12.5;

% Radio de trabajo
radio1=173.2*sqrt(pire_kw1)./e;
radio2=173.2*sqrt(pire_kw2)./e;
radio3=173.2*sqrt(pire_kw3)./e;
radio4=173.2*sqrt(pire_kw4)./e;
radio5=173.2*sqrt(pire_kw5)./e;

radio=[radio1 radio2 radio3 radio4 radio5];

figure
plot(radio,'bx','markersize',12)
xlabel('pire[KW]'),ylabel('Radio[Km]')
