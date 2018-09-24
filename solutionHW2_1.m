% 1/4*pi*epsilon =1 
f = @(a,b,c,x) 2.*x./sqrt((a-x).^2 +b.^2 +c.^2);
V = @(a,b,c) integral(@(x) f(a,b,c,x),0,1);
% initializing grid in xy plane where the potential will be showed
a=[-5:1:5];
b=[-5:1:5]';
for i = [1:11]
    for j = [1:11]
        Pot(i,j)=V(b(j),a(i),0);
    end
end

figure
surf(a,b,Pot)
% this plots the potential on the z axis vs the xy plane, the potential will be the same
% in any other plane passing through the x axis will exhibit the same
% structure as the charge distribution is symmetric around the x axis

[Ex,Ey]=gradient(-Pot);
figure
contour(a,b,Pot)
hold on
quiver(b,a,Ex,Ey)
hold off

%this plots the contour of the potential field in the xy plane and plots
%the Electric field in the xy plane also. 