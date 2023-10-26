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

case 1 %IMEX-H(2,2,2) 
tA = [0 0;
      1 0];
tb = [1/2; 1/2];

A = [1/2 0;
     0   1/2];

b = tb;

case 2 %IMEX-SSP2(2,2,2)

g = 1-1/sqrt(2);

tA = [0 0;
      1 0];

tb = [1/2; 1/2];

A = [d 0;
     1-2*d   d];

b = tb;

case 3  %IMEX-SA(2,2,2)

g = 1-1/sqrt(2);

tA = [0 0;
      c 0];

tb = [1-g; g];

A = [d 0;
     1-d   d];

b = tb;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Type II IMEX-RK methods, matrix A of the implicit part is not invertible
case 4  %H-T(2,2,2)
disp('This scheme is A-Stable but not L-Stable, not suitable for strong stiff problem, see book')
tA = [0 0;
      1 0];

tb = [1/2; 1/2];

A = [0 0;
     1/2   1/2];

b = tb;

end

