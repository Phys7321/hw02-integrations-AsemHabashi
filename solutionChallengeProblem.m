m=1;
f=@(x,a) 2.*sqrt(2.*m)./sqrt((a.^4)-(x.^4));
a=[0:0.1:4];
for i =[1:41]
    T(i)=integral(@(x) f(x,a(i)),0,a(i));
end;
plot(a,T)