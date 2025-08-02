/* 
 Side Ilumination  Filters v1.0

An open source filter for a costume side ilumiation that can be adapted to any compound microscope.

This 3D file is designed to be the third optical filter for contrast illumination technics made for microscopy enthusiast and professionals.
     
Source :https://github.com/Usuy-Leon/DIY_Dark-Field-Filters

This project is an Open Source project,
by Usuy D. Leon, 2025.03.26
Microscopist, National University of Colombia, Bogota DC,

  */

// // // // // // // // // // // // // // // // // // // // // // // // // //
/*                        - User Parameters -                             */
 
height = 2;                 // Total height of the filter
outer_dia = 32;             // Outer diameter of the main structure
inner_dia = 15;             // Diameter of the light-blocking center cylinder
border_thickness = 2.2;       // Thickness of the outer border
$fn = 150;                  // Resolution

/*                        - Triangle Parameters -                             */
points_R = [
    [13 , 16],
    [2, -3], 
    [0, 0]
];

points_L= [
    [16 , 13],
    [-2, 3], 
    [0, 0]

];
// // // // // // // // // // // // // // // // // // // // // // // // // // 
/*                            - Computed Values -                         */
border_inner_dia = outer_dia - border_thickness; 

// // // // // // // // // // // // // // // // // // // // // // // // // //
/*                            - Modules -                                 */
// Create the extruded triangle directly 
/*  module triangle_R(){
translate([-10, 11, 0]) 
rotate(270)
linear_extrude(height = height) 
    polygon(points_R);
}

/*  module triangle_L(){
translate([-11, -11, 0]) 
rotate(0)
linear_extrude(height = height) 
    polygon(points_L);
}
  */
module donut() {
    difference() {
        cylinder(height, d = 3);
        cylinder(height, d = 1);  // Use computed border diameter
    }
}
module moon(diameter = outer_dia, height) { 
    difference() {
        cylinder(2, d = outer_dia);
        
        // Cut lower half using a cube larger than the cylinder
        translate([0, -outer_dia, 0]) 
            cube([diameter, outer_dia*2, 2]);
    }
}

module outer_ring() {
    difference() {
        cylinder(height, d = outer_dia);
        cylinder(height, d = border_inner_dia);  // Use computed border diameter
    }
}

module bridge() {
  hull() {
    translate([0, 0, 0])  // Match triangle_R position
      rotate(120)
        cylinder(h=height, r=1);  // Anchor point 1
    
    translate([-0,11, 0])  // Match triangle_L position
      rotate(0)
        cylinder(h=height, d=10);  // Anchor point 2
      
  }
}    

/*                            - Main Assembly -                           */
  difference() {
      bridge();
} 
union() {
  //cylinder(height, d = inner_dia);
  bridge();  // Add bridging element
  translate([0, 0, 0]){  
  rotate(90)
  bridge();}
  translate([0, 0, 0]){  
  rotate(180)
  bridge();} 
  translate([0, 0, 0]){  
  rotate(270)
  bridge();} 
  donut();  
difference() ;
    outer_ring();
  }

