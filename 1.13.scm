SICP Exercise 1.13

The following is my solution to Exercise 1.13 in Structure and Interpretation of Computer Programs

Problem statement

Fib n 0 if n 0 1 if n 1 Fib n 1 Fib n 2 otherwise

Prove that Fib n is the closest integer to n 5 , where 1 5 2 . Hint: Let 1 5 2 . Use induction and the definition of the Fibonacci numbers (above) to prove that Fib n n n 5 .

Proof

Let's restate the problem more formally. For Fib n to be the closest integer to n 5 , the distance between the two must be less than or equal to 1 2 . In other words, we must prove:

Fib n n 5 1 2

For now, let's assume the hint in the problem statement is true (we'll prove it later).

Fib n n n 5 , or Fib n n 5 n 5

We can substitue this into our problem statement, simplifying it remarkably:

n 5 1 2 , or n 5 2

Now, everybody knows that for x 1 and n 0

x n 1

Therefore, if we can show that 1 and 5 2 > 1 , we'll have our proof.

We can see immediately that 5 2 > 1 , as 5 2 is obviously greater than 4 2 , which is equal to 1 .

Let's show that 1 . That is. let's show:

1 5 2 1 , or 5 1 2 1

It is easy to see when we express the value of 1 differently, say

1 9 1 2

It would be even easier to see by punching the expression into a calculator, but how fun would that be?

Anyways, it should be obvious that

5 1 2 < 9 1 2

So there's our proof. Unfortunately, it rests on an unproven assumption: the hint that was given in the problem statement. Let's prove it.

Recall, the hint:

Fib n n n 5

We'll approach this proof inductively as the problem statement recommends. Let's start by establishing some base cases. From the definition of Fib n ,

For n 0 ,

Fib 0 0

For n 1 ,

Fib 1 1

For n 2 ,

Fib 2 Fib 1 Fib 0 1 0 1

Now let's look at the right hand side.

For n 0 ,

0 0 5 1 1 5 0

For n 1 ,

1 1 5 1 5 2 1 5 2 5 1 2 5 2 1 2 5 2 5 5 5 1

For n 2 ,

2 2 5 1 5 2 2 1 5 2 2 5 1 2 5 2 1 2 5 2 4 5 4 5 4 5 1

You can see that the for these base cases, the left-hand side equals the right.

Let's move on to the inductive case. If we assume Fib n n n 5 and Fib n 1 n 1 n 1 5 , then we should expect

Fib n 1 n 1 n 1 5

Does it?

Fib n 1 Fib n Fib n 1 n n 5 n 1 n 1 5 n n 1 n n 1 5 n 1 1 2 n 1 1 2 5 n 1 1 1 1 n 1 1 1 1 5 n 1 2 1 5 1 2 1 5 n 1 2 1 5 1 2 1 5 5 n 1 2 1 5 1 5 2 1 5 n 1 2 1 5 1 5 2 1 5 5 n 1 2 1 5 3 5 1 5 n 1 2 1 5 3 5 1 5 5 n 1 6 2 5 1 2 5 5 n 1 6 2 5 1 2 5 5 5 n 1 6 2 5 6 2 5 n 1 6 2 5 6 2 5 5 n 1 1 n 1 1 5 n 1 n 1 5

QED