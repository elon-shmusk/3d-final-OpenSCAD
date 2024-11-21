module gear(teeth = 20, thickness = 5, bore_diameter = 5, tooth_depth = 2) {
    // Gear parameters
    pitch_diameter = teeth * 2;
    outer_diameter = pitch_diameter + 2 * tooth_depth;
    inner_diameter = pitch_diameter - 2 * tooth_depth;

    // Gear body
    difference() {
        cylinder(h = thickness, d = outer_diameter, $fn = teeth * 2);
        cylinder(h = thickness, d = bore_diameter);
    }

    // Gear teeth
    for (i = [0:teeth-1]) {
        rotate([0, 0, i * 360 / teeth])
        translate([pitch_diameter / 2, 0, 0])
        rotate([0, 0, -90 / teeth])
        linear_extrude(height = thickness)
        polygon(points = [[0, 0], [tooth_depth, -tooth_depth / 2], [tooth_depth, tooth_depth / 2]]);
    }
}

// Render the gear
gear();