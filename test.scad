module tube(length,thickness,diameter) {
    difference() {
        cylinder(d=diameter, h=length);
        translate([0,0,-1]) cylinder(d=diameter-2*thickness, h=length+2);
    }
}

$fa=1;
$fs=0.5;
tube(30,3,47.5);