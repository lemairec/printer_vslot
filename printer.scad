use <nema17.scad>
use <2020.scad>
use <xy.scad>


plateau_l = 200;

printer_l = 400;
printer_lg = 300;
printer_h = 500;

plateau_h = 300;
corexy_h = 350;
corexy_y = 200;

color("gray")union(){
    //arriere
    translate([0, 0,10])rotate([0,90,0]) barre2020(printer_l, true);
    for(i=[0,1]){
        mirror([i,0,0])translate([-printer_l/2-21, 0,0])rotate([0,0,90])barre2040(printer_h);
    }
    translate([0, 0,printer_h-10])rotate([0,90,0]) barre2020(printer_l, true);
    
    //devant
    translate([0, printer_lg+20,10])rotate([0,90,0]) barre2020(printer_l, true);
    for(i=[0,1]){
        mirror([i,0,0])translate([-printer_l/2-21, printer_lg+20,0])rotate([0,0,90])barre2040(printer_h);
    }
    translate([0, printer_lg+20,printer_h-10])rotate([0,90,0]) barre2020(printer_l, true);

    //bas
    for(i=[0,1]){
        mirror([i,0,0])translate([-printer_l/2-30,11,10]) rotate([-90,0,0]) barre2020(printer_lg);
    }
    translate([0,150,10]) rotate([0,-90,0]) barre2020(printer_l+38, true);
    
    //haut
    for(i=[0,1]){
        mirror([i,0,0])translate([-printer_l/2-30,10,printer_h-10]) rotate([-90,0,0]) barre2020(printer_lg);
    }

}

//plateau
translate([-printer_l/2+45, 0,plateau_h])rotate([90,0,90])barre2040(printer_l-90);
for(i=[0,1]){
    mirror([i,0,0])translate([-printer_l/2+80, 11,plateau_h]) rotate([-90,0,0]) barre2040(printer_lg-40);
}

translate([-plateau_l/2,80,20+plateau_h]) cube([plateau_l,plateau_l,2]);


xy();


//corexy
translate([-printer_l/2+45, corexy_y,corexy_h])barre2040(printer_l-90);
for(i=[0,1]){
    mirror([i,0,0])translate([-printer_l/2+20, 21,corexy_h]) rotate([0,0,90]) barre2040(printer_lg-42);
}

for(i=[0,1]){
    translate([0,0,corexy_h+20])rotate([0,i*180,0]) translate([-printer_l/2+35,  45, -40])nema17();

}
translate([-printer_l/2+50,  190, 22])nema17();

