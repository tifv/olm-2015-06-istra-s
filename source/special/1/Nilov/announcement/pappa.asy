import geometry;

real size = 3cm;
size(size);

mass A = (0,4) * 1.0, B = (3,0) * 1.0, C = (6,6) * 1.0;

int n = 2;
real q = 2.0**(1.0/n);

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
    real qq = q ** i;
    draw(line(A, masscenter(B, qq * C), extendA=false), apen);
    draw(line(B, masscenter(C, qq * A), extendA=false), bpen);
    draw(line(C, masscenter(A, qq * B), extendA=false), cpen);
}

dot((point) A);
dot((point) B);
dot((point) C);

