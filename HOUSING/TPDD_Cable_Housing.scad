/*
 * Plug housing for TPDD_Cable
 * v006
 */

// See DEBUGGING at the bottom to enable preview cut-aways.
// They are down there instead of up here so that you can
// use calculated variables to set the cut plane position.

// ==== CUSTOMIZABLE OPTIONS ====

// default pcb 2 style c

pcb_version = 2; // 1 2 3

style = "C"; // A B C D JIG TRAY

/*
 JIG - Fancy full-constraint jig to solder the pcb
       to the connector with exact alignment.

 TRAY - Simple open-top tray solder jig

 A - smallest and neatest
     Not actually usable except with thin (4mm) cable
     and no heat shrink.

 B - attempt to compromize between A and C
     small as possible but a bit more vertical room for cable

 C - most practical
     full cable fit with no forcing
     even possibly a 2nd layer of heatshrink

 D - chonky boy, easy to grab
     handle shorter than C and cable not centered vertically
     handle both wider and longer

 Theoretical max cable sizes without deforming.
 For style A, a 5mm cable with one layer of heatshrink can
 be deformed enough to fit with crimper pliers.
 Cables2Go #03019 & #02518 are only 3.8mm diameter.
 
 A - ECHO: "cable vertical gap", 4.02
 B - ECHO: "cable vertical gap", 5.42
 C - ECHO: "cable vertical gap", 6.52
 D - ECHO: "cable vertical gap", 6.22

*/

// "min", "tie", or arbitrary
// min = Automatic minimum possible handle length.
//       Handle ends at minimum_rear_wall past the cable tie slot.
// tie = Automatic make the handle however long it takes so that
//       the cable tie lands in the center.
handle_length = (
        style=="B" ? "min" :
        style=="C" ? "min" :
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
// cable + heat shrink
cable_extra_radius = (
        style=="B" ? 0.5 :
        style=="C" ? 1.2 :
        style=="D" ? 0.5 :
        0.5);

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
        style=="C" ? 1.5 :
        style=="D" ? 1 :
        1);

// the vertical cylindrical cuts on the sides
// grip_cut_depth tries for this,
// but automatically adjusts itself
// to avoid violating min-wall-thickness
grip_cut_depth = (
        style=="C" ? 0 :
        1);

// The conical cuts on the top & bottom corners.
// This really depends on what grip_cut_depth actually
// resolves to after adjusting itself to min_wall_thickness.
// Maybe it should be an adjustment value added to grip_cut_depth?
grip_chamfer_depth = (
        style=="B" ? 0.8 :
        style=="C" && pcb_version == 1 ? 0.8 :
        style=="C" && pcb_version == 2 ? 0 :
        style=="C" && pcb_version == 3 ? 1.2 :
        style=="D" ? 1.3 :
        0.8);

// adds space between all parts in all directions
// "SLS", "FDM", or arbitrary
// SLS = 0.1
// FDM = 0.2
fitment_clearance = "SLS";

// "a" or "b"
// Loads 2x4a.stl or 2x4b.stl in preview mode to show both types
// of flux wash standoff shapes at the base of the 2x4 connector.
connector_model = "a";

corner_radius = 0.8;

// Commercial SLS/MJF often 0.8mm
minimum_wall_thickness = 0.8;

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
$fa = 12;
$fs = corner_radius/PI;
//$fn = 36;

// ===============================================================

TRAY = style=="TRAY"?true:false;
JIG = (TRAY||style=="JIG")?true:false;

t = 2.54; // tenth inch
o = 0.1;  // overlap / overcut
e = 0.001; // epsilon
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
//  pm==1 ? 10.4:
  pm==2 ? 10.3:
  pm==3 ? 10.4:
  10.4);

pw2 = (        // pcb width 2
  pm==1 ? 8.5:
  0);

pl = (         // pcb length
//  pm==1 ? 13.25:
  pm==2 ? 15:
  pm==3 ? 16:
  7.8);

pl2 = (        // pcb length 2
  pm==1 ? 13.25:
  0);

pty = (        // pcb transistors center Y from pcb edge
  pm==2 ? 6.2:
  pm==3 ? 6.2:
  4.655);

pwy = (        // wires furthest Y from pcb edge
  pm==2 ? 10.1:
  pm==3 ? 10.1:
  8.075);

pcr = (        // pcb corner radius
//  pm==1 ? 0.75:
  pm==2 ? 2.65:
  pm==3 ? 0.5:
  0.75);

ptw = 9.3;     // pcb transistors width

components_height = 1.4; // TO-236-3, SC-59, SOT-23-3

h2h = (        // zip tie hole to hole
//  pm==1 ? 0:
  pm==2 ? 5:
//  pm==3 ? 0:
  0);

zty = (        // zip tie position Y from pcb front edge
//  pm==1 ? 10.25:
  pm==2 ? 12.35:
  pm==3 ? 13:
  10.25);

pfc = (     // extra fitment clearance for pcb
  JIG ? fc: // jig needs the printer tolerance but no extra
  fc+0.12); // normal needs the printer tolerance plus extra

pcw = pfc+pw+pfc;  // pcb slot full width

// TPDD port dimensions
owl = 13;      // outer width lower, horzontal part width

// Plug height, lower/horizontal part.
// Measured original plug: 7.5 - centered on pins
// Measured hole: 8.5 - not centered on pins, extra 1mm all on top
// Allow for variability in male 2x4 pin header solder position
ohl = (          // outer height lower
  JIG ? 7:
  8);

// Plug width, upper/vertical part (the polarity key)
// Measured original cable: 5.4
// Measured hole: 6.5
owu = 6;       // outer width upper

// Plug height, upper/vertical part.
// Measured original cable: 8.6
// Measured hole: 10.0-10.2
ohu = 9.4;       // outer height upper

// Distance from center of 2x4 pins to exterior bottom.
// The port opening is not centered vertically on the 2x4 pins.
// It's the same on all drives not just a manufacturing variance
// on one particular drive. All real original cables in all
// drives have the cable lightly or firmly touching the bottom
// and 1mm free space on top.
// This establishes where the floor is relative to the pins,
// and the rest of the housing grows up from there.
//ohb = ih/2+1.1;
// Original cables more like 3.7, but they actually rub.
ohb = 3.6;    // outer height bottom  z=0 to exterior bottom

// Plug length/depth, ie the keyed part,
// at the recessed surface immediately around the port.
// The recessed surface extends 3mm left & right,
// 1mm up, and 0mm down from the port. If the handle body is
// wider or taller than that, then this gets 1mm added to it
// automatically later.
// 11.5 is from the insulator at the base of the pins
// to the outside surface of the case, but the connector
// can't actually go that deep
//plug_len = 11.5; // length/depth of keyed part
plug_len = 9; // length/depth of keyed part

// cable
cir = cable_diameter/2;            // cable inside radius
cor = cir + heat_shrink_thickness; // cable outside radius
cpr = cor + cable_extra_radius;    // cable pocket radius
ccd = cable_chamfer_depth;         // cable chamfer depth

// 2x4 connector body
iw = t*4+0.5;//10.6; // 2.54 * 4 + 0.4
ih = t*2;//5.1;  // 2.54 * 2
id = 8.5;

// Height of the flux wash standoffs on the 2x4 connector.
// The 2x4 connector depth dimension includes the standoffs,
// but the pcb soldered on edge does not stop at the standoffs,
// so this tells where the pcb actually is relative to the
// full connector depth dimension.
pcb_inset = 0.5;
// pcb v1 has no castellations
// so it will push connector type b out
connector_outset = (
  (pm==1&&connector_model=="b")?pcb_inset:
  0);

hew = handle_extra_width;  // handle extra width
hw = hew+owl+hew ;         // handle width

heh = (                    // handle extra height
  handle_extra_height=="square" ? hw-ohu:
  handle_extra_height);

hh = (                     // handle height
  JIG ? ohl :
  ohu+heh);

oht = hh-ohb; // outer height top     z=0 to exterior top
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
ztr = cpr+zbt+zfc; // zip tie outside radius
ztl = zfc+zbw+zfc;   // zip tie cylinder length
ztc = zfc+ztk+zfc;   // zip tie cube

// prevents cable pocket from poking through or making
// a thin wall in the front face of the handle block
cew = minimum_wall_thickness; // 1; // cable end wall thickness

// cavity behind the 2x4 connector
// is smaller than the connector
ihr = 0.5; // interior height reduction to create a step

ich = ih-ihr ;          // main interior cavity height
icw = pfc+ptw+pfc ;     // main interior cavity width
icd = id-pcb_inset+pwy; // main interior cavity length

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

// total body length
tl = od+hd;

// grips
// either pcw or ztr*2 might be the widest
// interior cavity at the grip cut position
hwt = (hw-max(pcw,ztr*2))/2; // handle wall thickness at thinnest point
gr = hd; // grip cut radius
gd = hwt-mw>grip_cut_depth?grip_cut_depth:hwt-mw; // grip cut depth

// =============================================================

use <inc/handy.scad>

module cutaway (on="z",at=0,dir="+") {
    v = dir=="-"?-1:1;
    w = hw;
    wz = 0;
    l = tl;
    lz = -l/2;
    h = hh;
    //hz = hz;
  
    if (on=="x") translate([w/2*v+at,lz,hz]) cube([w,l+o,h+o],true);
    if (on=="y") translate([wz,l/2*v+at,hz]) cube([w+o,l,h+o],true);
    if (on=="z") translate([wz,lz,h/2*v+at]) cube([w+o,l+o,h],true);
}

module teardrop (h=1,r=10) {
  translate([0,0,-h/2]) hull () {
    cylinder(h=h,r=r);
    cube([r,r,h]);
  }
}

module cable_tie () {
    //r = cir;     // min
    r = cor;     // normal
    //r = cpr;     // max
    ch = ztk*0.75;

    difference () {
      teardrop(h=zbw,r=r+zbt);
      teardrop(h=zbw+o,r=r);
    }
    translate([ch/2+r,r,0])
      rotate([0,90,0])
        rounded_cube(w=ztk,d=ztk,h=ch,rh=zbw/3,rv=0.2);

}


// FITMENT REFERENCE MODELS
module fit_parts() {
  translate([0,-id,0]) {
    // 2x4 connector, 2 styles of flux wash standoffs
    cstl = (
      connector_model=="b" ? "inc/2x4b.stl":
      "inc/2x4a.stl");
    translate([0,connector_outset,0]) color("grey",0.5) import(cstl);
    // pcb
    translate([0,pcb_inset,0]) {
      pstl = (
        pm==2 ? "inc/pcb2.stl":
        pm==3 ? "inc/pcb3.stl":
        "inc/pcb1.stl");
      translate([0,0,-ph/2]) color("green",0.5) import(pstl);
      // zip-tie
      if (!JIG) translate([0,-zty,cz]) rotate([90,0,0]) color("grey",0.5) cable_tie();
    }
  }
  if (!JIG) translate([0,-od-cew-1,cz]) rotate([90,0,0]) {
    // cable
    cylinder(d=cable_diameter,h=25);
    // heat-shrink
    if (heat_shrink_thickness) cylinder(d=cable_diameter+heat_shrink_thickness*2,h=20);
  }
}

// HOUSING
module housing () {
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
    _id = id+fc; // connector pocket depth
    translate([0,o/2-_id/2,0])
      cube([fc+iw+fc,_id+o,fc+ih+fc],true);

    // main wiring/components interior cavity
    // TODO: replace ich with seperate top and bottom heights
    // where the bottom is the actual components height
    // to garantee we keep a minimum distance from the transistors
    translate([0,-icd/2,0])
      rounded_cube(w=icw,d=icd,h=ich,rh=cr,rv=cr);

    // transistors
    _th = ph/2+components_height+pfc; // transistor height
    _cr = min(0.2,cr); // sharper corner to clear the transistors
    translate([0,-id-pty+pcb_inset,-_th/2])
      rounded_cube(w=icw,d=4,h=_th,rh=cr,rv=_cr);

    // pcb slot
    translate([0,o/2+pcb_inset+pcr/2-id/2-pl/2-pfc/2,0])
      rounded_cube(w=pcw,d=pcr+id+pl+o+pfc,h=pfc+ph+pfc,rh=pcr+pfc,rv=pfc);
    if (pl2&&pw2)
      translate([0,o/2+pcb_inset+pcr/2-id/2-pl2/2-pfc/2,0])
        rounded_cube(w=pfc+pw2+pfc,d=pcr+id+pl2+o+pfc,h=pfc+ph+pfc,rh=pcr+pfc,rv=pfc);

    // cable
    if (!JIG) {
      _w = -od-max(cew,cz);

      // nose - rear of connector up to cable head
      fih = fc+ih+fc;
      hull() {
        mirror_copy([1,0,0])
          translate([-fih/2+cpr,-id,0])
            rotate([90,0,0])
              cylinder(h=1,d=fih);
        translate([0,_w,cz])
          rotate([90,0,0])
            cylinder(h=1,r=cpr);
      }

      // everything else at calculated cable height cz
      translate([0,0,cz]) {
        // main cable pocket
        translate([0,_w,0])
          rotate([90,0,0])
            cylinder(h=hd,r=cpr);
        // exit chamfer funnel
        translate([0,ccd-tl-e,0])
          rotate([90,0,0])
            cylinder(h=ccd,r1=cpr-o,r2=cpr-o+ccd);
      }
  }

    // grips
    if (gd && !JIG) {
    go = gr+hw/2-gd; // offset
    gcd = gd + grip_chamfer_depth;
    mirror_copy([1,0,0])
      translate([go,-od-hd/2,hz]) {
        cylinder(h=hh+o,r=gr,center=true);
        mirror_copy([0,0,1])
          translate([0,0,hh/2-gcd/2+0.01])
           cylinder(h=gcd+0.02,r1=gr-0.01,r2=gr+gcd,center=true);
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
            h2h ? zbt+h2h+zbt:
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
      // prevents a thin wall between pcb and pocket
      // hack: lower floor by 1mm if M4 tie
      _b = max(cz,ph/2+pfc+mw) - (cable_tie_size==4?1:0) ;
      translate([hw/2,0,hh/2+_b])
        rounded_cube(w=hw,d=ztc,h=hh,rh=cr,rv=cr);
      
    }


    // JIG
    // If we're making the jig, cut the main opening.
    if (JIG) {
      if (TRAY) {

        // simple open top tray
        translate([0,-(tl)/2,hh/2])
          cube([hw+o,tl+o,hh],true);

      } else {

        // fancy full-constraint jig
        e=1;    // main window expand beyond connector & pcb
        r=1;    // some corners radius
        sw=e+5; // solder window
        t=1;    // top above pcb
        csh=oht+o;
        translate([0,e-tl/2-id,csh/2])
          cube([icw,tl,csh],true);
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

    if (!JIG) {
      // ensure minimum wall thickness
      echo("minimum_wall_thickness",minimum_wall_thickness);
      //
      front_connector_floor_thickness = round((ohb-ih/2-fc)*10)/10;
      echo("front_connector_floor_thickness",front_connector_floor_thickness);
      assert(front_connector_floor_thickness>=minimum_wall_thickness);
      //
      // the zip-tie cannel doesn't matter at the top, just the cable
      cable_ceiling_thickness = round((oht-cz-cpr)*10)/10;
      echo("cable_ceiling_thickness",cable_ceiling_thickness);
      assert(cable_ceiling_thickness>=minimum_wall_thickness);
  
      // derived final dimesions
      echo("handle height",hh);
      echo("handle width",hw);
      echo("handle length",hd);
      // distance from top of pcb to ceiling of cable pocket
      // with pcb pushed to bottom of pcb fitment clearance
      echo("cable vertical gap",cpr+cz-ph/2+pfc);
    }

    //cutaway (on="x",at=0,dir="-"); //cr, iw/2
    //cutaway (on="y",at=-zy,dir="-");
    //cutaway (on="z",at=0,dir="+");

    //===========================================================

  }
}
}

if ($preview) %fit_parts();
housing();
