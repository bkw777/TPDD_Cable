# TPDD_Cable
![](TPDD_Cable.jpg)
![](TPDD_Cable_2.jpg)
![](TPDD_Cable.svg)

TTL-RS232 level-shifting cable for Tandy Portable Disk Drive

The cable ends in a male 25-pin plug to connect to the female 25-pin DTE RS-232 port on a "Model T" computer (Kyotronic KC-85, TRS-80 Model 100, TANDY Model 102 200 600, NEC PC-8201 PC-8300 PC-8401 PC-8500, Olivettin M10).  
This is the same arrangement as the original cable that came with the drive.

Assembly pictures: <http://tandy.wiki/TPDD#Cable>

# Wiring
This is the normal wiring for connecting to a "Model T" computer, the same as the original cable that came with the drive.  
This is the wiring that the silkscreen right on the PCB describes, so this table is somewhat redundant. IE, pad #20 goes to DB25M pin #20.
<table>
<tr><td rowspan="0"><img src="TPDD_Cable_PCB_pads.jpg"></td><th>Signal</th><th>PCB pad</th><th>DE9M pin</th><th>Signal</th><td rowspan="0"><img src="DB25M_to_Model_T.jpg"></td></tr>
<tr><td>GND</td><td>7</td><td>7</td><td>GND</td></tr>
<tr><td>RTS</td><td>4</td><td>4</td><td>CTS</td></tr>
<tr><td>DSR</td><td>6</td><td>6</td><td>DTR</td></tr>
<tr><td>CTS</td><td>5</td><td>5</td><td>RTS</td></tr>
<tr><td>DTR</td><td>20</td><td>20</td><td>DSR</td></tr>
<tr><td>RXD</td><td>3</td><td>3</td><td>TXD</td></tr>
<tr><td>TXD</td><td>2</td><td>2</td><td>RXD</td></tr>
</table>


# Alternate Wiring
There are a few other machines besides "Model T"'s that can use a TPDD, but their serial ports are different and usually need one or more adapters to work with the normal TPDD cable.
 
You can make a custom cable to connect to other kinds of machines by just ignoring the silkscreen on the PCB and use one the following wiring tables instead.

## For TANDY WP-2, most modern PCs, most usb-serial adapters, and anything else with a DE9M DTE port.
You need a cable with a DE9F on the end instead of DB25M.  
The cable in the BOM link above has both a DB25M on one end and a DE9F on the other end, so you can use the same BOM to make this cable. Just keep the 9-pin connector instead of the the 25-pin.

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

You need a different cable than what's in the BOM links. You need a cable with a DE9M on one end.
Delete the cable in the pre-loaded cart, search for "AE9869-ND" and add that instead.  
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
In the beginning, there was the [Marty Goodman Document](http://www.club100.org/library/ups/tpdd.do), and it was good.
<!-- ftp://salsa.net/pub/M100SIG/Lib-09-PERIFERALS/TPDD.DO -->

More recently, Rick Shear has taken a new and very careful look at a real cable, and the Marty Goodman doc, and has probably identified the "mystery" components that Marty Goodman talks about. It looks right, and the circuit does indeed work.<br>
[Rick's initial post](https://rsmicro.wordpress.com/2018/08/26/tpdd-cable/)<br>
[Rick's follow-up](https://rsmicro.wordpress.com/2018/09/08/built-tpdd-cable-comparison-to-oem/)

This cable uses the same transistors, but a different physical construction.
