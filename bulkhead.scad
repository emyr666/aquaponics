use <threads.scad>


$fa=1;
$fs=0.5;
insert_tube_diameter=69.5;
total_height=60;
hole_section_height=32;
hole_section_thickness=4;
upper_section_thickness=2;
hole_vertical_offset=2;
hole_width=27.5;
hole_height=25;
hole_radius=5;
drain_diameter=35;
outer_diameter=insert_tube_diameter+hole_section_thickness;
bulkhead_length=40;
bulkhead_diameter=44;

difference() {
    trapezoidThread(
        length=bulkhead_length,	 // axial length of the threaded rod
        pitch=5,				 // axial distance from crest to crest
        pitchRadius=bulkhead_diameter/2,			 // radial distance from center to mid-profile
        threadHeightToPitch=0.5, // ratio between the height of the profile and the pitch, std value for Acme or metric lead screw is 0.5
        profileRatio=0.5,	 	 // ratio between the lengths of the raised part of the profile and the pitch, std value for Acme or metric lead screw is 0.5
        threadAngle=30,			 // angle between the two faces of the thread, std value for Acme is 29 or for metric lead screw is 30
        RH=true,				// true/false the thread winds clockwise looking along shaft, i.e.follows the Right Hand Rule
        clearance=0.1,			// radial clearance, normalized to thread height
        backlash=0.1,			// axial clearance, normalized to pitch
        stepsPerTurn=64,			// number of slices to create per turn,
        showVertices=false
    );
    translate([0,0,-1]) cylinder(d=drain_diameter, h=bulkhead_length+2);
}