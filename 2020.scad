module barre_in(l){
    k = 10;
    hull(){
        translate([-k/2, -11, -1])cube([k, 0.1, l+2]);
        
        translate([-k/2+3, -8, -1])cube([k-6, 0.1, l+2]);
    }
};



module _barre2040(l=100){
    echo("2040", l);
    difference(){
        translate([-10, -20])cube([20.5, 40.5, l]);
        translate([0, -10]) rotate([0,0,90])barre_in(l);
        translate([0, 10]) rotate([0,0,90])barre_in(l);
        translate([0, -10]) rotate([0,0,-90])barre_in(l);
        translate([0, 10]) rotate([0,0,-90])barre_in(l);
        
        translate([0, -10]) rotate([0,0,0])barre_in(l);
        translate([0, 10]) rotate([0,0,180])barre_in(l);
        
    }
};

module barre2040(l=100,center = false){
    if(center){
        translate([0, 0, -l/2]) _barre2040(l);
    } else {
        _barre2040(l);
    }
};


module _barre2020(l){
    difference(){
        translate([-10, -10])cube([20.5, 20.5, l]);
        translate([0, 0]) rotate([0,0,90])barre_in(l);
        translate([0, 0]) rotate([0,0,-90])barre_in(l);
        translate([0, 0]) rotate([0,0,0])barre_in(l);
        translate([0, 0]) rotate([0,0,180])barre_in(l);
        
        translate([0, -10]) rotate([0,0,0])barre_in(l);
        translate([0, 10]) rotate([0,0,180])barre_in(l);
        
    }
};

module barre2020(l,center = false){
    echo("2020", l);
    if(center){
        translate([0, 0, -l/2]) _barre2020(l);
    } else {
        _barre2020(l);
    }
};


module vslot2020(){
    difference(){
        hull(){
            cylinder(r=25/2, 5, center = true);
            cylinder(r=20/2, 10, center = true);
        }
        cylinder(r=5/2, 12, center = true);
    }
}



//barre2020(100);

