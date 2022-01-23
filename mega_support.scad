include <../../config.scad>

mega_l = 105;
mega_lg = 55;
mega_pts = [[-40,-48/2], [35,-48/2], [-40-7,48/2], [35,48/2]];

module fixation_mega_2d(){
    translate([-40,48/2+5])rotate([0,0,90])fixation_2d();
    translate([35,48/2+5])rotate([0,0,90])fixation_2d();
    translate([-40-7,-48/2-5])rotate([0,0,90])fixation_2d();
    translate([35,-48/2-5])rotate([0,0,90])fixation_2d();
}

module fixation_mega_2d_vis(){
    r = 3/2;
    for(pt = mega_pts){
        translate(pt) circle(r);
    };
}

module pin(nb_l, nb_lg = 1){
    e = 2.56;
    l = nb_l*e;
    lg = nb_lg*e;
    h = 10;
    difference(){
        translate([0, 0]) cube([l, lg, 10]);
        for(i = [0:nb_l-1]){
            for(j = [0:nb_lg-1]){
                translate([e*(i+1/2), e*(j+1/2), 1]) cylinder(r = 0.5, 11);
            }
        }
    }
}

module mega(){
    difference(){
        union(){
            translate([-mega_l/2, -mega_lg/2]) cube([mega_l, mega_lg, 1]);
            translate([-38, -24-1.2]) pin(26);
            translate([-43, 24-1.2]) pin(24);
            translate([-50, -24-1.2]) pin(2,18);
        }
        for(pt = mega_pts){
            translate(pt) cylinder(r=3/2, 3, center = true);
        };
    }
}

module support_mega(){
    difference(){
        translate([-mega_l/2-25, -mega_lg/2]) cube([mega_l+12, mega_lg, 2]);
        for(pt = mega_pts){
            translate(pt) cylinder(r=1.6, 10, center = true);
        };
        for(i = [-1,1]){
            translate([-72, i*20,0]) cylinder(r=2.6, 10, center = true);
        };
    }
    
    
}
//support_mega();


module support_mega2(){
    difference(){
        union(){
            translate([-mega_l/2, -mega_lg/2-12]) cube([mega_l, mega_lg+12, 2]);
            for(pt = mega_pts){
                translate(pt) cylinder(r=4, 5);
            };
        }
        for(pt = mega_pts){
            translate(pt) cylinder(r=1.6, 15, center = true);
        };
        for(i = [-1,1]){
            translate([i*40, -mega_lg/2-6,0]) cylinder(r=2.6, 15, center = true);
        };
    }
    
    
}
support_mega2();