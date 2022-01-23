use <inc/2020.scad>
use <xy.scad>
use <plateau.scad>

$fa=$fa*2;
$vpd= 3500;

plateau_l = 200;

printer_l = 400;
printer_lg = 400;
printer_h = 500;
printer_bas_h = 35;

plateau_h = 300;
corexy_h = 400;
corexy_y = 200;

union(){
    //arriere
    translate([0, 20,printer_h-10])rotate([0,90,0]) barre2020(printer_l+80, true);
    translate([0, 0,printer_h-10])rotate([0,90,0]) barre2020(printer_l+0, true);
    translate([0, 20,10])rotate([0,90,0]) barre2020(printer_l+80, true);
    for(i=[0,1]){
        mirror([i,0,0])translate([-printer_l/2-20, 0,0])rotate([0,0,0])barre2040(printer_h);
    }
    
    //devant
    translate([0, -printer_lg-20,10])rotate([0,90,0]) barre2020(printer_l, true);
    translate([0, -printer_lg-20,printer_h-10])rotate([0,90,0]) barre2020(printer_l, true);
    for(i=[0,1]){
        mirror([i,0,0])translate([-printer_l/2-20, -printer_lg-20,0])rotate([0,0,0])barre2040(printer_h);
    }
    
    //bas
    for(i=[0,1]){
        mirror([i,0,0])translate([-printer_l/2-30,-printer_lg-10,printer_bas_h]) rotate([-90,0,0]) barre2020(printer_lg);
    }
    translate([0,-150,printer_bas_h]) rotate([0,-90,0]) barre2020(printer_l+38, true);
    
    //haut
    for(i=[0,1]){
        //mirror([i,0,0])translate([-printer_l/2-30,-printer_lg-10,printer_h-10]) rotate([-90,0,0]) barre2020(printer_lg);
    }

}

//plateau
echo("plateau");
translate([0, 0,plateau_h])rotate([0,0,-90])plateau(printer_l+20, printer_lg-50);


//corexy
echo("corexy");
translate([0, -printer_lg/2-10,corexy_h]) rotate([0,0,-90])xy(printer_l+60, printer_lg, -100);

