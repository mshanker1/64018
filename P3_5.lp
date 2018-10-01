/* objective function */

// Here, we will define some new variables
// qi is the quantity <= 200; ri is the quantity > 200
// bi = 1 if more than 200 are purchased

min: 12 q1 + 14 q2 + 16 q3 + 18 q4 + 10 r1 + 12 r2 + 14 r3 + 16 r4 + 2 s1 + 2 s2 + 2 s3 + 2 s4;

/* Constraints */
q1 + r1 - s1 = 100;
s1 + q2 + r2 - s2 = 200;
s2 + q3 + r3 - s3 = 150;
s3 + q4 + r4 - s4 = 400;
q1 - 150 b1 >= 0;
q2 - 150 b2 >= 0;
q3 - 150 b3 >= 0;
q4 - 150 b4 >= 0;
r1 - 10000 b1 <= 0;
r2 - 10000 b2 <= 0;
r3 - 10000 b3 <= 0;
r4 - 10000 b4 <= 0;

q1 <= 150;
q2 <= 150;
q3 <= 150;
q4 <= 150;

bin b1, b2, b3, b4;