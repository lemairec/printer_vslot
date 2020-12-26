module barre_in(l){
    k = 10;
    hull(){
        translate([-k/2, -11, -1])cube([k, 0.1, l+2]);
        
        translate([-k/2+3, -8, -1])cube([k-6, 0.1, l+2]);
    }
};

module bare2040(l=100){
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