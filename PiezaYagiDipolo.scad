anchoBoom = 20.55 - 0.01;
anchoPared = 2.5;
anchoPieza = 12 + 0.2;
altoPieza = anchoBoom + 2*anchoPared; //24;
radio = 3.15;
longitud = 26;
anchoSlot = 1;
rTornillo = 1.80;
anchoTuerca = 5.54 + 0.05;
anchoCorte = 0.1;
rMalla = 1.50/2 + 0.05;
rAislante = 2.8/2;
rCobre = 1/2;

prueba = 0;

module huecoM3(){
  rotate([270,90,0]) cylinder(r=3.2 + 0.05,$fn=6,h=3.5);
}

module cuboChaflan(x,y,z,r){
  if(r<=0)
    cube([x,y,z]);
  else{
    linear_extrude(height = z, convexity = 10, $fn = 10)
      polygon(points=[[r,0],[x-r,0],[x,r],[x,y-r],[x-r,y],[r,y],[0,y-r],[0,r]]);
  }
}

module cuerpo(){
  difference(){
    // Cuerpo principal
    union(){
      cube([anchoBoom+2*anchoPared, anchoBoom+anchoPieza+anchoPared, altoPieza]);
      translate([0,-anchoTuerca-anchoPared,0]) 
        cube([anchoBoom+2*anchoPared,anchoTuerca+anchoPared,altoPieza]);
      
      difference(){
        translate([anchoBoom/2+anchoPared,1,0])
          rotate([0,0,45])
            cuboChaflan(35,35,altoPieza,3);
        translate([-anchoBoom/2,anchoBoom+anchoPared+anchoPieza,0])
          cube([3*anchoBoom,2*anchoBoom,altoPieza]);
      }
    }
    
    // Hueco boom
    translate([anchoPared, anchoPared,0])
      cube([anchoBoom, anchoBoom, altoPieza]);
  
    // Hueco dipolo
    translate([anchoBoom/2+2*anchoPared-0.2, anchoBoom+anchoPared+anchoPieza/2, altoPieza/2])
      rotate([0,90,0])
        cylinder(h=2*anchoBoom,r=3.1,$fn=100);
    translate([anchoBoom/2+0.2, anchoBoom+anchoPared+anchoPieza/2, altoPieza/2])
      rotate([0,270,0])
        cylinder(h=2*anchoBoom,r=3.1,$fn=100);
    
    // Huecos cables
    translate([anchoBoom/2 - rAislante + 0.2, anchoBoom+anchoPared+anchoPieza/2, altoPieza/2]){
      rotate([0,180,0])
        cylinder(h=2*anchoBoom,r=rMalla,$fn=50);
        rotate([0,90,0])
          rotate_extrude(convexity = 10, $fn = 100)
            translate([3, 0, 0])
              circle(r = rMalla, $fn = 50);
    }
    translate([anchoBoom/2 + rAislante+2*anchoPared - 0.2, anchoBoom+anchoPared+anchoPieza/2, altoPieza/2]){
      rotate([0,180,0])
        cylinder(h=2*anchoBoom,r=rAislante,$fn=50);
        rotate([0,90,0])
          rotate_extrude(convexity = 10, $fn = 100)
            translate([3, 0, 0])
              circle(r = rCobre, $fn = 50);
  }

    //Corte tapa
    translate([-anchoBoom,anchoBoom+anchoPared+anchoPieza/2-anchoCorte/2,0])
      cube([3*anchoBoom+anchoPared,anchoCorte+prueba,altoPieza]);
  
    //Tornillos
    translate([anchoBoom/2 + anchoPared, anchoBoom+anchoPared, 6])
      huecoM3();
    translate([anchoBoom/2 + anchoPared, anchoBoom+anchoPared, 6])
      rotate([270,0,0]) cylinder(h=anchoPieza,r=rTornillo,$fn=50);
    translate([anchoBoom/2 + anchoPared, anchoBoom+anchoPared+anchoPieza, 6])
      rotate([90,0,0]) cylinder(h=3.1,r=2.8+0.06,$fn=50);
      
    /*translate([anchoBoom-anchoPared, anchoBoom+anchoPared, 6])
      huecoM3();
    translate([anchoBoom-anchoPared, anchoBoom+anchoPared, 6])
      rotate([270,0,0]) cylinder(h=anchoPieza,r=rTornillo,$fn=50);
    translate([anchoBoom-anchoPared, anchoBoom+anchoPared+anchoPieza, 6])
      rotate([90,0,0]) cylinder(h=3.1,r=2.8+0.06,$fn=50);*/
    
    translate([3*anchoPared, anchoBoom+anchoPared, altoPieza - 6])
      huecoM3();
    translate([3*anchoPared, anchoBoom+anchoPared, altoPieza - 6])
      rotate([270,0,0]) cylinder(h=anchoPieza,r=rTornillo,$fn=50);
    translate([3*anchoPared, anchoBoom+anchoPared+anchoPieza, altoPieza - 6])
      rotate([90,0,0]) cylinder(h=3.1,r=2.8+0.06,$fn=50);
      
    translate([anchoBoom-anchoPared, anchoBoom+anchoPared, altoPieza - 6])
      huecoM3();
    translate([anchoBoom-anchoPared, anchoBoom+anchoPared, altoPieza - 6])
      rotate([270,0,0]) cylinder(h=anchoPieza,r=rTornillo,$fn=50);
    translate([anchoBoom-anchoPared, anchoBoom+anchoPared+anchoPieza, altoPieza - 6])
      rotate([90,0,0]) cylinder(h=3.1,r=2.8+0.06,$fn=50);
    
    // Sujección al boom
    translate([0,-anchoTuerca/2,altoPieza/2])rotate([0,0,270])
      huecoM3();
    translate([0,-anchoTuerca/2,altoPieza/2])rotate([0,0,270])
      rotate([270,0,0])
        cylinder(h=anchoBoom+2*anchoPared,r=rTornillo,$fn=50);
    translate([anchoBoom+2*anchoPared,-anchoTuerca/2,altoPieza/2])
      rotate([90,0,270])
        cylinder(h=3.1,r=2.8 + 0.06,$fn=50);  
    translate([(anchoBoom+2*anchoPared-anchoSlot)/2,-anchoTuerca-anchoPared,0])cube([anchoSlot,anchoTuerca+2*anchoPared,altoPieza]);
  }
  
 
  
  
  
}

mirror([1,0,0]) cuerpo();