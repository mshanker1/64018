// Objective function
min: 5h1 + 5h2 + 5h3 + 5h4 + 5h5 + 5h6 + 10f1 + 10f2 + 10f3 + 10f4 + 10f5 + 10f6 + 8s1 + 8s2 + 8s3 + 8s4 + 8s5 + 8s6;

// Constraints

sini: s0 = 20;
sm1: s0 + h1 - f1 - s1 = 0; 
sm2: s1 + h2 - f2 - s2 = 0;
sm3: s2 + h3 - f3 - s3 = 0; 
sm4: s3 + h4 - f4 - s4 = 0;
sm5: s4 + h5 - f5 - s5 = 0;
sm6: s5 + h6 - f6 - s6 = 0;

// Now, bi = 1 if we hire somebody
h1 - 1000 b1 <= 0;
h2 - 1000 b2 <= 0;
h3 - 1000 b3 <= 0;
h4 - 1000 b4 <= 0;
h5 - 1000 b5 <= 0;
h6 - 1000 b6 <= 0;

// We cannot fire anybody in a month when we hired in the previous month
// f(i+1) <= M (1-bi)
// f(i+1) + M b1 <= M

f2 + 1000 b1 <= 1000;
f3 + 1000 b2 <= 1000;
f4 + 1000 b3 <= 1000;
f5 + 1000 b4 <= 1000;
f6 + 1000 b5 <= 1000;

// Minimum staff required

s1 >= 30;
s2 >= 60;
s3 >= 55;
s4 >= 40;
s5 >= 45;
s6 >= 50;

// Declare binary variables

bin b1, b2, b3, b4,  b5, b6;

