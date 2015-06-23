import geometry;

real size = 7cm;

pen important_pen = gray(0.5) + linewidth(1.5);
pen important_dot_pen = important_pen + linewidth(5);

void important_dot(point p) {
    dot(p, important_dot_pen);
}

pen linkage_width = linewidth(2);
pen linkage_pen = black + linkage_width;
pen linkage_dot_pen = linkage_pen + linewidth(5);

void linkage_dot(point p) {
    dot(p, linkage_dot_pen);
}

void fixed_dot(point p) {
    dot(p, linkage_dot_pen);
    dot(p, linkage_dot_pen + white + linewidth(3));
}

