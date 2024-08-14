/*
 * Plug housing for TPDD_Cable, PCB v012
 * v003
 */

// See DEBUGGING at the bottom to enable preview cut-aways
// They are down there instead of here at the top so that
// you can use calculated values to set the cut plane position.

// MAIN CUSTOMIZABLE OPTIONS

style = "c"; // a b c d jig

// "jig" - Prints a jig to solder the pcb to the connector
//         with exact alignment.

// "a" - smallest and neatest
//     cable is a very tight fit, requires squish with crimper

// "b" - compromize between A and C

// "c" - most practical, should be the default but I just like A
//     full cable fit with no forcing or crimping
//     accepts a 2nd layer of heatshrink with slight effort
//     cable rests on top of pcb, mostly, if you pretend the heatshrink isn't there
//     handle body is tall enough to come out square with the width, and centered around the cable
//     larger cable chamfer
//     longer handle, long enough to make zip tie land in the middle

// "d" - chonky boy, easy to grab
//     slightly shorter than C
//     handle both wider and longer

// Theoretical max cable sizes without deforming.
// A 5mm cable with one layer of heatshrink can
// be deformed down to 4.4mm with crimper pliers.
// A - ECHO: "max cable", 4.39
// B - ECHO: "max cable", 5.48
// C - ECHO: "max cable", 6.89
// D - ECHO: "max cable", 6.28

handle_length = (
        style=="a" ? 14 :
        style=="b" ? 14 :
        style=="c" ? 15.75 :
        style=="d" ? 20 :
        14);

// if >3, then automatically adds 1 to plug length
// to clear the recess around the port
handle_extra_width = (   
        style=="a" ? 0 :
        style=="b" ? 0 :
        style=="c" ? 0 :
        style=="d" ? 2 :
        0);

// if >1, then automatically adds 1 to plug length
// to clear the recess around the port
// 4.0 results in perfect square if extra_width==0
handle_extra_height = (
        style=="a" ? 0 :
        style=="b" ? 1 :
        style=="c" ? 4 :
        style=="d" ? 2 :
        0);

cable_extra_radius = (
        style=="a" ? 1 :
        style=="b" ? 1 :
        style=="c" ? 1.5 :
        style=="d" ? 1 :
        1);

cable_z_position = (
        style=="a" ? "center" :
        style=="b" ? 2.5 :
        style=="c" ? "center" :
        style=="d" ? "pcb" :
        "center");

cable_chamfer_depth = (
        style=="a" ? 1 :
        style=="b" ? 1 :
        style=="c" ? 2 :
        style=="d" ? 1 :
        1);

// grip_cut_depth automatically adjusts itself
// to avoid violating min-wall-thickness
grip_cut_depth = 1;

grip_chamfer_depth = (
        style=="a" ? 1 :
        style=="b" ? 1 :
        style=="c" ? 1.2 :
        style=="d" ? 1.2 :
        1);

fitment_clearance = "SLS"; // "SLS", "FDM", or arbitrary. def 0.1

// Add cylinder cuts along the inside corners around the
// 2x4 connector because printers can't print perfectly sharp
// inside corners. Should mostly be taken care of well enough
// by fitment_clearance, so should not really be needed.
connector_corner_relief = 0; // 0.35

corner_radius = 0.6;

// Commercial SLS service like Shapeways 0.7mm
minimum_wall_thickness = 0.7;

$fa = 2;
$fs = 0.2;
//$fn = 72;

// ===============================================================

t = 2.54; // tenth inch
o = 0.1;  // overlap / overcut
mw = minimum_wall_thickness;
cr = style=="jig"?0.2:corner_radius;

fc = (
        fitment_clearance == "SLS" ? 0.1 :
        fitment_clearance == "FDM" ? 0.2 :
        is_num(fitment_clearance) ? fitment_clearance :
        0.1);

// PCB dimensions
ph = 1.6;   // pcb thickness
pw = 10.3;  // pcb width
pl = 15;    // pcb length
pcr = 2.65; // pcb corner radius
zth2h = 5;  // zip tie hole to hole

// PCB needs as much room for play as possible because the
// pcb is hand-soldered to the connector.
// style=="jig" prints a tray to lay the pcb & connector in,
// with the pcb fitment clearance artificially
// reduced so that the resulting assembly lands in the middle
// of the normal connectors cavity.
pfc = style=="jig"?fc:fc+0.18; // fitment clearance just for pcb
pcw = pfc+pw+pfc;  // pcb slot full width


// TPDD port dimensions
owl = 13.5;      // outer width lower, horzontal part width
ohl = style=="jig"?7:7.8;       // outer height lower, horizontal part height
owu = 5.5;       // outer width upper, vertical part width
ohu = 9.5;       // outer height upper, vertical part height
plug_len = 11.5; // length of keyed part

// cable
cable_diameter = 5;
heat_shrink_thickness = 0.5;
cd = style=="jig"?5:cable_diameter + cable_extra_radius*2; // cable pocket diameter
ccd = cable_chamfer_depth; // cable chamfer

// 2x4 connector body
iw = t*4+0.5;  // inner width, width of 2x4 connector
ih = t*2;      // inner height, height of 2x4 connector
id = 8.5;      // inner depth, depth of 2x4 connector

// Height of the flux wash standoffs on the 2x4 connector.
pcb_inset = 0.5;

// Add a tiny bit more to the depth of the connector pocket
// to account for inability to print sharp inside corners.
// We don't want to cut corner relief cylinders on the rear wall
// because we need the very edge of the connector
// (the flux wash standoffs) to hit the rear wall.
idx = 0; //fc/2;

// distance from z=0 (center of pcb) to outside bottom
ohb = ih/2+ph/2;   // outer height bottom, 0 to exterior floor

hew = handle_extra_width;  // handle extra width
heh = handle_extra_height; // handle extra height
hw = hew+owl+hew ;         // handle width
hd = handle_length;        // handle depth

hh = style=="jig"?ohl:ohu+heh;  // handle height
hz = hh/2-ohb; // handle center z

cz = (
  //cable_z_position == "pcb"    ? ph/2+cable_diameter/2+heat_shrink_thickness :
  // pretend the heat-shrink doesn't exist
  cable_z_position == "pcb"    ? ph/2+cable_diameter/2 :
  cable_z_position == "center" ? hz :
  cable_z_position);

// zip tie
zbw = 3; // zip tie band width
zbt = 1; // zip tie band thickness
zty = 12.35; // zip tie position Y from pcb front edge
zy = id + zty - pcb_inset; // zip tie Y position
ztk = 4.5; // zip tie knot cube
ztr = cd/2+zbt+fc; // zip tie outside radius
ztl = fc+zbw+fc;   // zip tie cylinder length
ztc = fc+ztk+fc;   // zip tie cube

// prevents cable pocket from poking through or making
// a thin wall in the front face of the handle block
cew = 1; // cable end wall thickness

// cavity behind the 2x4 connector
// is this much smaller than the 2x4 connector
ihr = 0.5; // interior height reduction
iwr = 1; // interior width reduction

ich = ih-ihr ; // main interior cavity height
icw = iw-iwr ; // main interior cavity width
icd = 18.1;    // main interior cavity length

// grips
// either pcw or ztr*2 might be the widest
// interior cavity at the grip cut position
hwt = (hw-max(pcw,ztr*2))/2; // handle wall thickness at thinnest point
gr = hd; // grip cut radius
gd = hwt-mw>grip_cut_depth?grip_cut_depth:hwt-mw; // grip cut depth

// if handle is taller or wider than recess around port
// then automatically add 1mm to front plug length
od = plug_len + (
    heh>1?1:
    hew>3?1:
    0
  );

// =============================================================

use <inc/handy.scad>

// FITMENT REFERENCE MODELS
//if ($preview) translate([0,-pl/2-id,-ph/2]) %import("pcb.stl");
if ($preview) {
  translate([0,-id,0]) {
    // 2x4 CONNECTOR
    color("grey",0.5) %import("inc/2x4a.stl");
    //color("grey",0.5) %import("inc/2x4b.stl");
    translate([0,pcb_inset,0]) {
      // PCB
      translate([0,0,-ph/2]) color("green",0.5) %import("inc/pcb2.stl");
      // ZIP TIE
      _r=cable_diameter/2+heat_shrink_thickness; // include the heatshrink but not the extra
      if (style!="jig") translate([_r,-zty,0.14+cz+_r]) rotate([0,-90,-90]) color("grey",0.5) %import("inc/CableTie_M3_head.stl");
    }
  }
  if (style!="jig") translate([0,-od-4,cz]) rotate([90,0,0]) {
    // CABLE
    %cylinder(d=cable_diameter,h=25);
    // HEAT SHRINK
    %cylinder(d=cable_diameter+heat_shrink_thickness*2,h=20);
  }
}

// HOUSING
difference() {
    // add
    union() {
      // extend plug body by 2*cr+o into handle body
      // to fully overlap the rounded corners
      xod = od + cr*2+o;

      // horizontal
      translate([0,-xod/2,ohl/2-ohb])
        rounded_cube(w=owl,d=xod,h=ohl,rh=cr,rv=cr,t=0);

      // vertical
      if (style!="jig") translate([0,-xod/2,ohu/2-ohb])
        rounded_cube(w=owu,d=xod,h=ohu,rh=cr,rv=cr,t=0);

      // handle
      translate([0,-od-hd/2+o,hz])
        rounded_cube(w=hw,d=hd,h=hh,rh=cr,rv=cr,t=0);
    }

  // cut
  union() {
    // connector cavity
    _id = id+idx+fc; // connector pocket depth
    translate([0,o/2-_id/2,0])
      cube([fc+iw+fc,_id+o,fc+ih+fc],true);
    // inside corner relief
    if (connector_corner_relief)
      mirror_copy([0,0,1])
        mirror_copy([1,0,0])
          translate([iw/2+fc,o/2-_id/2,ih/2+fc-connector_corner_relief])
            rotate([90,0,0])
              cylinder(r=connector_corner_relief,h=_id+o,center=true);

    // main wiring/components interior cavity    
    translate([0,-icd/2,0]) rounded_cube(w=icw,d=icd,h=ich,rh=cr,rv=cr);
    //_l = hd-cew*2-2;
    //_h = hh-ohb-cew;
    //translate([0,-od-cew-_l/2,ohb-ph/2]) rounded_cube(w=icw,d=_l,h=_h,rh=cr,rv=cr);
    // clearance around the transistors
    _th = ph/2+1.6;
    _cr = 0.2; // sharper corner to clear the transistors
    translate([0,-id-6.2+pcb_inset,-_th/2]) rounded_cube(w=icw,d=4,h=_th,rh=cr,rv=_cr);

    // pcb slot
    translate([0,o/2+pcb_inset+pcr/2-id/2-pl/2-pfc/2,0])
      rounded_cube(w=pcw,d=pcr+id+pl+o+pfc,h=pfc+ph+pfc,rh=pcr+pfc,rv=pfc);

    // cable
    if (style!="jig") translate([0,0,cz]) {
      translate([0,-hd/2-od-cew,0]) rotate([90,0,0]) cylinder(h=hd,r=cd/2,center=true);
      // funnel
      fr1 = cd/2-o;  // truncated cone small end is cable diam
      fr2 = fr1+ccd; // big end is small end plus length to make 45 degrees
      translate([0,ccd/2-od-hd,0]) rotate([90,0,0]) cylinder(h=ccd,r1=fr1,r2=fr2,center=true);
    }

    // grips
    if (gd && style!="jig") {
    go = gr+hw/2-gd; // offset
    gch = o+hh+o; // grip cut cyl height
    gcd = grip_chamfer_depth;
    mirror_copy([1,0,0])
      translate([go,-od-hd/2+o,hz]) {
        cylinder(h=gch,r=gr,center=true);
        mirror_copy([0,0,1])
          cylinder(h=gch,r1=gr-gch+gcd,r2=gr+gcd,center=true);
      }
    }

    // zip tie
    if (style!="jig") translate([0,-zy,0]) {

      // band cavity
      // rounded_cube() bug, rh cannot be smaller than rv
      // so this is drawn with depth & height swapped then rotated
      rotate([90,0,0])
        // make a cavity with curved outer perimeter
        // so ziptie can be pushed in
        hull() {
          _cr = 0.5; // corner radius just for this part

          // Smooth transitions at entrance and exit corner.
          // Entrance down near wall. Exit across ceiling.
          // Not needed because currently the head slot cuts the
          // cylinder exactly at the center in both Z and X.
          //translate([ztr/2,(cz+ztr)/2,0]) rounded_cube(w=ztr,d=cz+ztr,h=ztl,rh=cr,rv=_cr,t=0);
 
          // Across the bottom
          rounded_cube(w=zbt+zth2h+zbt,d=ich,h=ztl,rh=2,rv=_cr,t=0);
     
          // Far wall to exit
          difference() {
            // cylinder
            translate([0,cz,0]) rounded_cube(w=ztr*2,d=ztr*2,h=ztl,rh=ztr,rv=_cr,t=0);
            // clip bottom so it doesn't cut into floor
            translate([0,-ich/2,0]) cube([o+hw+o,ich,o+ztl+o],true);
          }
      }

      // head/knot
      // The cable diameter and the amount of cinch is variable
      // so we can't fix the exact location of the knot.
      // So the knot pocket is a big slot cutting all the way
      // out of the body, with the corner at the cable center.
      
      // bottom of pocket at greater of cz or pcb+pfc+mw
      _b = max(cz,ph/2+pfc+mw);
      translate([hw/2,0,hh/2+_b])
        rounded_cube(w=hw,d=ztc,h=hh,rh=cr,rv=cr,t=0);
      
    }


    if (style=="jig") {
      csw=icw;
      csd=20;
      csh=hh-ohb+o;
      translate([0,-csd/2-id+1,csh/2]) cube([csw,csd,csh],true);
    }

    //===========================================================
    // DEBUGGING
    
    echo("handle height",hh);
    echo("handle width",hw);
    // with pcb pushed to bottom of pcb fitment clearance
    // distance from pcb top surface to cable pocket ceiling
    echo("max cable",cd/2+cz-ph/2+pfc);

    preview_cut_side = false;
    preview_cut_X = -cr;     // where to cut along X
    //preview_cut_X = iw/2;

    preview_cut_rear = false;
    preview_cut_Y = zy;    // where to cut along Y

    preview_cut_top = false;
    preview_cut_Z = 0;     // where to cut along Z
    //preview_cut_Z = ih/2;

    // cut on X
    if (preview_cut_side && $preview) {
      csw=hw/2-preview_cut_X+o;
      csd=o+od+hd+o;
      csh=o+hh+o;
      translate([-csw/2-preview_cut_X,-csd/2+o,hz]) cube([csw,csd,csh],true);
    }

    // cut on Y
    if (preview_cut_rear && $preview) {
      csw=o+hw+o;
      csd=od+hd-preview_cut_Y+o;
      csh=o+hh+o;
      translate([0,-csd/2-preview_cut_Y,hz]) cube([csw,csd,csh],true);
    }

    // cut on Z
    if (preview_cut_top && $preview) {
      csw=o+hw+o;
      csd=o+od+hd+o;
      csh=hh-ohb-preview_cut_Z+o;
      translate([0,-csd/2+o,csh/2+preview_cut_Z]) cube([csw,csd,csh],true);
    }

    //===========================================================

  }
}
