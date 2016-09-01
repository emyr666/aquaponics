module roundedRectangle(size,radius) {

    x = size[0];
    y = size[1];
    z = size[2];

    hull() {
        // place 4 circles in the corners, with the given radius
        translate([(-x/2)+(radius), (-y/2)+(radius), 0])
        circle(r=radius);

        translate([(x/2)-(radius), (-y/2)+(radius), 0])
        circle(r=radius);

        translate([(-x/2)+(radius), (y/2)-(radius), 0])
        circle(r=radius);

        translate([(x/2)-(radius), (y/2)-(radius), 0])
        circle(r=radius);
    }
}
