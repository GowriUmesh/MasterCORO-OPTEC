function f = objective(x,P1,P2)
points = discretise(x,P1,P2);
f=0;
for i=1:size(points,1)-1
f=f+norm(points(i,:)-points(i+1,:));
end
end