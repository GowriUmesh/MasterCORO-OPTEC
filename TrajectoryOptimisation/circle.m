
function h = circle(C,R)
hold on
th = 0:pi/50:2*pi;
xunit = R * cos(th) + C(1);
yunit = R * sin(th) + C(2);
h = plot(xunit, yunit);
hold off
end