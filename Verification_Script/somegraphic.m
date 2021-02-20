clear all
x=linspace(-2*pi,2*pi,1000);
y=cos(x);

plot(x,y)
xlabel('angle')
ylabel('cos')
title('cos','FontSize',12)
xticks(-2*pi:pi/2:2*pi)
xticklabels({'-2\pi','-1.5\pi','-\pi','-0.5\pi','0','0.5\pi','\pi','1.5\pi','2\pi'})