use <2020.scad>
use <rounded_box.scad>
use <nema17.scad>

//translate([-35, -30,0])import("hbar.stl");

h_l = 40.5;
h_lg = 35;
e=4;

r_vis = 2.75;


module pied(){
    difference(){
        union(){
            myRoundedBox(h_l, h_lg+2*e+5, e, 5);
            translate([-10-e, -20-e, 0])cube([20+2*e,40+2*e, 17]);
        }
        
        for(i=[-1,1]){
            translate([0,i*10,12]) rotate([0,90,0]) cylinder(r = r_vis, 100, center = true);
        }
        
        translate([0,0,e]) rotate([0,0,90])barre2040p(100);
        
        
    }
   
}

pied();
   
    
    
    
    
    