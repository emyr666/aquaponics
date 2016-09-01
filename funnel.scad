$fa=1;
$fs=0.5;
tube_od=38;
tube_id=36;
funnel_od=54;
funnel_id=50;
tube_length=30;
funnel_length=30;

module tube(length, inner_diameter, outer_diameter) {
  difference() {
    cylinder(d=outer_diameter, h=length);
    translate([0,0,-1]) {
      cylinder(d=inner_diameter, h=length+2);
    }
  }
}

union() {
  translate([0,0,funnel_length]) tube(tube_length,tube_id,tube_od);
  difference() {
    cylinder(h =funnel_length, d1 = funnel_od, d2 = tube_od, center = false);
    translate([0,0,-1]) cylinder(h = funnel_length+2, d1 = funnel_id, d2 = tube_id-4, center = false);
  }
}
