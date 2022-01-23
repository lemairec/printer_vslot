use <2020.scad>
use <rounded_box.scad>
use <nema17.scad>
use <../piece3d/config.scad>

//translate([-35, -30,0])import("hbar.stl");

h_l = 40.5;
h_lg = 35;
e=4;

r_vis = 2.75;


module pied(){
    a=40;
    e= 8;
    difference(){
        union(){
            hull(){
                rotate([0,0,a])cube([60,5,e]);
                translate([0,-5,0])cube([60,5,e]);
            }
            rotate([0,0,a])cube([10,10,e]);
            rotate([0,0,a])translate([50,0,0])cube([10,10,e]);
            translate([0,-5,0])cube([60,5,e+18]);
        }
        
        rotate([0,0,a])translate([5-3,0,-1]) cube([6,4,12]);
        rotate([0,0,a])translate([55-3,0,-1])cube([6,4,12]);
        
        rotate([0,0,a])translate([5,0,e/2]) rotate([-90,0,0]) cylinder(r=1.6, 100);
        rotate([0,0,a])translate([55,0,e/2]) rotate([-90,0,0]) cylinder(r=1.6, 100);
        
        for(i=[0:5]){
            translate([5+i*10,1,20]) rotate([90,0,0]) cylinder(r=2.7, 100);
        }
        
        
    }
   
}

pied();
   
    
    
    
    
    