use <../inc/2020.scad>
use <../rounded_box.scad>


h_l = 40.5;
h_lg = 35;
e=5;

r_vis = 2.75;


module pied(){
    difference(){
        hull(){
            translate([-10-e, -20-e, 0])cube([20+2*e,40+2*e, 20]);
            translate([0, 0,20]) rotate([90,0,0]) cylinder(r = 10, 40+2*e, center = true);
        
        }
        
        for(i=[-1,1]){
            //translate([0,i*10,12]) rotate([0,90,0]) cylinder(r = r_vis, 100, center = true);
        }
        
        translate([0, 0,20]) rotate([90,,0]) cylinder(r = 5, 100, center = true);
        
        translate([0,0,-1]) rotate([0,0,90])barre2040p_lg(10);
        
        
    }
   
}

pied();
   
    
    
    
    
    