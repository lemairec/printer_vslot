include <inc/2020.scad>
use <inc/rounded_box.scad>
use <inc/nema17.scad>
use <../piece3d/config.scad>

//translate([-35, -30,0])import("hbar.stl");

h_l = 40.5;
h_lg = 35;
e=4;

r_vis = 2.75;

module renfort(){
    rotate(a=[90,-90,0])
    linear_extrude(height = e, center = true, convexity = 10, twist = 0)
            polygon(points=[[0,0],[15,0],[0,12]], paths=[[0,1,2]]);
}
module h_corner(roue = true){
    difference(){
        union(){
            myRoundedBox(h_l+2*e+5, h_lg+2*e+5, 15, 5);
            translate([-10-e, -20-e, 0])cube([20+2*e,40+2*e, 30]);
            
            for(i=[0,1]){
                rotate([0,0,i*180]) translate([-10-e,0,15])renfort();
            }
        }
        
        for(i=[-1,1]){
            for(j=[-1,1]){
                translate([i*h_l/2, j*h_lg/2, -1]) cylinder(r=r_vis, 20+2);
            }
        }
        
        for(i=[-1,1]){
            translate([0,i*10,23]) rotate([0,90,0]) cylinder(r = r_vis, 100, center = true);
        }
        
        translate([0,0,e]) rotate([0,0,90])barre2040p(100);
        
        translate([-(h_l/2-5),10,8]) rotate([90,90,0]) support_nut(3,20, 600);
        
    }
    
    if(roue){
        for(i=[-1,1]){
            for(j=[-1,1]){
                translate([i*h_l/2, j*h_lg/2, -10]) color("red")vslot2020();
            }
        }
    }
   
}

module plateau(l=300, lg=200, plateau_l=200){
    for(j=[-1,1]){
        rotate([j*90,0,0]) translate([0, 0, -l/2+10]) h_corner();
    }
    color("gray") rotate([0,90,90]) barre2040(l-2*e-20, true);
    for(j=[-1,1]){
        color("gray") translate([10, j*l*0.3, 0]) rotate([0,90,0]) barre2040(lg);
    }
    
    color("red") translate([0,-plateau_l/2,25]) cube([plateau_l,plateau_l,2]);
    
}

module support_nema17(l=300, lg=200, plateau_l=200){
    difference(){
        translate([-20,0,0])cube([40,62,3]);
        translate([0,21.5+20,-22])nema17();
        for(i=[-1,1]){
            translate([i*15, 10, 0]) cylinder(r=2.6, 20, center=true);
        }
    }
    
}

module support_ecrou(l=300, lg=200, plateau_l=200){
    difference(){
        union(){
            translate([-20,0,0])cube([40,20,5]);
            translate([-20,0,0])cube([40,5, 20]);
            translate([0,12,0])cylinder(r=10, 8);
        }
        translate([0,21.5+20,-22])nema17();
        for(i=[-1,1]){
            translate([i*15, 0, 12]) rotate([90,0,0]) cylinder(r=2.6, 20, center=true);
        }
        translate([0, 12, 10]) rotate([180,0,0]) m8(11, true);
        
    }
    
    
}

mode = 0;
if(mode == 0){
    plateau();
    
} else {
    h_corner(false);
}
   
    
    
    
    
    