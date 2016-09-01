module tube(length,thickness,diameter) {
    difference() {
        cylinder(d=diameter, h=length);
        translate([0,0,-1]) cylinder(d=diameter-2*thickness, h=length+2);
    }
}

module pencil(diameter,length) {
    $fn=6;
    rotate([90,0,0]) {
        rotate([0,0,90]) {
            translate([0,0,-length/2]) cylinder(r=diameter/2, h=length);
        }
    }
}

$fa=2;
$fs=1;
offset=3;
union() {
  difference() {
    tube(50,4,120);
    for (h = [-3:3:150]) {
        for (a = [0+h : 5 : 360+h] ) {
           rotate([0,0,a]) translate([0,0,offset+h]) pencil(3,200);
        }
    }
    translate([0,0,-1]) tube(11,2,116);
    translate([0,0,40]) tube(11,2,120);
  }

}