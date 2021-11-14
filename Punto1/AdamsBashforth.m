
% Adams-Bashforth de 3 pasos
N= 2;
y = @(t,y) [9*y(1)+24*y(2)+5*cos(t)-1/3*sin(t); -24*y(1)-51*y(2)-9*cos(t)+1/3*sin(t)];
yexact = @(t) [2*exp(-3*t)-exp(-39*t)+1/3*cos(t); -exp(-3*t)+2*exp(-39*t)-1/3*cos(t)];
y1exact =  @(t) 2*exp(-3*t)-exp(-39*t)+1/3*cos(t)
y2exact = @(t) -exp(-3*t)+2*exp(-39*t)-1/3*cos(t);

a = 0;
b = 1;
y10 = 4/3;
y20 = 2/3;
y0 = [y10; y20];
hf = @(j) 2.^(-j);
h = hf(2);

T = (a:h:b)';
n = size(T,1);
Y=zeros(n,N);
Y(1,:) = y0;
Y(2,:) = y0; %cambiar
Y(2,:) = y0; %cambiar

for j=3:n-1
    Y(j+1,:)=Y(j,:)+h*((5/12)*y(T(j-2),Y(j-2,:))' - (4/3)*y(T(j-1),Y(j-1,:))' + (23/12)*y(T(j),Y(j,:))');
end

Y1exact = y1exact(T);
Y2exact = y2exact(T)

Yexact = [Y1exact Y2exact];


plot(T', Y(:,1))
hold on
plot(T', Y1exact)
legend('Solución aproximada','Solución exacta')
title("Aproximación de y1(t)" )


plot(T', Y(:,2))
hold on
plot(T', Y2exact)
legend('Solución aproximada','Solución exacta')
title("Aproximación de y2(t)" )
