module tube(length,thickness,diameter) {
    difference() {
        cylinder(d=diameter, h=length);
        translate([0,0,-1]) cylinder(d=diameter-2*thickness, h=length+2);
    }
}

module hemisphere(diameter,thickness) {
    difference() {
        sphere(d=diameter);
        sphere(d=diameter-2*thickness);
        translate([0,0,-diameter/2]) cube(size=[diameter,diameter,diameter], center=true);
    }
}

$fa=1;
$fs=0.5;
translate([0,0,20+73.5/2]) {
rotate(a=[0,180,0]) {
  difference () {
    union() {
      translate([0,0,20]) hemisphere(73.5,4);
      tube(20,3.5,73.5);
      // top nipple for snorkel
      //translate([0,0,73.5/2+19]) cylinder(d=12,h=10);
      //translate([41,0,0]) tube(10,3,12);
    }
    //cylinder(d=6,h=120);
  }
}
}