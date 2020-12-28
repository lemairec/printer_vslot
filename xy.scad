use <2020.scad>


//translate([-35, -30,0])import("hbar.stl");

h_l = 60;
h_lg = 62;
e=4;

module renfort(){
    hull(){
        translate([0,-e/2,0])cube([h_l/2+e+2.5,e,e]);
        translate([0,-e/2,30-e])cube([10+e,e,e]);
    }
}

module h_corner(){
    difference(){
        union(){
            hull(){
                for(i=[-1,1]){
                    for(j=[-1,1]){
                        translate([i*h_l/2, j*h_lg/2, 0]) cylinder(r=5/2+e, e);
                    }
                }
            }
            translate([-10-e, -20-e, 0])cube([20+2*e,40+2*e, 30]);
            
            for(i=[0,1]){
                rotate([0,0,i*180]) translate([0,-17,0])renfort();
                rotate([0,0,i*180]) translate([0,-3,0])renfort();
                rotate([0,0,i*180]) translate([0,17,0])renfort();
            }
        }
        
        for(i=[-1,1]){
            for(j=[-1,1]){
                translate([i*h_l/2, j*h_lg/2, -1]) cylinder(r=5/2, e+2);
            }
        }
        
        translate([0,0,e]) barre2040();
    }
    
    for(i=[-1,1]){
        for(j=[-1,1]){
            color("red")translate([i*h_l/2, j*h_lg/2, -10])     vslot2020();
        }
    }
}

module charriot(vslot = true){
    difference(){
        union(){
            hull(){
                for(i=[-1,1]){
                    for(j=[-1,1]){
                        translate([i*h_l/2, j*h_lg/2, 0]) cylinder(r=5/2+e, e);
                    }
                }
            }
        }
        
        for(i=[-1,1]){
            for(j=[-1,1]){
                translate([i*h_l/2, j*h_lg/2, -1]) cylinder(r=5/2, e+2);
            }
        }
    }
    
    for(i=[-1,1]){
        for(j=[-1,1]){
            color("red")translate([i*h_l/2, j*h_lg/2, -10])     vslot2020();
        }
    }

   
}

module xy(l=300, lg=200, x = 10){
    for(j=[-1,1]){
        rotate([j*90,0,0]) translate([0, 0, -l/2+10]) h_corner();
    }
    color("gray") rotate([90,0,0]) barre2040(l-2*e-20, true);
    for(j=[-1,1]){
        color("gray") translate([0, j*l/2, 0]) rotate([90,0,90]) barre2040(lg, true);
    }
    
    translate([10, x]) rotate([0,90,0]) charriot();
    
}

xy();
    