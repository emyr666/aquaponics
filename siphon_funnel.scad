thickness=3;
pipe_fitting_od=41;
top_d=55;
funnel_len=50;
module funnel()
difference() {
    cylinder(d1=pipe_fitting_od, d2=top_d, h=funnel_len);
    translate([0,0,-1]) {
        cylinder(d1=pipe_fitting_od-2*thickness, d2=top_d-2*thickness, h=funnel_len+2);
    }
}