include <../config.scad>
include <../inc/fan.scad>

fan_nut_x = 17;
e_fan = 2;
    
module support_fan_radial(){
    h_fan = 2;
    e = 4;
   difference(){
        union(){
            translate([-12,0,0])cube([55, e, 15+2*e_fan]);
            translate([-12,0,0])cube([10,50+h_fan,e_fan]);
            translate([33,0,0])cube([10,12+h_fan,e_fan]);
        }
        translate([0,0,10]) rotate([-90,0,0]) translate([-10,7.5,h_fan]) rotate([0, -90, 180])fan_radial();
        translate([0,0,10]) rotate([-90,0,0]) translate([-10,-7.5,-10]) cube([20,15,100]);
        translate([-6,47,-1])m3(100);
        translate([37,9,-1]) m3(100);
    }
    
    //translate([0,0,10]) rotate([-90,0,0]) %translate([-10,7.5,h_fan]) rotate([0, -90, 180])fan_radial();
}

module vent_fan_radial(){
    h = -2;
    e = 4;
    y=7;
    x = 4;
    fan_lg = 15;
    r = 5;
    lg = fan_lg+2*e_fan;
    z = 18;
    difference(){
        union(){
            hull(){
                translate([-11,0,0]) cube([22,1,19]);
                translate([0,0,r]) rotate([0, 90, 0]) cylinder(r=r, 22, center = true);
                translate([0,-x,z]) rotate([0, 90, 0])  cylinder(r=2.1, 22, center = true);
            }
        }
        translate([0,0,10])rotate([-90,0,0]) translate([-20,-20,0]) cube([40,45,20]);
        hull(){
            translate([-10,0,0]) cube([20,1,19]);
            translate([0,0,r]) rotate([0, 90, 0]) cylinder(r=r-e_fan, 20, center = true);
            translate([0,-x,z]) rotate([0, 90, 0])  cylinder(r=1, 20, center = true);
        }
        translate([0,-x,z]) rotate([-40, 0, 0]) cube([20,10,3], center= true);
    }
}

lg = 70;
module support_2(){
    e = 3;
    x = 13;
    h = 5;
    difference(){
        union(){
            translate([-lg/2,0,0])cube([lg,25,e]);
            hull(){
                translate([x-4,0,0])cube([8,25,1]);
                translate([x,0,h])rotate([-90,0,0])cylinder(25,r=4);
            }
        }
        translate([x,-2,h])rotate([-90,0,0])cylinder(30,r=2);
        
        for(i=[-1,1]){
            translate([i*25,20,-1])cylinder(30,r=2.5);
        }
        hull(){
            translate([0,20,-1])cylinder(30,r=9);
            translate([0,30,-1])cylinder(30,r=9);
        }
    }
}

mode=1;
if(mode==0){
    support_2();
} else {
    mirror([1,0,0])support_fan_radial();
    vent_fan_radial(0);
}