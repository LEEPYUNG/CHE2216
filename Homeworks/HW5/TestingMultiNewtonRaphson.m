%Testing MultiNewtonRaphson
%f(x) = x1^2+x1x2 - 10
%g(x) = x2 + 3x1x2^2 - 57



initialGuess = [1 ; 3];


realAns = [2;3];

ansVector = MultiNewtonRaphson(initialGuess);



