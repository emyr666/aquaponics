module plug(plug_diameter,base_rim,plug_thickness,base_thickness) {
    union() {
        cylinder(h=base_thickness, r=base_rim+plug_diameter/2);
        translate([0,0,base_thickness]) cylinder(h=plug_thickness, d=plug_diameter);
    }
}
$fn=64;
union () {
translate([26,26,0]) plug(28,10,3.2,1.2);
translate([76,22,0]) plug(22,10,3.2,1.2);
translate([18,68,0]) plug(20,5,3.2,1.2);
translate([55,64,0]) plug(22,10,3.2,1.2);
translate([125,30,0]) plug(32,10,3.2,1.2);
translate([30,110,0]) plug(22,10,3.2,1.2);
translate([110,80,0]) plug(28,10,3.2,1.2);
translate([75,110,0]) plug(28,5,3.2,1.2);
}