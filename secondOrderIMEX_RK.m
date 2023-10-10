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

%1)IMEX-H(2,2,2) 
tA = [0 0;
      1 0];
tb = [1/2; 1/2];

A = [1/2 0;
     0   1/2];

b = tb;

%2) IMEX-SSP2(2,2,2)

g = 1-1/sqrt(2);

tA = [0 0;
      1 0];

tb = [1/2; 1/2];

A = [d 0;
     1-2*d   d];

b = tb;

%2) IMEX-SA(2,2,2)

g = 1-1/sqrt(2);

tA = [0 0;
      c 0];

tb = [1-g; g];

A = [d 0;
     1-d   d];

b = tb;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Type II IMEX-RK methods, matrix A of the implicit part is not invertible


