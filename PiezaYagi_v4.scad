anchoBoom = 20.55 - 0.01;
anchoPared = 2.5;
anchoPieza = 12 + 0.2;
radio = 3.15;
longitud = 26;
anchoSlot = 1;
rTornillo = 1.80;
anchoTuerca = 5.54 + 0.05;

module huecoM3(){
  rotate([270,90,0]) cylinder(r=3.2 + 0.05,$fn=6,h=3.5);
}

module cuerpo(){
  difference(){
    union(){
      cube([anchoBoom+2*anchoPared, anchoBoom+anchoPieza+anchoPared, anchoBoom]);
      translate([0,-anchoTuerca-anchoPared,0]) 
        cube([anchoBoom+2*anchoPared,anchoTuerca+anchoPared,anchoBoom]);
    }
  
    translate([anchoPared, anchoPared,0])
      cube([anchoBoom, anchoBoom, anchoBoom+2*anchoPared]);
  
    translate([0,anchoBoom+anchoPared+anchoPieza/2, anchoBoom-anchoPieza/2])
      rotate([0,90,0])
        cylinder(h=anchoBoom+anchoPared*2,r=3.1,$fn=100);
  
    translate([0,anchoBoom+anchoPared+anchoPieza/2-anchoSlot/2,0])
      cube([anchoBoom+2*anchoPared,anchoSlot,anchoBoom-anchoPieza/2]);
  
    translate([(anchoBoom+2*anchoPared)/2, anchoBoom+anchoPared, (anchoBoom-anchoPieza/2-radio)/2])
      huecoM3();
    translate([(anchoBoom+2*anchoPared)/2, anchoBoom+anchoPared, (anchoBoom-anchoPieza/2-radio)/2])
      rotate([270,0,0]) cylinder(h=anchoPieza,r=rTornillo,$fn=50);
    translate([(anchoBoom+2*anchoPared)/2, anchoBoom+anchoPared+anchoPieza, (anchoBoom-anchoPieza/2-radio)/2])
      rotate([90,0,0]) cylinder(h=3.1,r=2.8+0.06,$fn=50);///
    
    translate([0,-anchoTuerca/2,anchoBoom/2])rotate([0,0,270])
      huecoM3();
    translate([0,-anchoTuerca/2,anchoBoom/2])rotate([0,0,270])
      rotate([270,0,0])
        cylinder(h=anchoBoom+2*anchoPared,r=rTornillo,$fn=50);
    translate([anchoBoom+2*anchoPared,-anchoTuerca/2,anchoBoom/2])
      rotate([90,0,270])
        cylinder(h=3.1,r=2.8 + 0.06,$fn=50);
        
    translate([(anchoBoom+2*anchoPared-anchoSlot)/2,-anchoTuerca-anchoPared,0])cube([anchoSlot,anchoTuerca+2*anchoPared,anchoBoom]);
  }
}

mirror([1,0,0]) cuerpo();