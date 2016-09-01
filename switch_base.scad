// sphere with holes

// pencil
module pencil(diameter,length) {
    $fn=6;
    rotate([90,0,0]) {
        rotate([0,0,90]) {
            translate([0,0,-length/2]) cylinder(r=diameter/2, h=length);
        }
    }
}

// pencil 'star'

for  (alpha = [0:5:360]) {
    for (beta = [-60:2.5:60] ) {
        rotate([beta,0,alpha]) pencil(3,200);
    }
}

