/* Objective Function */
Min: 12q1 + 14q2 + 16q3 + 18q4 + 2s1 + 2s2 + 2s3 + 2s4;

/* Constraints */
d1: q1 - s1 = 100;
d2: s1 + q2 - s2 = 200;
d3: s2 + q3 - s3 = 150;
d4: s3 + q4 - s4 = 400;

/* Bounds */
q1 - 400 b1 <= 0;
q2 - 400 b2 <= 0;
q3 - 300 b3 <= 0;
q4 - 300 b4 <= 0;

b1 <= 1;
b2 <= 1;
b3 <= 1;
b4 <= 1;

int b1, b2, b3, b4;
