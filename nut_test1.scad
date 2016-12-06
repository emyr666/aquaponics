
include  <threads.scad>;
$fa=0.1;
difference() {
  union() {
    cylinder(d=70,h=4);
    translate([0,0,4]) cylinder (d=70, h=20, $fn=8);
  }
  translate ([0,0,-0.1]) metric_thread (diameter=48.5, pitch=5, length=54, internal=true);
}