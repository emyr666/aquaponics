module tube(length,thickness,radius) {
    difference() {
        cylinder(r=radius, h=length);
        translate([0,0,-1]) cylinder(r=radius-thickness, h=length+2);
    }
}
$fa=1;
$fs=0.5;
outer_tube_length=37;
outer_tube_radius=41/2;
outer_tube_thickness=4;
inner_tube_length=30;
inner_tube_radius=39/2;
inner_tube_thickness=3;
overlap_region=10;

tube(outer_tube_length,outer_tube_thickness,outer_tube_radius);
translate([0,0,outer_tube_length-overlap_region]) tube(inner_tube_length+overlap_region,inner_tube_thickness,inner_tube_radius);