module plug(plug_diameter,base_rim,plug_thickness,base_thickness) {
    union() {
        cylinder(h=base_thickness, r=base_rim+plug_diameter/2);
        translate([0,0,base_thickness]) cylinder(h=plug_thickness, d=plug_diameter);
    }
}
$fa=1;
$fs=0.5;;
plug(29,10,3.2,1.2);