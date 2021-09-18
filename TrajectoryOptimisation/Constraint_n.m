
function [g,h] = Constraint_n(x,P1,P2,C,Radius)
tol = 0.05;
g=[];
points = discretise(x,P1,P2);

for i=1:size(C,1)
    for j =1:size(points,1)    
        g(end+1,1) = (Radius(i)+tol)-norm(C(i,:)-points(j,:));
    end
end
 h =[];   
    
end
