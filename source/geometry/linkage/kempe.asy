import geometry;

// access ../common/ as common.asy

import common;

size(0.8size);

point
    pA = (0, 0), pD = (4, 0), pB = (1.2, 2.0),
    pC = reflect(pA, pD) * (pA + pD - pB);

point
    pDp = pA + (pD - pA) * (pB - pA) / (pC - pA),
    pBp = reflect(pA, pDp) * (pA + pDp - pB);

draw(pA--pB--pD--pC--cycle, linkage_pen);

draw(pA--pBp--pDp, important_pen + linkage_width);

fixed_dot(pA);

linkage_dot(pB);
linkage_dot(pC);
linkage_dot(pD);

important_dot(pBp);
important_dot(pDp);

