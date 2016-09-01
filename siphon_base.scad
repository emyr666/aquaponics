use <threads.scad>

module roundedRectangleBar(width,height,length,radius) {
    translate([-length/2,0,width/2])
    rotate([90,0,0]) {
        rotate([0,90,0]) {
            hull() {
                translate([-width/2+radius,-height/2+radius,0]) cylinder(r=radius,h=length);
                translate([-width/2+radius,+height/2-radius,0]) cylinder(r=radius,h=length);
                translate([+width/2-radius,-height/2+radius,0]) cylinder(r=radius,h=length);
                translate([+width/2-radius,+height/2-radius,0]) cylinder(r=radius,h=length);
            } 
        }
    }
}

module tube(length,wall_thickness,diameter,inner) {
    if (inner==true) {
        difference() {
            cylinder(d=diameter+2*wall_thickness, h=length);
            translate([0,0,-1]) cylinder(d=diameter, h=length+2);
        }
    } else {
        difference() {
            cylinder(d=diameter, h=length);
            translate([0,0,-1]) cylinder(d=diameter-2*wall_thickness, h=length+2);
        }
    }
}

module siphon_base(
    insert_tube_diameter,
    total_height,
    hole_section_height,
    hole_section_thickness,
    upper_section_thickness,
    hole_vertical_offset,
    hole_width,
    hole_height,
    hole_radius
) {
    hole_bar_length=insert_tube_diameter+2*upper_section_thickness+1;
    translate([0,0,total_height]) {
        rotate([180,0,0]) {
            difference() {
                union() {
                    tube(total_height,upper_section_thickness,insert_tube_diameter,inner=true);
                    tube(hole_section_height,hole_section_thickness,insert_tube_diameter+2*(hole_section_thickness-upper_section_thickness));
                }
                translate([0,0,hole_vertical_offset]) union() {
                    roundedRectangleBar(hole_width,hole_height,hole_bar_length,hole_radius);
                    rotate([0,0,60])roundedRectangleBar(hole_width,hole_height,hole_bar_length,hole_radius);
                    rotate([0,0,120])roundedRectangleBar(hole_width,hole_height,hole_bar_length,hole_radius);
                }
            }
        }
    }
}

$fa=1;
$fs=0.5;
insert_tube_diameter=69.0;
total_height=60;
hole_section_height=32;
hole_section_thickness=4;
upper_section_thickness=3;
hole_vertical_offset=2;
hole_width=27.5;
hole_height=25;
hole_radius=5;
drain_diameter=35;
outer_diameter=insert_tube_diameter+2*hole_section_thickness-2*upper_section_thickness;
bulkhead_length=40;
bulkhead_diameter=44;

siphon_base(
  insert_tube_diameter,
  total_height,
  hole_section_height,
  hole_section_thickness,
  upper_section_thickness,
  hole_vertical_offset,
  hole_width,
  hole_height,
  hole_radius
);