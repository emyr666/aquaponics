module tube(length,thickness,radius) {
    difference() {
        cylinder(r=radius, h=length);
        translate([0,0,-1]) cylinder(r=radius-thickness, h=length+2);
    }
}
$fa=1;
$fs=0.5;
tube(62,3,39/2);