
module elbow(innerRadius, outerRadius, bendRadius) {
  intersection() {
    translate([0,0,-bendRadius]) cube(size=2*bendRadius, center=false);
	rotate_extrude() {
	  translate([bendRadius, 0, 0]) 
	  difference() {
        circle(outerRadius);
        circle(innerRadius);
      }
    }
  }
}

elbow(innerRadius=8, outerRadius=11, bendRadius=33);
