close all;
clear all;
clc;
xlim([0 10]);   
ylim([0 10]);
grid on;
hold on;

P1=[1,9];
P2=[9,1];


C=[5,5];
Radius = 2.5;
viscircles(C,Radius,'color','k');
hold on;
plot(P1(1),P1(2),'.');
text(P1(1)-0.3,P1(2),'A')
plot(P2(1),P2(2),'.');
text(P2(1)+0.1,P2(2),'B')
title('1 circle and 2 Intermediate Point')
hold on;

x0=[5,8;8,5];
lb=[0,0;0,0];
ub=[10,10;10,10];

options = optimset('Display','Iter','Tolx',1.e-6,'TolFun',1.e-6,'MaxIter',1000,'MaxFunEval',300);
x=fmincon(@(x)objective(x,P1,P2),x0,[],[],[],[],lb,ub,@(x)Constraint_n(x,P1,P2,C,Radius),options);
disp(x);

path = [P1;x;P2];
initial_path = [P1;x0;P2];
for i=1:size(path,1)-1
a=plot([path(i,1) path(i+1,1)],[path(i,2) path(i+1,2)],'Color',[0 0.4470 0.7410]);
plot(path(i,1),path(i,2),'x','Color',[0 0.4470 0.7410]);
b=plot([initial_path(i,1) initial_path(i+1,1)],[initial_path(i,2) initial_path(i+1,2)],'-.r');
plot(initial_path(i,1),initial_path(i,2),'xr');
legend([a,b],'optimal','non optimal')
hold on;
end
figure(1);

