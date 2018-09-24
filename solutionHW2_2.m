%solution to part 2: the L shaped charge distribution:
f1=@(a,b,c,x) (x.^2)./sqrt((a-x).^2 + b.^2 + c.^2);
f2=@(a,b,c,y) y./sqrt(a.^2 + (b-y).^2 + c.^2);
V= @(a,b,c) (integral(@(x)f1(a,b,c,x),0,1) + integral(@(y)f2(a,b,c,y),1,2));
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