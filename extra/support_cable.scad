use <../inc/2020.scad>

//translate([-10,0,0])%import("../../../Downloads/Clamp_wNut_6x6mm_hollow.stl");
h_l = 40.5;
h_lg = 35;
e=3;
h=5.5;

r_vis = 2.75;

$fn=64;


module support_cable(){
    lg = 16;//12 26
    l=20;//20 //25
    r = 3;
    r2 = r-1.8;
    difference(){
        hull(){
            translate([-l/2+r,r,0]) cylinder(r=r, h);
            translate([l/2-r,r,0]) cylinder(r=r, h);
            translate([-l/2+r,lg-r,0]) cylinder(r=r, h);
            translate([l/2-r,lg-r,0]) cylinder(r=r, h);
        }
        
        hull(){
            translate([-l/2+r,r,-1]) cylinder(r=r2, h+2);
            translate([l/2-r,r,-1]) cylinder(r=r2, h+2);
            translate([-l/2+r,lg-r,-1]) cylinder(r=r2, h+2);
            translate([l/2-r,lg-r,-1]) cylinder(r=r2, h+2);
        }
        
    }
    translate([0,0,h/2]) rotate([90,0,0]) cylinder(r=h/2, 2);
    
    translate([0,-2.8,0])
    hull(){
         translate([-5,0,1.5]) cube([10,1,h-3]);
         translate([-5+1.5,0,0]) cube([10-3,1,h]);
         translate([-h/2+1,-2.5,0]) cube([h-2,1,h]);
    }
   
}

support_cable();
   
    
    
    
    
    