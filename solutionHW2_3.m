f = @(a,b,c,x,y) x./sqrt((a-x).^2 +(b-y).^2 +c.^2);
V = @(a,b,c) integral2(@(x,y) f(a,b,c,x,y),-2,2,@(x) -sqrt(4-x.^2),@(x) sqrt(4-x.^2));
a=[-5:1:5];
b=[-5:1:5]';
for i = [1:11]
    for j = [1:11]
        Pot(i,j)=V(b(j),a(i),0);
    end
end

figure
surf(a,b,Pot)

[Ex,Ey]=gradient(-Pot);
figure
contour(a,b,Pot)
hold on
quiver(a,b,Ex,Ey)
hold off