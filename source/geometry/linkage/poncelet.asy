import geometry;

// access ../common/ as common.asy

import common;

size(0.9size);

point
    pO = (0, 0),
    pB = (4, 1.5), pD = (pB.x, -pB.y),
    pR = (1.0, -1.0), pA = (2 pR.x, 0),
    pC = reflect(pB, pD) * pA;

real inversion_k = abs(pB - pO)^2 - abs(pB - pA)^2;
point inversion(point p) {
    return pO + (p - pO) * inversion_k / abs(p - pO)^2;
}

point
    pA0 = pR + (pA - pR) / dir(60),
    pA1 = pR + (pA - pR) * dir(15);

circle circA = circle(pR, abs(pA - pR));
arc arcA = arc(circA, pA0, pA1);

segment segC = segment(inversion(pA0), inversion(pA1));
line lineC = line(segC);

draw(circA, dashed);
draw(arcA, important_pen);
//draw(lineC, dashed);
draw(segC, important_pen);

draw(
    pA--pB--pC--pD--cycle ^^
    pB--pO--pD ^^
    pR--pA,
    linkage_pen
);

draw(line(pO, pC), dashed);

label("$A$", pA, 2N);
label("$B$", pB, NE);
label("$C$", pC, SE);
label("$D$", pD, SW);
label("$O$", pO, NW);
label("$R$", pR, SE);

fixed_dot(pO);
fixed_dot(pR);

linkage_dot(pB);
linkage_dot(pD);

important_dot(pA);
important_dot(pC);

