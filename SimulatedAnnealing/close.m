function [y] = close(x, lb, ub)
delta=(ub-lb)/10;
LB(1)= max(x(1)-delta(1), lb(1));
UB(1)= min(x(1)+delta(1), ub(1)); 
LB(2)= max(x(2)-delta(2), lb(2));
UB(2)= min(x(2)+delta(2), ub(2)); 
y(1)=LB(1)+ (UB(1)-LB(1))*rand; 
y(2)= LB(2)+ (UB(2)-LB(2))*rand; 
end