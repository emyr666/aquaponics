// parameterised model for mortice template

function getParameterDefinitions() {
  return [
    { name: 'bit_diameter', type: 'float', initial: 6, caption: "diameter of router bit in mm:" },
    { name: 'template_guide_diameter', type: 'float', initial: 30, caption: "diameter of router template guide:" },
    { name: 'x_piece_y_offset', type: 'float', initial: 360, caption: "distance from top of template to top of cross-piece:" },
    { name: 'x_piece_width', type: 'float', initial: 145, caption: "width of the piece of wood. mortice is centred in x direction:"  },
    { name: 'x_piece_depth', type: 'float', initial: 45, caption: "width of the piece of wood. mortice is centred in x direction:"  },
    { name: 'mortice_rim', type: 'float', initial: 8, caption: "rim for mortice hole (ignoring rounded corners):"  },
    { name: 'screw_hole_diameter', type: 'float', initial: 3.5, caption: "diameter of screw hole to fix template to piece" },
    { name: 'resolution', type: 'float', initial: 64, caption: "resolution" }
  ];
}
  
function mortice_hole(p) {
    var mortice_offset=p.template_guide_diameter/2-p.mortice_rim-p.bit_diameter/2;
    return CAG.roundedRectangle({center: [p.x_piece_width/2, p.x_piece_y_offset+p.x_piece_width/2], radius: [p.x_piece_depth/2+mortice_offset, p.x_piece_width/2+mortice_offset], roundradius: p.template_guide_diameter/2, resolution: p.resolution});
}

function big_rectangle(p) {
    var template_height = p.x_piece_y_offset+p.x_piece_width+p.template_guide_diameter;
    return square([p.x_piece_width, template_height]);
}

function screw_holes(p) {
    var template_height = p.x_piece_y_offset+p.x_piece_width+p.template_guide_diameter;
    return union(
        CAG.circle({center: [p.template_guide_diameter/2, p.template_guide_diameter/2], radius: p.screw_hole_diameter/2, resolution: p.resolution}),
        CAG.circle({center: [p.x_piece_width-p.template_guide_diameter/2, p.template_guide_diameter/2], radius: p.screw_hole_diameter/2, resolution: p.resolution}),
        CAG.circle({center: [p.template_guide_diameter/2, template_height-p.template_guide_diameter/2], radius: p.screw_hole_diameter/2, resolution: p.resolution}),
        CAG.circle({center: [p.x_piece_width-p.template_guide_diameter/2, template_height-p.template_guide_diameter/2], radius: p.screw_hole_diameter/2, resolution: p.resolution})
    );
}

function main(p) {
    var template_height = p.x_piece_y_offset+p.x_piece_width+p.template_guide_diameter;
    return translate([-p.x_piece_width/2,-template_height/2], big_rectangle(p).subtract(mortice_hole(p)).subtract(screw_holes(p)));
}
