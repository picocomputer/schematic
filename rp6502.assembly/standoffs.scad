// This file is for an "acrylic sandwich"
// of pre-cut 100x150x3mm or 4x6" sheets
// joined with an M3x30 nut and bolt.

// Use OpenSCAD to render this as *.stl
// which you can send for fabrication.

// Adjust these to your actual measurements.

m3_bolt_length = 30;
acrylic_thickness = 2.75;
pcb_thickness = 1.6;
nut_thickness = 2.4;

// For washers etc.

misc_thickness = 0;

// Leaves nice gap for the micro-USB Pi Pico.
// Gap is small enough to block connector.

top_spacer_height = 16;

// Bottom spacer makes up the difference.

bottom_spacer_height = m3_bolt_length - (
    (acrylic_thickness * 2) +
    pcb_thickness +
    nut_thickness +
    misc_thickness +
    top_spacer_height
);

module top_bot_pair(y = 0, $fn = 64) {
    // Bottom spacer
    translate([0,y,0])
    difference() {
        cylinder(h=bottom_spacer_height, d=6.5);
        translate([0,0,-1])
        cylinder(h=bottom_spacer_height+2, d=3.2);
    }
    // Top spacer
    translate([8,y,0])
    difference() {
        cylinder(h=top_spacer_height, d=6.5);
        translate([0,0,-1])
        cylinder(h=top_spacer_height+2, d=3.2);
    }
}

// Four sets
top_bot_pair(y=0);
top_bot_pair(y=8);
top_bot_pair(y=16);
top_bot_pair(y=24);
