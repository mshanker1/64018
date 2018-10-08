/* Objective function */
  min: 12 q1 + 10 r1 + 2 s1 + 14 q2 + 12 r2 + 2 s2 + 16 q3 + 14 r3 + 2 s3 + 18 q4 + 16 r3 + 2 s4;

/*  Constraints */
  q1 + r1 - s1 = 100;
  s1 + q2 + r2 - s2 = 200;
  s2 + q3 + r3 - s3 = 150;
  s3 + q4 + r4 - s4 = 400;
  
  q1 <= 150;
  q1 - 150 k1 >= 0;
  
  q2 <= 150;
  q2 - 150 k2 >= 0;
  
  q3 <= 150;
  q3 - 150 k3 >= 0;
  
  q4 <= 150;
  q4 - 150 k4 >= 0;
  
  r1 - 1000 k1 <= 0;
  r2 - 1000 k2 <= 0;
  r3 - 1000 k3 <= 0;
  r4 - 1000 k4 <= 0;
  
  /* integer constraints */
  // bin b1;
  int k1, k2, k3, k4;