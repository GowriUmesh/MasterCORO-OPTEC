clc;
figure(1);
clf;
figure(2);
clf;
rng(35);

x0=[0 0] ; 
lb=[-10 -10]; 
ub=[10 10];


x= [lb(1):0.1:ub(1)];
y= [lb(2):0.1:ub(2)];
[X,Y]= meshgrid(x,y) ; 
f = Myfunc(X,Y) ;
figure(1);
meshc(X,Y,f) ; 
figure(2);
contourf(X,Y,f);
hold on;

x =x0;
xbest=x;
FX=feval2(x);
Fbest=FX;

T=500;
Frozen_temp = 0.0001;
max_iter = 2500;
a = 0.99; 
y=[0,0];

figure(2);
hold on;

while T>Frozen_temp
    for iter=1:max_iter  
        y= close(x,lb,ub);
        FY=feval2(y);
        delta = FY-FX;
        if delta < 0
            x=y;
            if (FY<Fbest)
                xbest=y; Fbest=FY;
                plot(xbest(1),xbest(2),'r+')
                drawnow;
            end       
        else
            if rand < exp(-delta/T)
                x = y;
            end
        end     
    end
    T=T*a;
end
disp(xbest);
disp(feval2(xbest));
figure(2);
plot(xbest(1),xbest(2),'g+')
            
function f= Myfunc(X,Y)
f= -abs(sin(X).*cos(Y).*exp(abs(1 - sqrt(X.^2 + Y.^2)/pi)));
end