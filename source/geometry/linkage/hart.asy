import geometry;

// access ../common/ as common.asy

import common;

size(0.7size);

point
    pA = (0, 0), pD = (4, 0), pB = (0.8, 2.5),
    pC = reflect(pA, pD) * (pA + pD - pB);

real r = 0.40;

point
    pO = pA + r * (pB - pA),
    pP = pA + r * (pC - pA),
    pQ = pD + r * (pB - pD);

point pS = pO * (0.5, 1.5) + pP * (0.5, -1.5);

real inversion_k = r * (1 - r) * (abs(pA-pC)^2 - abs(pB-pA)^2);
point inversion(point p) {
    return pO + (p - pO) * inversion_k / abs(p - pO)^2;
}

point
    pP0 = pS + (pP - pS) / dir(50),
    pP1 = pS + (pP - pS) * dir(5);

circle circP = circle(pS, abs(pP - pS));
arc arcP = arc(circP, pP0, pP1);

segment segQ = segment(inversion(pP0), inversion(pP1));
line lineQ = line(segQ);

clipdraw(circP, dashed);
draw(arcP, important_pen);
//draw(lineQ, dashed);
draw(segQ, important_pen);

draw(
    pA--pB--pD--pC--cycle ^^
    pS--pP,
    linkage_pen
);

draw(line(pA, pD), dashed);
draw(line(pB, pC), dashed);
draw(line(pP, pQ), dashed);

label("$A$", pA, SW);
label("$B$", pB, NW);
label("$C$", pC, NE);
label("$D$", pD, SE);
label("$O$", pO, NW);
label("$P$", pP, 1.2NNW);
label("$Q$", pQ, 1.2NNE);
label("$S$", pS, SE);

fixed_dot(pO);
fixed_dot(pS);

linkage_dot(pA);
linkage_dot(pB);
linkage_dot(pC);
linkage_dot(pD);

important_dot(pP);
important_dot(pQ);

