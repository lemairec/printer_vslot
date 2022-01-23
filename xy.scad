use <nema17.scad>
use <inc/2020.scad>
use <inc/rounded_box.scad>
use <../piece3d/config.scad>

//translate([-35, -30,0])import("hbar.stl");
r_vis = 5.4/2;
h_l = 60;
h_lg = 60;
e=4;

module renfort_(){
    translate([-10-e+0.1, -e/2]) hull(){
        translate([-20, 0])cube([20,e,e]);
        translate([-10,0,30-e])cube([10,e,e]);
    }
}

module h_corner(vslot = true){
    difference(){
        union(){
            myRoundedBox(h_l+5+2*e, h_lg+5+2*e, e, e);
           
            translate([-10-e, -20-e, 0])cube([20+2*e,40+2*e, 30]);
            
            for(i=[0,1]){
                rotate([0,0,i*180]) translate([0,-10-e,0])renfort_();
                rotate([0,0,i*180]) translate([0,0,0])renfort_();
                rotate([0,0,i*180]) translate([0,10+e,0])renfort_();
            }
        }
        
        for(i=[-1,1]){
            for(j=[-1,1]){
                translate([i*h_l/2, j*h_lg/2, -1]) cylinder(r=5/2, e+2);
            }
        }
        
        translate([0,0,e+4]) rotate([0,0,90]) barre2040p(100);
        for(i=[0,1]){
            mirror([0,i,0])translate([-50,10-8,e]) cube([100, 10, 3]);
            %mirror([0,i,0])translate([-50,10-8,e]) cube([100, 10, 3]);
            
            %mirror([i,0,0])translate([21,0,18]) rotate([90,0,0])cylinder(r=5, 100, center = true);
            mirror([i,0,0])translate([21,0,18]) rotate([90,0,0])cylinder(r=1.6, 100, center = true);
        }
        
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
            myRoundedBox(h_l+5+2*e, 80+5+2*e, e+1, e+1);
            for(i=[-1,1]){
                for(j=[-1,1]){
                    translate([i*h_l/2, j*80/2, 0]) cylinder(r=6, e+8);
                }
            }
        }
        
        for(i=[-1,1]){
            for(j=[-1,1]){
                translate([i*h_l/2, j*80/2, -1]) cylinder(r=2.6, e+10);
            }
        }
        
        for(i=[-1,1]){
            for(j=[-1,1]){
                translate([i*h_l/2, j*10, 7]) rotate([180,0,0]) m4(10,true);
                translate([i*h_l/2, j*30, 7]) rotate([180,0,0]) m4(10,true);
                translate([0, j*10, 7]) rotate([180,0,0]) m4(10,true);
                translate([0, j*30, 7]) rotate([180,0,0]) m4(10,true);
                
                translate([i*10, j*25, 6]) rotate([180,0,0]) m3(10,true);
                translate([i*10, j*35, 6]) rotate([180,0,0]) m3(10,true);
                translate([i*10, j*15, 6]) rotate([180,0,0]) m3(10,true);
                translate([i*10, j*5, 6]) rotate([180,0,0]) m3(10,true);
                
            }
        }
        
        for(i=[0,1]){
            for(j=[0,1]){
                mirror([0,j,0]) mirror([i,0,0])translate([20, 41, 7]) rotate([180,0,30]) m4(10,true);
                mirror([0,j,0]) mirror([i,0,0])translate([e/2, 39, -1]) cube([10, 4, 40]);
            }
        }
    }
    
    for(i=[-1,1]){
        for(j=[-1,1]){
            //color("red")translate([i*h_l/2, j*h_lg/2, -10])     vslot2020();
        }
    }
    %translate([0,0, 7]) rotate([180,0,0]) m4(10,true);

   
}

module grand_charriot(vslot = true){
    l_charriot = 110;
    x_courroie = 50;
    difference(){
        union(){
            myRoundedBox(h_l+5+2*e, l_charriot, e+1, e+1);
            for(i=[-1,1]){
                for(j=[-1,1]){
                    translate([i*h_l/2, j*80/2, 0]) cylinder(r=6, e+8);
                }
            }
        }
        
        for(i=[-1,1]){
            for(j=[-1,1]){
                translate([i*h_l/2, j*80/2, -1]) cylinder(r=2.6, e+10);
            }
        }
        
        for(i=[-1,1]){
            for(j=[-1,1]){
                translate([i*h_l/2, j*10, 7]) rotate([180,0,0]) m4(10,true);
                translate([i*h_l/2, j*30, 7]) rotate([180,0,0]) m4(10,true);
                translate([0, j*10, 7]) rotate([180,0,0]) m4(10,true);
                translate([0, j*30, 7]) rotate([180,0,0]) m4(10,true);
                
                translate([i*10, j*25, 6]) rotate([180,0,0]) m3(10,true);
                translate([i*10, j*35, 6]) rotate([180,0,0]) m3(10,true);
                translate([i*10, j*15, 6]) rotate([180,0,0]) m3(10,true);
                translate([i*10, j*5, 6]) rotate([180,0,0]) m3(10,true);
                
            }
        }
        
        for(i=[0,1]){
            mirror([0,i,0])translate([0, x_courroie, 7]) rotate([180,0,30]) m4(10,true);
            for(j=[0,1]){
                mirror([0,j,0]) mirror([i,0,0])translate([20, x_courroie, 7]) rotate([180,0,30]) m4(10,true);
                mirror([0,j,0]) mirror([i,0,0])translate([5, x_courroie-2, -1]) cube([10, 4, 40]);
            }
        }
    }
    
    if(vslot){

        for(i=[-1,1]){
            for(j=[-1,1]){
                color("red")translate([i*h_l/2, j*80/2, 18])     vslot2020();
            }
        }
          
    }

   
}

module support_courroie(){
    l_charriot = 110;
    x_courroie = 50;
    difference(){
        union(){
            translate([-25, -5, 0]) cube([50,10,e]);
        }
        
        for(j=[0,1]){
            for(i=[-3:3]){
                mirror([j,0,0])translate([e/2, i*2, e-1]) cube([8,1.4,10]);
            }
        }
        
        for(j=[0,1]){
            mirror([j,0,0])translate([-20, 0, -1]) m4(100);
        }
    }

   
}

module tendeur(){
    difference(){
        union(){
            translate([-20-e,0, 0]) cube([40+2*e, e,20]);
            translate([-e/2,0, 0]) cube([e,20, 20]);
            for(i=[0,1]){
                mirror([i,0,0])translate([+e/2+10,0, 0]) cube([e,20, 20]);
            }
            for(i=[0,1]){
                mirror([i,0,0])translate([20,-20, 0]) cube([e,20, 20]);
            }
        }
        
        for(i=[0,1]){
            %mirror([i,0,0]) translate([+e/2, 12,10]) rotate([0,90,0])cylinder(r=5, 10);
        }
        translate([+e/2, 12,10]) rotate([0,90,0])cylinder(r=1.6, 40, center =true);
        translate([+e/2, -10,10]) rotate([0,90,0])cylinder(r=2.6, 60, center =true);
        for(i=[0,1]){
            %mirror([i,0,0]) translate([-10, 0,0]) cylinder(r=2.6, 10);
        }
    }
    
    for(i=[-1,1]){
        for(j=[-1,1]){
            //color("red")translate([i*h_l/2, j*h_lg/2, -10])     vslot2020();
        }
    }

   
}

module tendeur2(){
    difference(){
        union(){
            translate([-30,0, 0]) cube([60, e,20]);
            translate([-e/2,0, 0]) cube([e,20, 20]);
            for(i=[0,1]){
                mirror([i,0,0])translate([+e/2+10,0, 0]) cube([e,20, 20]);
            }
        }
        
        for(i=[0,1]){
            %mirror([i,0,0]) translate([+e/2, 13,10]) rotate([0,90,0])cylinder(r=5, 10);
        }
        translate([+e/2, 13,10]) rotate([0,90,0])cylinder(r=1.6, 40, center =true);
        for(i=[0,1]){
            %mirror([i,0,0]) translate([-10, 0,0]) cylinder(r=2.6, 10);
        }
        for(i=[0,1]){
            mirror([i,0,0]) translate([23, -10,10]) rotate([90,0,0])cylinder(r=2.6, 60, center =true);
        }
    }
    
    for(i=[-1,1]){
        for(j=[-1,1]){
            //color("red")translate([i*h_l/2, j*h_lg/2, -10])     vslot2020();
        }
    }

   
}


module support_extruder(){
    difference(){
        translate([0,-30]) cube([42, 70, 10]);
        for(i=[0,1]){
            mirror([0,i])translate([-5, 25, 5]) rotate([0,90,0]) cylinder(r=1.6, 60);
        }
        
        for(i=[-1,1]){
            translate([7, 7+i*55/2, -1]) cylinder(r=2, 60);
            translate([7+15, 7+i*55/2, -1]) cylinder(r=2, 60);
            translate([7+30, 7+i*55/2, -1]) cylinder(r=2, 60);
        }
    }
}

module xy(l=300, lg=200, x = 10){
    for(i=[0,1]){
        mirror([0,i])rotate([90,0,0]) translate([0, 0, -l/2+10]) h_corner();
    }
    rotate([90,90,0]) barre2040(l-2*e-20, true);
    for(j=[-1,1]){
        translate([0, j*l/2, 0]) rotate([90,90,90]) barre2040(lg, true);
    }
    
    translate([-18, x]) rotate([0,90,0]) grand_charriot(true);
    translate([18, x])rotate([0,-90,0]) grand_charriot(false);
    translate([18, x]) support_extruder();
    
    for(i=[0,1]){
        mirror([0,i]) translate([lg/2-30,  -l/2+10, -22])nema17_y();
    }
    for(i=[0,1]){
        mirror([0,i]) translate([-lg/2-30,  -l/2+10, -0])rotate([0,90,0])tendeur2();
    }
}

mode = 3;
if(mode == 0){
    xy(300,400);
} else if(mode == 1){
    nema17_y();
} else if(mode == 2){
    mirror([1,0,0])nema17_y();
}else if(mode == 3){
    //grand_charriot();
    translate([0,60,0])support_courroie();
} else if(mode == 4){
    h_corner(false);
} else if(mode == 5){
    support_extruder();
} else {
   rotate([90,0,0])tendeur2();
}
    