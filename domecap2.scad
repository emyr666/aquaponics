module tube(length, inner_diameter, outer_diameter) {
  difference() {
    cylinder(d=outer_diameter, h=length);
    translate([0,0,-1]) {
      cylinder(d=inner_diameter, h=length+2);
    }
  }
}

module hemisphere(inner_diameter, outer_diameter) {
  difference() {
    sphere(d=outer_diameter);
    sphere(d=inner_diameter);
    translate([0, 0, -outer_diameter/2]) {
      cube(size=[outer_diameter, outer_diameter, outer_diameter], center=true);
    }
  }
}


module elbow(innerRadius, outerRadius, bendRadius) {
  intersection() {
    translate([0,0,-bendRadius]) cube(size=2*bendRadius, center=false);
	rotate_extrude() {
	  translate([bendRadius, 0, 0]) 
	  difference() {
        circle(d=outerRadius);
        circle(d=innerRadius);
      }
    }
  }
}

$fa=1;
$fs=0.5;
tube_length=30;
inner_diameter=69.0;
thickness=4;
outer_diameter=inner_diameter+thickness;
difference() {
	union() {
	  translate([0, 0, outer_diameter/2]) {
		tube(tube_length, inner_diameter, outer_diameter);
	  }
	  rotate(a=[0, 180, 0]) {
		translate([0, 0, -outer_diameter/2]) {
		  hemisphere(inner_diameter-2, outer_diameter);
		}
	  }
	  translate([0,15+inner_diameter/2,45]) rotate([0,0,90]) {
		union() {
		  tube(10,8,12.5);
		  tube(20,12.5,15);
		  translate([-15,0,00]) rotate([-90,0,0]) elbow(8,15,15);
		}
	  }
	}
	translate([0,outer_diameter/2,30]) rotate([90,0,0]) cylinder(d=8,h=10);
}