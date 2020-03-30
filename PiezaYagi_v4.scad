anchoBoom = 20.55 - 0.01;
anchoPared = 2.5;
anchoPieza = 12 + 0.2;
radio = 3.15;
longitud = 26;
anchoSlot = 1;
rTornillo = 1.80;
anchoTuerca = 5.54 + 0.05;
pedroConstant = 0; //Aumentar para emplear tornillos más cortos

module huecoM3(){
  rotate([270,90,0]) cylinder(r=3.2 + 0.05,$fn=6,h=3.5);
}

module cuerpo(){
  difference(){
    
    //Cuerpo principal
    union(){
      cube([anchoBoom+2*anchoPared, anchoBoom+anchoPieza+anchoPared, anchoBoom]);
      translate([0,-anchoTuerca-anchoPared,0]) 
        cube([anchoBoom+2*anchoPared,anchoTuerca+anchoPared,anchoBoom]);
    }
  
    //Hueco para el boom
    translate([anchoPared, anchoPared,0])
      cube([anchoBoom, anchoBoom, anchoBoom+2*anchoPared]); 
  
    //Hueco para la varilla
    translate([0,anchoBoom+anchoPared+anchoPieza/2, anchoBoom-anchoPieza/2])
      rotate([0,90,0])
        cylinder(h=anchoBoom+anchoPared*2,r=3.1,$fn=100);
  
   //Slot para apretar la varilla
    translate([0,anchoBoom+anchoPared+anchoPieza/2-anchoSlot/2,0])
      cube([anchoBoom+2*anchoPared,anchoSlot,anchoBoom-anchoPieza/2]); 
    
    //Hueco para centrar la varilla más fácilmente
    translate([(anchoBoom+2*anchoPared-anchoSlot)/2,anchoBoom+anchoPared+anchoPieza/2-anchoSlot/2,anchoBoom-anchoPieza/2-radio])
      cube([anchoSlot,anchoPieza,2*radio]); 
  
    //Huecos de la tuerca y tornillo para apretar la varilla
    translate([(anchoBoom+2*anchoPared)/2, anchoBoom+anchoPared, (anchoBoom-anchoPieza/2-radio)/2])
      huecoM3();
    translate([(anchoBoom+2*anchoPared)/2, anchoBoom+anchoPared, (anchoBoom-anchoPieza/2-radio)/2])
      rotate([270,0,0])
        cylinder(h=anchoPieza,r=rTornillo,$fn=50);
    translate([(anchoBoom+2*anchoPared)/2, anchoBoom+anchoPared+anchoPieza, (anchoBoom-anchoPieza/2-radio)/2])
      rotate([90,0,0])
        cylinder(h=3.1,r=2.8+0.06,$fn=50);///
    
    //Huecos de la tuerca y tornillo para apretar el boom.
    translate([0,-anchoTuerca/2,anchoBoom/2]) rotate([0,0,270])
      huecoM3();
    translate([0,-anchoTuerca/2,anchoBoom/2])
      rotate([270,0,270])
        cylinder(h=anchoBoom+2*anchoPared,r=rTornillo,$fn=50);
    translate([anchoBoom+2*anchoPared,-anchoTuerca/2,anchoBoom/2])
      rotate([90,0,270])
        cylinder(h=3.1+pedroConstant,r=2.8 + 0.06,$fn=50);
    
    //Hueco para apretar el boom.
    translate([(anchoBoom+2*anchoPared-anchoSlot)/2,-anchoTuerca-anchoPared,0])
      cube([anchoSlot,anchoTuerca+2*anchoPared,anchoBoom]);
      
  }
}

mirror([1,0,0]) cuerpo();