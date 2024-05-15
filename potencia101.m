function potencia101
#definición de cosas
  tolerancia = 1e-3;
  itmax = 100;
  it = 0;
  estado = 0;
#datos del problema
##  L = 100;
##  T = 10000;
##  m = 0.8;
##  dr = L/6;
##  M = m*eye(5);
##  J = [4/3,-4/3,0,0,0
##      -3/4,2,-5/4,0,0
##      0,-5/6,2,-7/6,0
##      0,0,-7/8,2,-9/8
##      0,0,0,-1.1583,2.1583];
##  K =(T/dr^2)*J;
  A = [10,-5,0,0
       -5,20,-5,0
       0,-5,20,-5
       0,0,-5,10];
#reacomodando la ecuación (K-w^2*M)z=0
#para que se asemeje a la ecuación de autovalores y autovectores
##  A = inv(M)*K;
#proponemos un y semilla (columna)
  y = [-1;2;2;-1];
#proponemos un r inicial = 0
  r = 0;
  while estado == 0
    x = y/norm(y,inf);
#lo q cambia entre potencia y potinversa es que aca multiplica por A o inv(A)
    #yN = A*x; #normal
    yN = inv(A)*x; #inversa
    alfaN = yN./x;
    rN=dot(yN,x)/dot(x,x);
    error = abs(rN-r);
    if error < tolerancia
      estado = 22;
    endif
    it = it + 1;
    if it > itmax
      estado = 33;
    endif
#actualizacion de variables
    y = yN;
    r = rN;
  endwhile
  w = 1/max(alfaN)   #inversa
  #w = max(alfaN)      #normal
  z = yN./max(yN)     #autovector
  it
  endfunction
