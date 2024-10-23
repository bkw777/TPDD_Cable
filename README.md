# Cable for [Tandy Portable Disk Drive](http://tandy.wiki/TPDD)
(and TPDD2)

![](PCB/out/TPDD_Cable.tr.jpg)
![](PCB/out/TPDD_Cable.br.jpg)
![](PCB/out/TPDD_Cable.exploded.jpg)
![](PCB/out/TPDD_Cable.assembled.jpg)
![](PCB/out/TPDD_Cable.top.jpg)
![](PCB/out/TPDD_Cable.bottom.jpg)
![](PCB/out/TPDD_Cable.svg)
![](TPDD_Cable_complete.jpg)
![](TPDD_Cable_use.jpg)
![](TPDD_Cable_running.jpg)

# Parts
<!-- PCB: [OSHPark](https://oshpark.com/shared_projects/Vseg3jxr) or [PCBWAY](https://www.pcbway.com/project/shareproject/TANDY_Portable_Disk_Drive_Cable.html) -->  
BOM: [DigiKey](https://www.digikey.com/short/t9b9h4vq)  

The BOM includes a grey cable. This [black cable](https://www.digikey.com/short/wbpp81nt) can be substituted if you want.

If using Elecrow, PCBWAY, or JLCPCB, you can upload the [housing](HOUSING/out) STL file to have it printed at the same time as the PCBs are being made. Choose nylon/PA11/PA12 material, SLS or MJF print method.  

# Directions

Assembly pictures: <https://photos.app.goo.gl/TdYxGhzK94KT9rS78>
(old method before the 3d-printed housing)

If you want to make 2 cables, one for "Model T" clones and one for PC & WP-2, then cut the cable in half in the middle. (and buy double the transistors and connectors)  
Otherwise just cut the 9-pn plug off the cable to make one longer cable for Model 100 & clones.

## prepare the cable
Strip about 40mm of the the cable jacket.  
Apply a bit of flux to the end of each cut wire and add a bit of solder to the iron tip and touch the iron to the end of the wire to heat and tin the wire until the insulation melts and shrinks back about 1-2mm. You should be left with about 1-2mm of tinned wire exposed.  
Use a DMM in continuity mode to identify which color wires go to which pin numbers on the DB25M connector.  
The table below should be correct for the exact cables linked here, but verify the color-to-pin-number of your actual cable before soldering.  
Otherwise, fill in your own table like the ones below for your particular cable.  
Cut the unused wires short.  
Thread the 3d-printed housing onto the cable, with the rectangular opening facing the cut end of the cable.  
Thread 40mm of heatshrink onto the cable.

## solder the pcb
Solder the center transistor first, then the left & right transistors to minimize alignment errors.  
Then solder the 2x4 connector, optionally using the 3d-printed jig to hold the 2x4 connector in the perfect alignment.  

## solder the wires to the pcb
Refer to one of the tables below.  
The signal names on the PCB are relative to the computer, aka the DTE side.  
Ex: The pad labelled RTS on the PCB connects to the computers RTS.  
The tables below show the computer-side pinouts for a few different computers.

## assemble the housing
Slide the heat-shrink 2mm past the end of the end of the cable jacket, just enough to cover the unused cut wires and shielding, and shrink it.  
Slide the housing up over the pcb. *Make sure the transistors face DOWN, and the polarity key points UP*.  
Push the cable into the pocket as far as possible. Make sure the jacket goes far enough in to be grabbed by the cable tie.  
Put a small 2mm bend at the very tip of the cable tie in the same direction it's already bent (the direction it will bend to wrap around the cable), to help it make the transition from the bottom up into the 2nd hole in the PCB.  
Insert a cable tie from above down into in the opening, with the inside of the strap facing the cable.  
Push the tie down and in so that it fishes under the pcb, up the other side, back over the top, and back out the opening on top.  
It is generally impossible to pull the cable tie from the tip, as the sharp pcb edges bite into the strap. You must push the strap in with needle nose pliars about 1 cm at a time, and don't try to thread the tip into the head until the strap is mostly all the way in.  
Seat the cable as far in as possible and cinch the cable tie tight. Flush-cut the cable tie at the head.

The cable tie not only strain-relieves the cable to the pcb, it also locks the pcb from pulling back out of the housing.  
Once you have tested the cable and are sure the connections are correct, it won't hurt to inject some glue into the housing. Almost any kind will do. C-A glue (superglue), vynil glue (goop, e6000), hot-glue, etc. 


# Standard Wiring, for a "Model T"
The standard version of the cable ends in a male 25-pin plug to connect to the female 25-pin DTE RS-232 port on any of the following machines:  
 Kyotronic KC-85  
 TRS-80/TANDY Model 100, 102, 200, 600  
 NEC PC-8201, PC-8300, PC-8401, PC-8500  
 Olivetti M10  
This is the same as the original cable that came with the drive.

For convenience, the table below also shows the colors for a couple of specific cable options from DigiKey from the BOM links above. If you buy one of these exact specific cables, then your cable should match this table. But don't trust the colors without verifying. If you buy any other cable that isn't specifically exactly the one from one of these BOM links, then ignore the colors and map out your cable yourself to find out which color goes to DB25M pin 3 etc.

<table>
<tr>
<td rowspan="0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><img src="TPDD_Cable_PCB_pads.jpg"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>

<th>Signal (DTE/Computer-side)</th>
<th><a href="https://www.digikey.com/short/w8zz83q5">GREY CABLE</a></th>
<th><a href="https://www.digikey.com/short/wbpp81nt">BLACK CABLE</a></th>
<th>DB25M pin</th>

<td rowspan="0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><img src="DB25M_to_Model_T.jpg"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>

<tr><td>GND</td><td>Green</td><td>Yellow</td><td>7</td></tr>
<tr><td>RTS</td><td>Purple</td><td>Blue</td><td>4</td></tr>
<tr><td>DSR</td><td>Blue</td><td>Green</td><td>6</td></tr>
<tr><td>CTS</td><td>Grey</td><td>Purple</td><td>5</td></tr>
<tr><td>DTR</td><td>Yellow</td><td>Orange</td><td>20</td></tr>
<tr><td>RXD</td><td>Red</td><td>Brown</td><td>3</td></tr>
<tr><td>TXD</td><td>Orange</td><td>Red</td><td>2</td></tr>
</table>

To verify the final result, check the following with a DMM in Continuity and Diode modes.

<table>
<tr><td rowspan="0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><img src="TPDD_plug.jpg"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><th>BLACK</th><th>CONT</th><th>DIODE</th><th>RED</th><td rowspan="0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><img src="DB25M_to_Model_T.jpg"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
<tr><td>1</td><td>BEEP</td><td></td><td>7</td></tr>
<tr><td>2</td><td>BEEP</td><td></td><td>4</td></tr>
<tr><td>3</td><td></td><td>1.7v</td><td>6</td></tr>
<tr><td>4</td><td></td><td>1.7v</td><td>5</td></tr>
<tr><td>5</td><td>BEEP</td><td></td><td>20</td></tr>
<tr><td>6</td><td></td><td>1.7v</td><td>3</td></tr>
<tr><td>7</td><td>BEEP</td><td></td><td>2</td></tr>
</table>

# Alternate Wiring
Other machines besides "Model T"'s like the TRS-80 Model 100 can use a TPDD, but their serial ports are different and usually need one or more adapters to work with the 25-pin cable for Model 100/200.  
You can make a custom cable that won't need any extra adapters using one of these other pinout tables.


## PC / TANDY WP-2 / Atari Portfolio
For Modern PCs and usb-serial adapters, TANDY WP-2, Atari Portfolio, and anything else with a standard DE9M DTE port.  
You need a cable with a DE9F on the end instead of DB25M.  
The cable in the BOM has both a DB25M on one end and a DE9F on the other end, so you can use the same BOM to make either a "Model T" cable, or a PC cable, or both.

<table>
<tr><td rowspan="0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><img src="TPDD_Cable_PCB_pads.jpg"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><th>Signal (DTE/Computer-side)</th><th>DE9F pin</th><td rowspan="0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><img src="DE9F_to_PC.jpg"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
<tr><td>GND</td><td>5</td></tr>
<tr><td>RTS</td><td>7</td></tr>
<tr><td>DSR</td><td>6</td></tr>
<tr><td>CTS</td><td>8</td></tr>
<tr><td>DTR</td><td>4</td></tr>
<tr><td>RXD</td><td>2</td></tr>
<tr><td>TXD</td><td>3</td></tr>
</table>

To verify the final result, check the following with a DMM in Continuity and Diode modes.

<table>
<tr><td rowspan="0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><img src="TPDD_plug.jpg"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><th>BLACK</th><th>CONT</th><th>DIODE</th><th>RED</th><td rowspan="0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><img src="DE9F_to_PC.jpg"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
<tr><td>1</td><td>BEEP</td><td></td><td>5</td></tr>
<tr><td>2</td><td>BEEP</td><td></td><td>7</td></tr>
<tr><td>3</td><td></td><td>1.7v</td><td>6</td></tr>
<tr><td>4</td><td></td><td>1.7v</td><td>8</td></tr>
<tr><td>5</td><td>BEEP</td><td></td><td>4</td></tr>
<tr><td>6</td><td></td><td>1.7v</td><td>2</td></tr>
<tr><td>7</td><td>BEEP</td><td></td><td>3</td></tr>
</table>

## Cambridge Z88
*UNTESTED*  
*The Cambridge Z88 RS-232 port has a non-standard pinout.*  
*Do not connect this cable to anything but a Cambridge Z88.*

You need a different cable than what's in the BOM links above.  
Delete the cable in the pre-loaded cart, and add [this one](https://www.digikey.com/short/mrf9n7nh) instead.  
<table>
<tr><td rowspan="0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><img src="TPDD_Cable_PCB_pads.jpg"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><th>Signal (DTE/Computer-side)</th><th>DE9M pin</th><td rowspan="0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><img src="DE9M_to_Z88.jpg"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
<tr><td>GND</td><td>7</td></tr>
<tr><td>RTS</td><td>4</td></tr>
<tr><td>DSR</td><td>8</td></tr>
<tr><td>CTS</td><td>5</td></tr>
<tr><td>DTR</td><td>9</td></tr>
<tr><td>RXD</td><td>3</td></tr>
<tr><td>TXD</td><td>2</td></tr>
</table>
<!--
This Z88 cable pinout is un-verified. It might need to be reversed, IE:

|SIGNAL|Z88|
|---|---|
|GND|7|
|RTS|5|
|DSR|9|
|CTS|4|
|DTR|8|
|RXD|2|
|TXD|3|
-->

# Credits / History
In the beginning, there was the [Marty Goodman Document](https://raw.githubusercontent.com/LivingM100SIG/Living_M100SIG/main/M100SIG/Lib-09-PERIFERALS/TPDD.DO), and it was good.

More recently, Rick Shear has taken a new and very careful look at a real cable, and the Marty Goodman doc, and has probably identified the "mystery" components that Marty Goodman talks about. It looks right, and the circuit does indeed work.  
[Rick's initial post](https://rsmicro.wordpress.com/2018/08/26/tpdd-cable/)  
[Rick's follow-up](https://rsmicro.wordpress.com/2018/09/08/built-tpdd-cable-comparison-to-oem/)

This cable uses the same transistors, but a different physical construction.
