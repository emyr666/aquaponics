include  <threads.scad>;
$fa=0.1;
difference() {
  union () {
    cylinder (d=160, h=4);
    metric_thread (diameter=47, pitch=5, length=75);
  }
  translate([0,0,-5]) cylinder(d=35, h=85);
}