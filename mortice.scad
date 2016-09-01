// parameterised model for mortice template

// router parameters
bit_diam = 6; // diameter of router bit in mm
template_guide_diam = 35; // diameter of the router template guide

// mortice parameters
mortice_y_offset = 350; // distance from top of template to the top of the mortice hole
piece_width = 150; // width of the piece of wood - hole is centred along the x direction
mortice_width = 20; // width of mortice hole (ignoring rounded corners)
mortice_height = 150; // height of mortice hole (ignoring rounded corners)

// template parameters
hole_diam = 4; // diameter of drill holes for fixing template to the piece
template_height = mortice_y_offset+mortice_height+template_guide_diam


// outside rectangle
