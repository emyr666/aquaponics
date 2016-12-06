include  <threads.scad>;
$fa=0.1;
difference() {
  metric_thread (diameter=47, pitch=5, length=100);
  translate([0,0,-5]) cylinder(d=35, h=110);
}