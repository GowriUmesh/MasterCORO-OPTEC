function points = discretise(x,P1,P2)
T=[P1;x;P2];
N=20;
points=[];
for i=1:size(T,1)-1
    points1(:,1) = linspace(T(i,1),T(i+1,1),N);
    points1(:,2) = linspace(T(i,2),T(i+1,2),N);
    points = [points;points1];
end
% disp(points);
end
