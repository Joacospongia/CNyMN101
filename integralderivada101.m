function integralderivada101
  vx = [0.3;0.5;0.7;0.9;1.1];
  vy = [65.88;79.38;83.7;85.86;87.48];
  vx2 = [0.3;0.7;1.1]; #para el doble del paso
  vy2 = [65.88;83.7;87.48];
  dx = vx(2)-vx(1);
  dx2 = vx2(2)-vx2(1);
  dy = deri(vy,dx);
  I1 = ITC(vy,dx);
  I2 = ITC(vy2,dx2);
  I3 = rich(I1,I2,dx,dx2,2);
  I4 = ISC(vy,dx);
endfunction
function I = ISC(vector,paso)
  m= length(vector);
  w = ones(m,1);
  w(1) = 1/3;
  for i = 2:2:m-1
    w(i)=4/3; #para los i impares
  endfor
  for i = 3:2:m-2
    w(i)=2/3; #para los i pares
  endfor
  w(m) = 1/3;
  I = 0;
  for i = 1 : m
    I = I + paso*w(i)*vector(i);
  endfor
  endfunction
function I = rich(I1,I2,dx1,dx2,n) #n:menor orden de error
  b = (dx1/dx2)^n;
  I = (b*I2-I1)/(b-1);
  endfunction
function I = ITC(vector,paso)
  m = length(vector);
  w = ones(m,1); #vector m filas 1  columna
  w(1) = 1/2;
  w(m) = 1/2; #establecemos la primer y ultima posicion del vector w
  I = 0;
  for i = 1 : m
    I = I + paso*w(i)*vector(i);
  endfor
  endfunction
function dy=deri(vector,paso)
  m = length(vector);
  dy(1)=-3/(2*paso)*vector(1)+2/paso*vector(2)-1/(2*paso)*vector(3);
  for i = 2 : m-1
    dy(i)=(vector(i+1)-vector(i-1))/(2*paso);
  endfor
   dy(m)=3/(2*paso)*vector(m)-2/paso*vector(m-1)+1/(2*paso)*vector(m-2);
  endfunction
