module tube(length, inner_diameter, outer_diameter) {
  difference() {
    cylinder(d=outer_diameter, h=length);
    translate([0,0,-1]) {
      cylinder(d=inner_diameter, h=length+2);
    }
  }
}

$fa=1;
$fs=0.5;
difference() {
  union() {
    tube(3,76,136);
    tube(6,76,77);
    translate([0,0,3]) rotate([90,0,0]) translate([0,0,-136/2]) cylinder(r=2, h=136, centre=true);
  }
  translate ([0,0,-1]) cylinder(h=10, d=76);
}