import geometry;

real size = 3cm;
size(size);

point
    pA1 = dir(70), pA2 = dir(170), pA3 = dir(250), pA4 = dir(300);

circle inner = circle(pA1, pA2, pA3);

point
    pB1 = 1.8 dir(70), pB3 = 3 dir(250);

circle
    circ1 = circle(pA1, pA2, pB1),
    circ2 = circle(pA2, pA3, pB3),
    circ3 = circle(pA3, pA4, pB3),
    circ4 = circle(pA4, pA1, pB1);

point
    pB2 = reflect(circ1.C, circ2.C) * pA2,
    pB4 = reflect(circ3.C, circ4.C) * pA4;

circle outer = circle(pB1, pB2, pB3);

draw(inner);
draw(circ1);
draw(circ2);
draw(circ3);
draw(circ4);
draw(outer, dashed);

dot(pA1); dot(pA2); dot(pA3); dot(pA4);
dot(pB1); dot(pB2); dot(pB3); dot(pB4);

