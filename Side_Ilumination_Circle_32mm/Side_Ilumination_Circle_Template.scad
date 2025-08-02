
/* 
                            Dark Field Filters v1.0
                    
   Dark Field Filters v1.0

An open source filter for a costume dark field hat can be adapted to any compound microscope.

This 3D file is designed to be the first optical filter for contrast illumination Technics for microscopy enthusiast and professionals.
     
Source :https://github.com/Usuy-Leon/DIY_Dark-Field-Filters

This project is an Open Source project,
by Usuy D. Leon, 2025.03.26
Microscopist, National University of Colombia, Bogota DC,

    */

// // // // // // // // // // // // // // // // // // // // // // // // // //
/*                        - User Parameters -                             */
 
height = 3;         // Total height of the filter
outer_dia = 32;     // Outer diameter of the main structure
inner_dia = 15;     // Diameter of the light-blocking center cylinder
border_thickness = 2; // Thickness of the outer border
$fn = 150;          // Number of facets "resolution"

/*                      - Arms Characteristics -                          */

number_arms = 3;    // less arms will give you more information and light
arm_thickness = 1;  // Thickness of the connecting arms


// // // // // // // // // // // // // // // // // // // // // // // // // // 
/*                            - Filter Caracteristics -                    */

// Calculate the border ring
border_inner_dia = outer_dia - border_thickness;

// Create the outer border ring
difference() {
    cylinder(h=height, d=outer_dia);
    translate([7.5,0,0]) {cylinder(h=height, d=inner_dia);
    }  
}  


