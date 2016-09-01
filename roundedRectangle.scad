module roundedRectangle(width,radius) {

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

module roundedRectangleBar(width,diameter,length) {
    hull() {
        translate([-width/2+diameter/2,0,0]) cylinder(d=diameter,h=length)
    } 
}