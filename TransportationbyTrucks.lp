// Transportation by Truck example
// Variable Definition
// • qi continuous: tonnes of raw material to purchase in quarter i
// • si continuous: tonnes in stock at the end of quarter i, and s0 as the initial stock
// • ti integer: small trucks to contract in quarter i
// • ui integer: large trucks to contract in quarter i

// Objective Function

Min: 20q1 + 25q2 + 30q3 + 40q4 + 8s1 + 8s2 + 8s3 + 8s4 + 700t1 + 700t2 + 700t3 + 700t4 + 1400u1 + 1400u2 + 1400u3 + 1400 u4;

// Demand constraints

sini: s0 = 100;
dem1: s0 + q1 - s1 = 1000;
dem2: s1 + q2 - s2 = 1200;
dem3: s2 + q3 - s3 = 1500;
dem4: s3 + q4 - s4 = 1800;
sfin: s4 = 100;

// Truck capacity constraints

cap1: q1 - 500t1 - 1200u1 <= 0;
cap2: q2 - 500t2 - 1200u2 <= 0;
cap3: q3 - 500t3 - 1200u3 <= 0;
cap4: q4 - 500t4 - 1200u4 <= 0;

// Declaration

int t1, t2, t3, t4, u1, u2, u3, u4;