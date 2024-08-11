/*
 * Plug housing for TPDD_Cable
 * v001
 */

t = 2.54; // tenth inch
o = 0.1;  // overlap / overcut
fc = 0.1; // fitment clearance 0.1 for SLS, 0.2 for FDM
w = 0.8;  // min wall
cr = 0.5; // corner radii
$fa = 1;
$fs = 1;

ph = 1.6;  // pcb thickness
pw = 10.4; // pcb width
psl = 8.5;  // pcb slot length, starting at id

owl = 13.5;    // outer width low, horzontal part width
ohl = 7.8;     // outer height low, horizontal part height
owh = 5.5;     // outer width high, vertical part width
ohh = 9.5;     // outer height high, vertical part height
plug_len = 12; // length of keyed part - automatically adjusted +1 if handle (hh) is taller than plug (ohh)
iw = t*4+0.4;  // inner width, width of 2x4 connector
ih = t*2;      // inner height, height of 2x4 connector
id = 8.5;      // inner depth, depth of 2x4 connector

ohb = ih/2+ph/2;   // outer height bottom, 0 to exterior floor

hew = 0;           // handle extra width
heh = hew;         // handle extra height
hw = hew+owl+hew ; // handle width
hd = 18;           // handle depth

// Different parametric relationships
// between the cable, handle, pcb, and connector.

// -- option 1 ------
// * handle height based on vertical key height
// * cable center based on pcb
// neither handle adjusts to cable nor cable adjusts to handle
// cable is allowed to be off-center
//hh = ohh+hew;   // handle height
//hz = hh/2-ohb;  // handle center Z
//cd = 6;         // cable diam, including heat shrink
//cz = cd/2+ph/2; // cable bottom at pcb top
// --------------

// -- option 2 ------
// * handle height based on vertical key height
// * cable centered in handle
// Cable diameter enlarged to allow fit with some squish.
// Cable is really about 6mm, but full circle is not available,
// so 6mm cable deforms into 70% section of 7mm hole.
hh = ohh+heh;  // handle height
hz = hh/2-ohb; // handle center z
cz = hz;       // cable center z
cd = 7;        // cable diameter, including heat shrink and squish
// ------------------

// -- option 3 ------
// * cable location based on pcb
// * handle height based on cable center to floor, doubled to make cable come out centered
// makes a very tall handle but cable is centered without squishing
//cd = 6; // cable diam, including heat shrink
//cz = cd/2+ph/2;   // cable bottom at pcb top
//hz = cz;
//hh = (cz+ohb)*2;
// ------------------

zbw = 3; // zip tie band width
zbt = 1; // zip tie band thickness
zy = id + 10.95; // zip tie Y position
ztk = 4.5; // zip tie knot cube

cew = 1; // cable end wall thickness
cfd = 3; // cable funnel depth

gr = hd;        // grip cut radius
gd = (hew<1)?1+hew:1.5; // grip cut depth

ihr = 0.5; // interior height reduction
iwr = 1; // interior width reduction

ich = ih-ihr ;
icw = iw-iwr ;
icd = 23;

// if handle height is taller than vertical key
// then add 1mm to plug length so handle clears
// the step around the port
od = plug_len + (hh>ohh?1:0);

// =============================================================

use <handy.scad>

if ($preview) translate([0,-6.6-id-fc,-ph/2]) %import("pcb.stl");

difference() {
    union() {
      // extend plug body by 2*cr+o into handle body
      // to fill in creases 
      xod = od + cr*2+o;

      // horizontal
      translate([0,-xod/2,ohl/2-ohb])
        rounded_cube(w=owl,d=xod,h=ohl,rh=cr,rv=cr,t=0,$fn=12);

      // vertical
      translate([0,-xod/2,ohh/2-ohb])
        rounded_cube(w=owh,d=xod,h=ohh,rh=cr,rv=cr,t=0,$fn=12);

      // handle
      translate([0,-od-hd/2+o,hz])
        rounded_cube(w=hw,d=hd,h=hh,rh=cr,rv=cr,t=0,$fn=12);
    }
  union() {
    // connector cavity
    translate([0,o-id/2-fc,0]) cube([fc+iw+fc,o+id+fc,fc+ih+fc],true);

    // main wiring/components interior cavity    
    translate([0,-icd/2,0]) cube([icw,icd,ich],true);

    // pcb slot
    translate([0,-psl/2-id+o,0]) cube([fc+pw+fc,psl,fc+ph+fc],true);

    // cable
    translate([0,0,cz]) {
      translate([0,-hd/2-od-cew,0]) rotate([90,0,0]) cylinder(h=hd,r=cd/2,center=true);
      // funnel
      fr1 = cd/2-o;  // truncated cone small end is cable diam
      fr2 = fr1+cfd; // big end is small end plus length to make 45 degrees
      translate([0,cfd/2-od-hd,0]) rotate([90,0,0]) cylinder(h=cfd,r1=fr1,r2=fr2,center=true);
    }

    // grips
    go = gr+hw/2-gd; // offset
    gch = o+hh+o; // grip cut cyl height
    gcs = 0.8; // grip chamfer size
    mirror_copy([1,0,0])
      translate([go,-od-hd/2+o,hz]) {
        cylinder(h=gch,r=gr,center=true);
        mirror_copy([0,0,1])
          cylinder(h=gch,r1=gr-gch+gcs,r2=gr+gcs,center=true);
      }

    // zip tie
    ztr = cd/2+zbt+fc;
    translate([0,-zy,0]) {
      // band cavity
      // top half of band cavity is cylinder centered on cable
      // bottom half is cube that extends to the inside floor
      // bottom of cylinder is cut to prevent cutting into floor
      // cube & cyl hulled to make smooth transition up side wall from floor to arch
      bcl = fc+zbw+fc; // band cavity length
      hull () {
        difference() {
          translate([0,0,cz]) rotate([90,0,0]) cylinder(h=bcl,r=ztr,center=true);
          cs = o+ztr*2+o; // cube to cut the bottom off the band cylinder
          translate([0,0,-cs/2-ph/2-zbt]) cube(cs,true);
        }
        // cube bottom half of band
        // this allows tie to push up the far side wall into the top curve
        translate([0,0,ich/2-ih/2+ihr/2]) cube([icw,bcl,ich],true);
        // cube head corner of band
        // this allows the tie to be inserted straight down the near wall
        translate([icw/4,0,ztr/2+cz]) cube([icw/2,bcl,ztr],true);
      }
      // head
      ztc = fc+ztk+fc; // ziptie head cavity cube
      // if the ceiling above the head cube is less than
      // min-wall-thickness, then increase the height of
      // the cube to cut out the ceiling
      toh = hh-ohb;    // top of handle
      tob = cz+ztr;    // top of band
      tw = toh-tob;    // top wall thickness
      zta = (tw<w) ? tw+o : 0; // ziptie head height, adjusted
      // zta is only used to increase the height to poke through the top
      // and intentionally not included in the z-translation
      // so the bottom of the cube is always at the same height
      translate([-fc,-ztk/2-fc,-ztc+cz+ztr]) cube([hw/2+o+fc,ztc,ztc+zta]);
    }


    //===========================================================
    // DEBUGGING
    // cut away to see while drawing

    // cut on X
    if (false && $preview) {
      cutx = 0;  // where to cut along X
      csh=o+hh+o;
      csd=o+od+hd+o;
      csw=hw/2-cutx+o;
      translate([-csw/2-cutx,-csd/2+o,hz]) #cube([csw,csd,csh],true);
    }

    // cut on Y
    if (false && $preview) {
      cuty = zy;  // where to cut along Y
      csh=o+hh+o;
      csw=o+hw+o;
      csd=od+hd-cuty+o;
      translate([0,-csd/2-cuty,hz]) #cube([csw,csd,csh],true);
    }

    // cut on Z
    if (false && $preview) {
      cutz = 0;  // where to cut along Z
      csd=o+od+hd+o;
      csw=o+hw+o;
      csh=hh-ohb-cutz+o;
      translate([0,-csd/2+o,csh/2+cutz]) cube([csw,csd,csh],true);
    }


    //===========================================================

  }
}
