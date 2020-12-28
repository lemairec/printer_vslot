use <nema17.scad>
use <2020.scad>
use <xy.scad>
use <plateau.scad>


plateau_l = 200;

printer_l = 400;
printer_lg = 350;
printer_h = 600;
printer_bas_h = 35;

plateau_h = 300;
corexy_h = 400;
corexy_y = 200;

color("gray")union(){
    //arriere
    translate([0, 0,10])rotate([0,90,0]) barre2020(printer_l, true);
    for(i=[0,1]){
        mirror([i,0,0])translate([-printer_l/2-20, 0,0])rotate([0,0,90])barre2040(printer_h);
    }
    translate([0, 0,printer_h-10])rotate([0,90,0]) barre2020(printer_l, true);
    
    //devant
    translate([0, -printer_lg-20,10])rotate([0,90,0]) barre2020(printer_l, true);
    for(i=[0,1]){
        mirror([i,0,0])translate([-printer_l/2-20, -printer_lg-20,0])rotate([0,0,90])barre2040(printer_h);
    }
    translate([0, -printer_lg-20,printer_h-10])rotate([0,90,0]) barre2020(printer_l, true);

    //bas
    for(i=[0,1]){
        mirror([i,0,0])translate([-printer_l/2-30,-printer_lg-10,printer_bas_h]) rotate([-90,0,0]) barre2020(printer_lg);
    }
    translate([0,-150,printer_bas_h]) rotate([0,-90,0]) barre2020(printer_l+38, true);
    
    //haut
    for(i=[0,1]){
        mirror([i,0,0])translate([-printer_l/2-30,-printer_lg-10,printer_h-10]) rotate([-90,0,0]) barre2020(printer_lg);
    }

}

//plateau
translate([0, 0,plateau_h])rotate([0,0,-90])plateau(printer_l+20, printer_lg-50);


//corexy
translate([0, -printer_lg/2-10,corexy_h]) rotate([0,0,-90])xy(printer_l+60, printer_lg, -100);


//corexy
for(i=[0,1]){
    color("red") translate([0,0,corexy_h])rotate([0,i*180,0]) 
        translate([-printer_l/2-8,  -printer_lg+12, -45]) nema17();

}
color("red") translate([-printer_l/2+50,  -190, 22])nema17();

