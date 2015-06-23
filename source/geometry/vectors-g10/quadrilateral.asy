import geometry;

real size = 2cm;
size(size);

point A = (0,0), B = (1,-2), C = (3,-2), D = (3,1);

draw(A--B--C--D--cycle, linewidth(1));

draw(
    (2A+B)/3 -- (2D+C)/3 ^^
    (2B+A)/3 -- (2C+D)/3 ^^
    (2A+D)/3 -- (2B+C)/3 ^^
    (2D+A)/3 -- (2C+B)/3
);

