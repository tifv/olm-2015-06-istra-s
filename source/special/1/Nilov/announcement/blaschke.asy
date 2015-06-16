import geometry;

real size = 3cm;
size(size);

point A = (0,4), B = (3,0), C = (6,6);

real a = 140, b = 120, c = 100;

int n = 2;
real d = 17.0 / n;

pen
    apen = black+linewidth(0.5),
    bpen = black+linewidth(0.5),
    cpen = black+linewidth(0.5);

/*
pen
    apen = red  +linewidth(0.5),
    bpen = green+linewidth(0.5),
    cpen = blue +linewidth(0.5);
*/

for (int i = -n; i <= n; i += 1) {
    real dd = d * i;
    draw(arcsubtended(B, C, a + dd), apen);
    draw(arcsubtended(C, A, b + dd), bpen);
    draw(arcsubtended(A, B, c + dd), cpen);
}

dot(A);
dot(B);
dot(C);

