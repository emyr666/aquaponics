module elbow(id, od, bendRadius) {
  intersection() {
    translate([0,0,-bendRadius]) cube(size=2*bendRadius, center=false);
	rotate_extrude() {
	  translate([bendRadius, 0, 0]) 
	  difference() {
        circle(d=od);
        circle(d=id);
      }
    }
  }
}

module tube(length,id,od) {
    difference() {
        cylinder(d=od, h=length);
        translate([0,0,-1]) cylinder(d=id, h=length+2);
    }
}

$fa=0.5;
$fs=0.1;
union() {
	tube(10,8,12.5);
	tube(20,12.5,15);
	translate([-15,0,20]) rotate([90,0,0]) elbow(8,15,15);
}