% second order IMEX RK methods: 
% Explicit part (tA, tb), explicit matrix tA and explicit weights vector;
% here the vector of nodes is tc = \tA*e, with e unit vector 

% Implicit part (A, b), implicit matrix A and implicit weights 
% here the vector of notes is c = \tA*e, with e unit vector
% 
%GSA means Globally Stiffly Accurate

%SA  means Stiffly Accurate

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Type I IMEX-RK methods, matrix A of the implicit part invertible

%2-stages IMEX-RK methods

function [tA,A,tb,b] = IMEX_RK_2(scheme)

switch scheme

case 1 

disp('IMEX-H(2,2,2)') 

tA = [0 0;
      1 0];
tb = [1/2; 1/2];

A = [1/2 0;
     0   1/2];

b = tb;

case 2 

disp('IMEX-SSP2(2,2,2)')

g = 1-1/sqrt(2);

tA = [0 0;
      1 0];

tb = [1/2; 1/2];

A = [d 0;
     1-2*d   d];

b = tb;

case 3  

disp('IMEX-SA(2,2,2)')

g = 1-1/sqrt(2);

tA = [0 0;
      c 0];

tb = [1-g; g];

A = [d 0;
     1-d   d];

b = tb;

case 4 

disp('IMEX-SSP2(3,3,2)')

tA = [0    0  0;
      1/2 1/2 0];

tb = [1/3; 1/3; 1/3];

A = [1/4 0   0;
     0   1/4 0;
     1/3 1/3 1/3];

b = tb;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Type II IMEX-RK methods, matrix A of the implicit part is not invertible
case 5 

disp('H-T(2,2,2). This scheme is A-Stable but not L-Stable, not suitable for strong stiff problem, see book')

tA = [0 0;
      1 0];

tb = [1/2; 1/2];

A = [0 0;
     1/2   1/2];

b = tb;

case 6 

disp('ARS(2,2,2)')

g = 1-1/sqrt(2);
d = 1-1/(2*g);

tA = [0  0  0;
      g  0  0;
      d 1-d 0];

tb = [d; 1-d; 0];

A = [0 0   0;
     0 g   0;
     0 1-g g;];

b = [0; 1-g; g];

case 7 

disp('ARS(2,3,2)')

g = 1-1/sqrt(2);
d = -2*sqrt(3)/3;

tA = [0  0  0;
      g  0  0;
      d 1-d 0];

tb = [0; 1-g; g];

A = [0 0   0;
     0 g   0;
     0 1-g g;];

b = bt;

end

