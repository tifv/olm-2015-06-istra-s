import geometry;

real size = 3cm;
size(size);

real phi = (sqrt(5) + 1) / 2;
line l = parallel((0,-0.35), dir=(phi,1));

int n = 5, m = 3;

pen gray = gray(0.8);

line vl(int i) { return line((i,0), (i,m)); }
line hl(int j) { return line((0,j), (n,j)); }

for (int i = 0; i <= n; i += 1) {
    draw(vl(i), gray);
}

for (int j = 0; j <= m; j += 1) {
    draw(hl(j), gray);
}

draw(l);

transform scale = scale(0.5);

for (int i = 0; i <= n; i += 1) {
    point x = intersectionpoint(l, vl(i));
    dot(x, black+linewidth(3));
    label(scale * "$0$", x, 0.8l.v);
}

for (int j = 0; j <= m; j += 1) {
    point x = intersectionpoint(l, hl(j));
    dot(x, black+linewidth(3));
    dot(x, white+linewidth(2));
    label(scale * "$1$", x, -0.8l.v);
}

