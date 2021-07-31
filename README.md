# Cable for [Tandy Portable Disk Drive](http://tandy.wiki/TPDD)
(and TPDD2)

![](TPDD_Cable.jpg)
![](TPDD_Cable_2.jpg)
![](TPDD_Cable.svg)
![](TPDD_Cable_complete.jpg)
![](TPDD_Cable_use.jpg)
![](TPDD_Cable_running.jpg)

# Parts
PCB: [OSHPark](https://oshpark.com/shared_projects/Vseg3jxr) or [PCBWAY](https://www.pcbway.com/project/shareproject/TANDY_Portable_Disk_Drive_Cable.html)  
BOM: [DigiKey](https://www.digikey.com/short/pbc3pp)  

You will also need:
* 2x4 or longer double-row 2.5mm male pin header (used as an alignment/holder tool while soldering)
* 3/4" length of 1/4" diameter heat-shrink
* 1 1/2" length of 3/8" diameter heat-shrink
* one 0.1" x 4" / 3mm x 100mm zip-tie
* optionally, hot glue

The BOM includes a grey cable. This [black cable](https://www.digikey.com/short/wbpp81nt) can be substituted if you want.

# Directions

Assembly pictures: <https://photos.app.goo.gl/TdYxGhzK94KT9rS78>

First, solder the 3 transistors onto the pcb.

Next place the pin sockets onto the male pin header in a 1x2-2x3-1x2 arrangement and pull the two un-used pins out of the 2x3 socket, to match the pictures.

Solder the pcb to the socket pins with the transistors facing DOWN and the polarity bump facing UP. Again see the pictures.

Cut the the cable either exactly in half to keep the un-used connector for something else, or cut off the un-used connector to make one longer cable.

Cut the jacket back to expose about 1.5 inches of wires.

Use a multimeter continuity tester to identify which color wires go to which pins on the DB25M connector.

Consult the table below and cut the un-used wires flush with the outer jacket, and cover the end of the jacket and cut wires with a short 3/4" length of 1/4" heat-shrink. You don't need to insulate each individual wire, just prevent the un-insulated shield ground wire and the ends of the other wires from touching any part of the PCB. Have the heat-shrink extend only about 1/8" beyond the end of the jacket. It needs to cover the cut wire ends, but not be any longer than that. Later, the cable end will need to be zip-tied to the pcb and the end of the cabel will need to be able to go up past the zip-tie area, so you don't want 1/2" of heat-shrink past the end of the jacket.

Put a 1 1/2" length of 3/8" heat-shrink on the cable for later.

Strip about 1/8" of insulation from all the remaining wires.

Lastly solder the wires to the pcb following one of the sections below.

# Standard Wiring, for a "Model T", like the original cable
The standard version of the cable ends in a male 25-pin plug to connect to the female 25-pin DTE RS-232 port on any of the following machines:  
 Kyotronic KC-85  
 TRS-80/TANDY Model 100, 102, 200, 600  
 NEC PC-8201, PC-8300, PC-8401, PC-8500  
 Olivetti M10  
This is the same arrangement as the original cable that came with the drive.

This is the wiring that the silkscreen on the PCB describes, so this table is somewhat redundant. IE, pad #20 goes to DB25M pin #20, and so on.

For convenience, the table below shows the colors for a couple of specific cables from DigiKey (The grey cable and a black cables from the BOM links above). If you buy one of the same cables, then your cable should match this table. But don't trust it without verifying.

<table>
<tr><td rowspan="0"><img src="TPDD_Cable_PCB_pads.jpg"></td><th>Signal</th><th>PCB pad</th><th>DB25M pin</th><th>Signal</th><th><a href="https://www.digikey.com/short/w8zz83q5">GREY CABLE</a></th><th><a href="https://www.digikey.com/short/wbpp81nt">BLACK CABLE</a></th><td rowspan="0"><img src="DB25M_to_Model_T.jpg"></td></tr>
<tr><td>GND</td><td>7</td><td>7</td><td>GND</td><td>Green</td><td>Yellow</td></tr>
<tr><td>RTS</td><td>4</td><td>4</td><td>CTS</td><td>Purple</td><td>Blue</td></tr>
<tr><td>DSR</td><td>6</td><td>6</td><td>DTR</td><td>Blue</td><td>Green</td></tr>
<tr><td>CTS</td><td>5</td><td>5</td><td>RTS</td><td>Grey</td><td>Purple</td></tr>
<tr><td>DTR</td><td>20</td><td>20</td><td>DSR</td><td>Yellow</td><td>Orange</td></tr>
<tr><td>RXD</td><td>3</td><td>3</td><td>TXD</td><td>Red</td><td>Brown</td></tr>
<tr><td>TXD</td><td>2</td><td>2</td><td>RXD</td><td>Orange</td><td>Red</td></tr>
</table>

Solder the wires on the bottom side of the pcb, the side with the transistors.  
Flush-cut the top side after soldering and briefly touch each wire with the soldering iron to re-melt the solder into a smooth dome that won't pierce wire insulation.

Lay the wires down flat on the bottom side of the pcb, pulled away from the connector, and cover the ends of the wires with hot-glue to keep them from flexing at the solder joint.

Put some hot-glue on the top sire of the PCB and place the end of the cable on the top side of the PCB, and zip-tie the cable to the pcb. Make sure the zip-tie knot is on the top side of the pcb to the left or right, so that the heat-shrink will be able to get over the end later. It's a tight fit, but the heat-shrink can be worked over the knot usually.

Slide the heat-shrink over the cable end, up to the back of the connector but not over it. It's a tight fit but the heat-shrink can be worked over the zip-tie knot but just rubbing and pushing. If the bulge is really too big, put a small amount of alcohol on the knot and then the heat-shrink can be slid right over.

# Alternate Wiring
There are a few other machines besides "Model T"'s that can use a TPDD, but their serial ports are different and usually need one or more adapters to work with the normal TPDD cable.
 
You can make a custom cable that will need no adapters to connect to other kinds of machines by just ignoring the silkscreen on the PCB and use one the following wiring tables instead of the standard wiring above.

## For TANDY WP-2, most modern PCs, most usb-serial adapters, and anything else with a DE9M DTE port.
You need a cable with a DE9F on the end instead of DB25M.  
The cable in the BOM has both a DB25M on one end and a DE9F on the other end, so you can use the same BOM to make either a "Model T" cable or a PC cable, or cut the cable exactly in half and make one of each. Also true for the grey and black cable links in the table above.

The numbers next to the wire solder pads on the PCB normally indicate the pin# on a DB25M to connect to that pad.  
In this case ignore the meaning of the numbers and just treat them as arbitrary labels.  
<table>
<tr><td rowspan="0"><img src="TPDD_Cable_PCB_pads.jpg"></td><th>Signal</th><th>PCB pad</th><th>DE9M pin</th><th>Signal</th><td rowspan="0"><img src="DE9F_to_PC.jpg"></td></tr>
<tr><td>GND</td><td>7</td><td>5</td><td>GND</td></tr>
<tr><td>RTS</td><td>4</td><td>8</td><td>CTS</td></tr>
<tr><td>DSR</td><td>6</td><td>4</td><td>DTR</td></tr>
<tr><td>CTS</td><td>5</td><td>7</td><td>RTS</td></tr>
<tr><td>DTR</td><td>20</td><td>6</td><td>DSR</td></tr>
<tr><td>RXD</td><td>3</td><td>3</td><td>TXD</td></tr>
<tr><td>TXD</td><td>2</td><td>2</td><td>RXD</td></tr>
</table>


## For Cambridge Z88
*The Cambridge Z88 RS-232 port has a non-standard pinout.*  
*Do not connect this cable to anything but a Cambridge Z88.*

You need a different cable than what's in the BOM links above.<br>
Delete the cable in the pre-loaded cart, and add [this one](https://www.digikey.com/short/mrf9n7nh) instead.  
<table>
<tr><td rowspan="0"><img src="TPDD_Cable_PCB_pads.jpg"></td><th>Signal</th><th>PCB pad</th><th>DE9M pin</th><th>Signal</th><td rowspan="0"><img src="DE9M_to_Z88.jpg"></td></tr>
<tr><td>GND</td><td>7</td><td>7</td><td>GND</td></tr>
<tr><td>RTS</td><td>4</td><td>5</td><td>CTS</td></tr>
<tr><td>DSR</td><td>6</td><td>9</td><td>DTR</td></tr>
<tr><td>CTS</td><td>5</td><td>4</td><td>RTS</td></tr>
<tr><td>DTR</td><td>20</td><td>8</td><td>DSR</td></tr>
<tr><td>RXD</td><td>3</td><td>2</td><td>TXD</td></tr>
<tr><td>TXD</td><td>2</td><td>3</td><td>RXD</td></tr>
</table>

# Credits / History
In the beginning, there was the [Marty Goodman Document](https://archive.org/download/M100SIG/M100SIG.zip/Lib-09-PERIFERALS%2FTPDD.DO), and it was good.
<!-- http://www.club100.org/library/ups/tpdd.do -->
<!-- ftp://salsa.net/pub/M100SIG/Lib-09-PERIFERALS/TPDD.DO -->

More recently, Rick Shear has taken a new and very careful look at a real cable, and the Marty Goodman doc, and has probably identified the "mystery" components that Marty Goodman talks about. It looks right, and the circuit does indeed work.<br>
[Rick's initial post](https://rsmicro.wordpress.com/2018/08/26/tpdd-cable/)<br>
[Rick's follow-up](https://rsmicro.wordpress.com/2018/09/08/built-tpdd-cable-comparison-to-oem/)

This cable uses the same transistors, but a different physical construction.<br>
TPDD_Cable_PITA is an updated version of a PCB that goes into a DB25 backshell like Rick's original.
