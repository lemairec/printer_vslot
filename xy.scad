use <nema17.scad>
use <2020.scad>
use <rounded_box.scad>



//translate([-35, -30,0])import("hbar.stl");
r_vis = 5.4/2;
h_l = 60;
h_lg = 60;
e=4;

module renfort_(){
    translate([-10-e+0.1, 0])myRenfort(30, 10+e, e);
    
}

module h_corner(vslot = true){
    difference(){
        union(){
            myRoundedBox(h_l+5+2*e, h_lg+5+2*e, e, e);
           
            translate([-10-e, -20-e, 0])cube([20+2*e,40+2*e, 30]);
            
            for(i=[0,1]){
                rotate([0,0,i*180]) translate([0,-17,0])renfort_();
                rotate([0,0,i*180]) translate([0,3,0])renfort_();
                rotate([0,0,i*180]) translate([0,17,0])renfort_();
            }
        }
        
        for(i=[-1,1]){
            for(j=[-1,1]){
                translate([i*h_l/2, j*h_lg/2, -1]) cylinder(r=5/2, e+2);
            }
        }
        
        translate([0,0,e+4]) rotate([0,0,90]) barre2040p(100);
        translate([-50,10-5,e]) cube([100, 10, 3]);
    }
    
    if(vslot){
        for(i=[-1,1]){
            for(j=[-1,1]){
                color("red")translate([i*h_l/2, j*h_lg/2, -10])     vslot2020();
            }
        }
    }
}

module charriot(vslot = true){
    difference(){
        union(){
            myRoundedBox(h_l+5+2*e, h_lg+5+2*e, e, e);
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
    rotate([90,90,0]) barre2040(l-2*e-20, true);
    for(j=[-1,1]){
        translate([0, j*l/2, 0]) rotate([90,90,90]) barre2040(lg, true);
    }
    
    translate([10, x]) rotate([0,90,0]) charriot();
    
    for(i=[0,1]){
        rotate([i*180,0]) translate([lg/2-30,  -l/2+10, -22])nema17_y();
    }
}

mode = 3;
if(mode == 0){
    xy(300,400);
} else if(mode == 1){
    nema17_y();
} else if(mode == 2){
    charriot(false);
} else if(mode == 3){
    nema17_y(false);
} else {
    h_corner(false);
}
    