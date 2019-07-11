clear all
close all
clc

x=0:0.01:2*pi;
sinx=sin(x);
cosx=cos(x);

% plot(sinx,cosx);grid on

Trans=[1 4;
       4 8];
   
%% [1 4               [sinx      sinx+4cosx         
%%  4 8] Õâ¸ö¾ØÕó³Ë     cosx]  =  4sinx+8cosx

plot((sinx+4*cosx),4*sinx+cosx);grid on
hold on

[eigenvector,eigenvalue]=eig(Trans)
x1=-0.9106;y1=0.4132;
x2=0.4132; y2=0.9106;

Trans*[-0.9106;0.4132];
[sigularvector,sigularvalue]=svd(Trans)

   

