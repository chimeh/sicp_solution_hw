;习题1.26
On each iteration of expmod two identical expressions of (expmod base (/ exp 2) m)
 are evaluated before multiplication. Thus, we have got a binary tree recursion
 with the total number of expmod evaluations being $$ 2*n-1 $$ . And $$ \Theta (2*n-1) = \Theta(n) $$.
Another consideration about growth rate, that may be appropriate here, but not correct in general
 is that $$ 2^{\log n} = n $$.
不太会分析,