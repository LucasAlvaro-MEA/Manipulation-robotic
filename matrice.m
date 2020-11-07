clc
clear all
close all
hold on

syms theta1;
theta2=0.1;
theta3=0.1;
theta4=0.1;
theta5=0.1;
theta6=0.1;


%% Matrice definition

%Matrice de passage de 0 à 1
T01=[cos(theta1) -sin(theta1) 0 0;
    sin(theta1) cos(theta1) 0 0;
    0 0 1 15.9;
    0 0 0 1];

%Matrice de passage de 1 à 2
theta2=theta2-1.4576453;

T12=[cos(theta2) -sin(theta2) 0 0;
    sin(theta2) cos(theta2) 0 0;
    0 0 1 0;
    0 0 0 1]*[1 0 0 0;
    0 0 1 0;
    0 -1 0 0;
    0 0 0 1];

%Matrice de passage de 2 à 3
theta3=theta3-0.898549163;
T23 =[cos(theta3) -sin(theta3) 0 26.569;
    sin(theta3) cos(theta3) 0 0;
    0 0 1 0;
    0 0 0 1];

%Matrice de passage de 3 à 4
T34=[1 0 0 30;
    0 0 1 0;
    0 -1 0 0;
    0 0 0 1]*[cos(theta4) -sin(theta4) 0 0;
    sin(theta4) cos(theta4) 0 0;
    0 0 1 25.8;
    0 0 0 1];

%Matrice de passage de 4 à 5
T45=[1 0 0 0;
    0 0 -1 0;
    0 1 0 0;
    0 0 0 1]*[cos(theta5) -sin(theta5) 0 0;
    sin(theta5) cos(theta5) 0 0;
    0 0 1 0;
    0 0 0 1];

%Matrice de passage de 5 à 6
T56=[1 0 0 0;
    0 0 1 0;
    0 -1 0 0;
    0 0 0 1]*[cos(theta6) -sin(theta6) 0 0;
    sin(theta6) cos(theta6) 0 0;
    0 0 1 0;
    0 0 0 1];

%Matrice de passage de 6 a E
T6E=[-1 0 0 0;
    0 -1 0 0;
    0 0 1 12.3;
    0 0 0 1];

%Matrice de passage de E a EP
TEP=[1 0 0 0;
    0 1 0 0;
    0 0 1 11.2;
    0 0 0 1];

%% Display
quiver3(0,0,0,1,0,0,'r');
hold on
quiver3(0,0,0,0,1,0,'g');
hold on
quiver3(0,0,0,0,0,1,'b');
hold on

%%
%


origineN1=dessin(T01);
line([0 origineN1(1)],[0 origineN1(2)],[0 origineN1(3)]);
origineN2=dessin(T01*T12);
line([origineN1(1) origineN2(1)],[origineN1(2) origineN2(2)],[origineN1(3) origineN2(3)]);
origineN3=dessin(T01*T12*T23);
line([origineN2(1) origineN3(1)],[origineN2(2) origineN3(2)],[origineN2(3) origineN3(3)]);
origineN4=dessin(T01*T12*T23*T34);
line([origineN3(1) origineN4(1)],[origineN3(2) origineN4(2)],[origineN3(3) origineN4(3)]);
origineN5=dessin(T01*T12*T23*T34*T45);
line([origineN4(1) origineN5(1)],[origineN4(2) origineN5(2)],[origineN4(3) origineN5(3)]);
origineN6=dessin(T01*T12*T23*T34*T45*T56);
line([origineN5(1) origineN6(1)],[origineN5(2) origineN6(2)],[origineN5(3) origineN6(3)]);
origineNE=dessin(T01*T12*T23*T34*T45*T56*T6E);
line([origineN6(1) origineNE(1)],[origineN6(2) origineNE(2)],[origineN6(3) origineNE(3)]);
%origineNP=dessin(T01*T12*T23*T34*T45*T56*T6E*TEP);
%line([origineNE(1) origineNP(1)],[origineNE(2) origineNP(2)],[origineNE(3) origineNP(3)]);
hold on
qmax=[pi; pi/2; 3*pi/4; pi; pi/2; pi];
vitmax=[3.3;3.3;3.3;3.3;3.2;3.2];

qmin=[-pi; -pi/2; -pi/2; -pi; -pi/2; -pi];
qmax=[pi; pi/2; 3*pi/4; pi; pi/2; pi];
vitmax=[3.3;0.5;3.3;3.3;3.2;3.2];
acclmax=[30;2;30;30;30;30];
Cmax=[44.2;44.2;21.142;21.142;6.3;6.3];
Robot=[qmin qmax vitmax acclmax Cmax];
duree=0;

%t1=zeros(1,2);
%t1=CalculeTrapeze(Robot(1,:),-pi,pi,duree);

t2=CalculeTrapeze(Robot(2,:),-pi/2,-pi+pi/4,duree);

% t3=zeros(1,2);
% t4=zeros(1,2);
% t5=zeros(1,2);
% t6=zeros(1,2);
