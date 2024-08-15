/*
 * Plug housing for TPDD_Cable
 * v004
 */

// See DEBUGGING at the bottom to enable preview cut-aways.
// They are down there instead of here at the top so that
// you can use calculated values to set the cut plane position.

// ==== CUSTOMIZABLE OPTIONS ====

pcb_version = 3; // 1 2 3

style = "C"; // A B C D JIG TRAY

/*
 JIG - Fancy full-constraint jig to solder the pcb
       to the connector with exact alignment.

 TRAY - Simple open-top tray solder jig

 A - smallest and neatest
     use crimper pliers to squish the cable down to 4.4mm

 B - compromize between A and C
     small as possible but more vertical room for cable

 C - most practical, should be the default but I just like A
     full cable fit with no forcing or crimping
     accepts a 2nd layer of heatshrink with slight effort
     cable rests on top of pcb, mostly, if you pretend the heatshrink isn't there
     handle body is tall enough to come out square with the width, and centered around the cable
     larger cable chamfer
     longer handle, long enough to make zip tie land in the middle

 D - chonky boy, easy to grab
     handle shorter than C and cable not centered vertically
     handle both wider and longer

 Theoretical max cable sizes without deforming.
 For style A, a 5mm cable with one layer of heatshrink can
 be deformed down to 4.4mm tall with crimper pliers.
 The rest should be easy to use without fighting.
 A - ECHO: "cable vertical gap", 4.39
 B - ECHO: "cable vertical gap", 5.48
 C - ECHO: "cable vertical gap", 6.89
 D - ECHO: "cable vertical gap", 6.28

*/

// "min", "tie", or arbitrary
// min = Automatic minimum possible handle length.
//       Handle ends at minimum_rear_wall past the cable tie slot.
// tie = Automatic make the handle however long it takes so that
//       the cable tie lands in the center.
handle_length = (
        style=="B" ? "min" :
        style=="C" ? "tie" :
        style=="D" ? 20 :
        "min");

// If this value is >3, then 1mm is also
// automatically added to the front plug length
// to move the handle 1mm further away from the drive,
// to clear the edge of the recess around the port.
handle_extra_width = (   
        style=="B" ? 0 :
        style=="C" ? 0 :
        style=="D" ? 2 :
        0);

// "square" or arbitrary
// "square" = copy handle width to make the body square
// If the value (arbitrary or generated) is >1, then 1mm
// is also automatically added to the front plug length
// to move the handle 1mm further away from the drive,
// to clear the edge of the recess around the port.
handle_extra_height = (
        style=="B" ? 1 :
        style=="C" ? "square" :
        style=="D" ? handle_extra_width :
        0);

// make the cable pocket this much bigger than
// cable_diameter + heat_shrink_thickness*2
cable_extra_radius = (
        style=="B" ? 1 :
        style=="C" ? 1.5 :
        style=="D" ? 1 :
        1);

// "center", "pcb", or arbitrary
// center = Position the cable in the center of the handle height.
// pcb = Position the cable as though the bare cable
//       (no heat_shrink_thickness or cable_extra_radius)
//       is resting on top of the pcb.
cable_z_position = (
        style=="B" ? 2.5 :
        style=="C" ? "center" :
        style=="D" ? "pcb" :
        "center");

cable_chamfer_depth = (
        style=="B" ? 1 :
        style=="C" ? 2 :
        style=="D" ? 1 :
        1);

// grip_cut_depth automatically adjusts itself
// to avoid violating min-wall-thickness
grip_cut_depth = 1;

grip_chamfer_depth = (
        style=="B" ? 1 :
        style=="C" ? 1.2 :
        style=="D" ? 1.2 :
        1);

// adds space between all parts in all directions
// "SLS", "FDM", or arbitrary
// SLS = 0.1
// FDM = 0.2
fitment_clearance = "SLS";

// Add cylinder cuts to expand the inside corners around the
// 2x4 connector. Should mostly be taken care of well enough
// by fitment_clearance, so should not really be needed.
connector_corner_relief = 0; // 0.35

// "a" or "b"
// Loads 2x4a.stl or 2x4b.stl in preview mode to show both types
// of flux wash standoff shapes at the base of the 2x4 connector.
connector_model = "a";

corner_radius = 0.6;

// Commercial SLS service like Shapeways 0.7mm
minimum_wall_thickness = 0.7;

// Minimum material from cable tie to rear end
// this sets the minimum overall handle length
// based on the location of the zip-tie + N
// if handle_length == "min"
minimum_rear_wall = 2;

// zip tie size M3 or M4
cable_tie_size = (
        pcb_version == 3 ? 4:
        3);

cable_diameter = 5;

// 0 to remove heat-shrink
heat_shrink_thickness = 0.5; //0;

// curve smoothness
$fa = 1;
$fs = 0.1;
//$fn = 72;

// ===============================================================

TRAY = style=="TRAY"?true:false;
JIG = (TRAY||style=="JIG")?true:false;

t = 2.54; // tenth inch
o = 0.1;  // overlap / overcut
mw = minimum_wall_thickness;
cr = JIG?0:corner_radius;

fc = (
  fitment_clearance == "SLS" ? 0.1 :
  fitment_clearance == "FDM" ? 0.2 :
  is_num(fitment_clearance) ? fitment_clearance :
  0.1);

// PCB dimensions
pm = pcb_version;
ph = 1.6;      // pcb thickness

pw = (         // pcb width
  pm==1 ? 10.3:
  pm==2 ? 10.3:
  pm==3 ? 10.4:
  10.3);

pl = (         // pcb length
  pm==1 ? 15:
  pm==2 ? 15:
  pm==3 ? 16:
  15);

pcr = (        // pcb corner radius
  pm==1 ? 2.65:
  pm==2 ? 2.65:
  pm==3 ? 0.5:
  2.65);

ptw = 9.3;     // pcb transistors width

zth2h = (      // zip tie hole to hole
  pm==1 ? 5:
  pm==2 ? 5:
  pm==3 ? 8:
  5);

zty = (        // zip tie position Y from pcb front edge
  pm==1 ? 12.35:
  pm==2 ? 12.35:
  pm==3 ? 13:
  12.35);

pfc = (     // extra fitment clearance for pcb
  JIG ? fc: // jig needs the printer tolerance but no extra
  fc+0.12); // normal needs the printer tolerance plus extra

pcw = pfc+pw+pfc;  // pcb slot full width

// TPDD port dimensions
owl = 13.5;      // outer width lower, horzontal part width

ohl = (          // outer height lower, horizontal part height
  JIG ? 7:
  7.8);

owu = 5.5;       // outer width upper, vertical part width
ohu = 9.5;       // outer height upper, vertical part height
plug_len = 11.5; // length of keyed part

// cable
cor = cable_diameter/2 + heat_shrink_thickness; // cable outside radius
cpd = cable_diameter + cable_extra_radius*2;    // cable pocket diameter
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
hw = hew+owl+hew ;         // handle width

heh = (                    // handle extra height
  handle_extra_height=="square" ? hw-ohu:
  handle_extra_height);

hh = (                     // handle height
  JIG ? ohl :
  ohu+heh);

hz = hh/2-ohb;             // handle center z

cz = (
  //cable_z_position == "pcb"    ? ph/2+cable_diameter/2+heat_shrink_thickness :
  // pretend the heat-shrink doesn't exist
  cable_z_position == "pcb"    ? ph/2+cable_diameter/2 :
  cable_z_position == "center" ? hz :
  cable_z_position);

// zip tie
zbw = cable_tie_size - 0.5; // zip tie band width

zbt = (               // zip tie band thickness
  cable_tie_size==3 ? 1:
  cable_tie_size==4 ? 1.3:
  1);

ztk = (               // zip tie knot cube
  cable_tie_size==3 ? 4.5:
  cable_tie_size==4 ? 6.5:
  4.5);

zfc = fc + 0.1; // zip tie extra fitment clearance
zy = id + zty - pcb_inset; // zip tie absolute Y position
ztr = cpd/2+zbt+zfc; // zip tie outside radius
ztl = zfc+zbw+zfc;   // zip tie cylinder length
ztc = zfc+ztk+zfc;   // zip tie cube

// prevents cable pocket from poking through or making
// a thin wall in the front face of the handle block
cew = 1; // cable end wall thickness

// cavity behind the 2x4 connector
// is this much smaller than the 2x4 connector
ihr = 0.5; // interior height reduction to create a step

ich = ih-ihr ;      // main interior cavity height
icw = pfc+ptw+pfc ; // main interior cavity width
icd = 18.1;         // main interior cavity length

// If the handle body is taller or wider than the recess around
// the port, then automatically add 1mm to front plug length to
// move the handle away from the drive enough to clear the step.
od = plug_len + (
  heh>1?1:
  hew>3?1:
  0);

hlft = zy-od; // handle front face to cable tie center
hd = (        // handle depth (length)
  handle_length=="tie" ? hlft * 2 :
  is_num(handle_length) ? handle_length :
  hlft + ztc/2 + minimum_rear_wall); // "min"

// grips
// either pcw or ztr*2 might be the widest
// interior cavity at the grip cut position
hwt = (hw-max(pcw,ztr*2))/2; // handle wall thickness at thinnest point
gr = hd; // grip cut radius
gd = hwt-mw>grip_cut_depth?grip_cut_depth:hwt-mw; // grip cut depth

ccr = (
  JIG ? max(connector_corner_relief,0.4):
  connector_corner_relief);

// =============================================================

use <inc/handy.scad>

module cable_tie () {
    ri = cor;         // nominal size
    //ri = cpd/2;     // full possible size
    ro = ri + zbt;
    ch = ztk*0.75;
    translate([ch/2+ri,ri,0]) rotate([0,90,0]) rounded_cube(w=ztk,d=ztk,h=ch,rh=0.9,rv=0.4);
    difference() {
      cylinder(r=ro,h=zbw,center=true);
      union() {
        cylinder(r=ri,h=o+zbw+o,center=true);
        translate([0,0,-ro/2-o]) cube(o+ro+o);
      }
    }
    difference() {
      translate([0,0,-zbw/2]) cube([ro,ro,zbw]);
      translate([-zbt,-zbt,-zbw/2-o]) cube([ro,ro,o+zbw+o]);
    }
}

// FITMENT REFERENCE MODELS
//if ($preview) translate([0,-pl/2-id,-ph/2]) %import("pcb.stl");
if ($preview) {
  translate([0,-id,0]) {
    // 2x4 CONNECTOR, 2 styles of flux wash standoff
    cstl = (
      connector_model=="b" ? "inc/2x4b.stl":
      "inc/2x4a.stl");
    color("grey",0.5) %import(cstl);
    // PCB
    translate([0,pcb_inset,0]) {
      pstl = (
        pm==2 ? "inc/pcb2.stl":
        pm==3 ? "inc/pcb3.stl":
        "inc/pcb.stl");
      translate([0,0,-ph/2]) color("green",0.5) %import(pstl);
      // ZIP TIE
      if (!JIG) translate([0,-zty,cz]) rotate([90,0,0]) color("grey",0.5) %cable_tie();
    }
  }
  if (!JIG) translate([0,-od-4,cz]) rotate([90,0,0]) {
    // CABLE
    %cylinder(d=cable_diameter,h=25);
    // HEAT SHRINK
    if (heat_shrink_thickness) %cylinder(d=cable_diameter+heat_shrink_thickness*2,h=20);
  }
}

// HOUSING
difference() {
    // add
    union() {

      // extend plug body into the handle body far enough
      // to prevent any valley from the rounded corners
      xod = od + cr*2+o;

      // front plug horizontal box / 2x4 connector
      translate([0,-xod/2,ohl/2-ohb])
        rounded_cube(w=owl,d=xod,h=ohl,rh=cr,rv=cr);

      // front plug vertical box / polarity key
      if (!JIG) translate([0,-xod/2,ohu/2-ohb])
        rounded_cube(w=owu,d=xod,h=ohu,rh=cr,rv=cr);

      // handle
      translate([0,-od-hd/2,hz])
        rounded_cube(w=hw,d=hd,h=hh,rh=cr,rv=cr);
    }

  // cut
  union() {
    // connector cavity
    _id = id+idx+fc; // connector pocket depth
    translate([0,o/2-_id/2,0])
      cube([fc+iw+fc,_id+o,fc+ih+fc],true);
    // inside corners relief
    if (ccr)
      mirror_copy([0,0,1])
        mirror_copy([1,0,0])
          translate([iw/2+fc,o/2-_id/2,ih/2+fc-ccr])
            rotate([90,0,0])
              cylinder(r=ccr,h=_id+o,center=true);

    // main wiring/components interior cavity
    // TODO: replace ich with seperate top and bottom heights
    // where the bottom is the actual components height
    // to garantee we keep a minimum distance from the transistors
    translate([0,-icd/2,0]) rounded_cube(w=icw,d=icd,h=ich,rh=cr,rv=cr);
    // clearance around the transistors
    _th = ph/2+1.6;
    _cr = min(0.2,cr); // sharper corner to clear the transistors
    translate([0,-id-6.2+pcb_inset,-_th/2]) rounded_cube(w=icw,d=4,h=_th,rh=cr,rv=_cr);

    // pcb slot
    translate([0,o/2+pcb_inset+pcr/2-id/2-pl/2-pfc/2,0])
      rounded_cube(w=pcw,d=pcr+id+pl+o+pfc,h=pfc+ph+pfc,rh=pcr+pfc,rv=pfc);

    // cable
    if (!JIG) translate([0,0,cz]) {
      translate([0,-hd/2-od-cew,0]) rotate([90,0,0]) cylinder(h=hd,r=cpd/2,center=true);
      // funnel
      fr1 = cpd/2-o;  // truncated cone small end is cable diam
      fr2 = fr1+ccd; // big end is small end plus length to make 45 degrees
      translate([0,ccd/2-od-hd-0.001,0]) rotate([90,0,0]) cylinder(h=ccd,r1=fr1,r2=fr2,center=true);
    }

    // grips
    if (gd && !JIG) {
    go = gr+hw/2-gd; // offset
    gch = o+hh+o; // grip cut cyl height
    gcd = grip_chamfer_depth;
    mirror_copy([1,0,0])
      translate([go,-od-hd/2,hz]) {
        cylinder(h=gch,r=gr,center=true);
        mirror_copy([0,0,1])
          cylinder(h=gch,r1=gr-gch+gcd,r2=gr+gcd,center=true);
      }
    }

    // zip tie
    if (!JIG) translate([0,-zy,0]) {
      // band cavity
      // rounded_cube() bug, rh cannot be smaller than rv
      // so this is drawn with depth & height swapped, then rotated
      rotate([90,0,0])
        // make a cavity with curved outer perimeter
        // so ziptie can be pushed in
        hull() {
          _cr = min(cr,0.5); // corner radius just for this part

          // Smooth tangent transitions at entrance & exit.
          // From entrance, travelling down near wall.
          // From exit, across ceiling.
          // Not needed because currently the head slot cuts the
          // cylinder exactly at the center in both Z and X.
          //translate([ztr/2,(cz+ztr)/2,0]) rounded_cube(w=ztr,d=cz+ztr,h=ztl,rh=cr,rv=_cr);
 
          // Across the bottom
          _w = (
            pm==2 ? zbt+zth2h+zbt:
            ztr*2);
          rounded_cube(w=_w,d=ich,h=ztl,rh=2,rv=_cr,t=0);
     
          // Far wall to exit
          difference() {
            // cylinder
            translate([0,cz,0]) rounded_cube(w=ztr*2,d=ztr*2,h=ztl,rh=ztr,rv=_cr);
            // clip bottom so it doesn't cut into floor
            translate([0,-ich/2,0]) cube([o+hw+o,ich,o+ztl+o],true);
          }
      }

      // head/knot
      // The cable diameter and the amount of cinch is variable
      // so we can't fix the exact location of the knot.
      // So the knot pocket is a big slot cutting from the center
      // of the cable all the way out.
      
      // bottom of pocket at greater of cz or pcb+pfc+mw
      // prevents at thin wall between pcb and pocket
      // UGLY HACK: if M4 zip-tie, arbitrarily lower by 1mm
      _b = max(cz,ph/2+pfc+mw) - (cable_tie_size==4?1:0) ;
      translate([hw/2,0,hh/2+_b])
        rounded_cube(w=hw,d=ztc,h=hh,rh=cr,rv=cr);
      
    }


    // JIG
    // If we're making the jig, cut the main opening.
    if (JIG) {
      if (TRAY) {

        // simple open top tray
        translate([0,-(od+hd)/2,hh/2])
          cube([hw+o,od+hd+o,hh],true);

      } else {

        // fancy full-constraint jig
        e=1;    // main window expand beyond connector & pcb
        r=1;    // some corners radius
        sw=e+5; // solder window
        t=1;    // top above pcb
        csd=od+hd;
        csh=hh-ohb+o;
        translate([0,e-csd/2-id,csh/2])
          cube([icw,csd,csh],true);
        translate([0,e-(hd+od)/2-id,hh/2+ph/2+t])
          cube([o+hw+o,hd+od,hh],true);
        translate([0,e-sw/2-id,hh/2])
          rounded_cube(w=r+hw+r,d=sw,h=hh,rh=r,rv=r);
        _r=ph/2+t-r;
        translate([hw/2+o,e-_r-id-sw+0.001,t+0.001])
          rotate([0,-90,0])
            fillet_linear(o=false,l=o+hw+o,r=_r,a=90);
      }
    }

    //===========================================================
    // DEBUGGING
    
    echo("handle height",hh);
    echo("handle width",hw);
    echo("handle length",hd);
    // distance from top of pcb to ceiling of cable pocket
    // with pcb pushed to bottom of pcb fitment clearance
    echo("cable vertical gap",cpd/2+cz-ph/2+pfc);

    preview_cut_side = false;
    preview_cut_X = 0;//-cr;     // where to cut along X
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
