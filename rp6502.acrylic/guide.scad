// Drill jig for Picocomputer 6502
// sandwich case of 100x150x3mm acrylic.
// Drill 3mm in the corners,
// 2.5mm for the boot button access.

// Width and Height adjusted to
// fit panel in the upper/guide.

panel_width = 100.6;
panel_height = 150.6;

// Clearance shrinks the lower/spoil
// so it fits inside the upper/guide.

clearance = 0.2;

/* [Hidden] */
$fn = 32;

module holes() {
    translate([+70,-50,-45])
    rotate([-90,0,0])
    cylinder(h=100, d=3);
    translate([+70,-50,+45])
    rotate([-90,0,0])
    cylinder(h=100, d=3);
    translate([-70,-50,-45])
    rotate([-90,0,0])
    cylinder(h=100, d=3);
    translate([-70,-50,+45])
    rotate([-90,0,0])
    cylinder(h=100, d=3);
    translate([-50,-50,-37.6])
    rotate([-90,0,0])
    cylinder(h=100, d=2.5);
    translate([+56.9,-50,-37.6])
    rotate([-90,0,0])
    cylinder(h=100, d=2.5);
    translate([50,-50,37.6])
    rotate([-90,0,0])
    cylinder(h=100, d=2.5);
    translate([-56.9,-50,37.6])
    rotate([-90,0,0])
    cylinder(h=100, d=2.5);
   
}

module opening() {
    translate([0,0,0])
    cube([140,30,62], true);
    translate([4,0,-10])
    cube([90,30,70], true);
    translate([-4,0,10])
    cube([90,30,70], true);
}


translate([0,60,10])
rotate([90,0,0])
difference() {
    translate([0,-4,0])
    cube([160,12,110], true);
    opening();
    translate([0,0,0])
    cube([panel_height,6,panel_width], true);
    holes();
}

translate([0,-60,8])
rotate([90,0,0])
difference() {
    union() {
        translate([0,-4,0])
        cube([160,8,110], true);
        translate([0,1,0])
        cube([panel_height-clearance,2,
        panel_width-clearance], true);
    }
    rotate([180,0,0])
    opening();
    rotate([180,0,0])
    holes();
}
