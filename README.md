# TPDD_Cable
![](TPDD_Cable.jpg)
![](TPDD_Cable_2.jpg)
![](TPDD_Cable.svg)

TTL-RS232 level-shifting cable for Tandy Portable Disk Drive

This version has a cable that ends in a male 25-pin plug to connect to a "Model T"s female 25-pin DTE RS-232 port.  
This is the same as the original cable that came with the drive.

Assembly pictures: <http://tandy.wiki/TPDD#Cable>

# Alternate Wiring
There are a few other machines besides "Model T"'s that can use a TPDD, but their serial ports are different and usually need one or more adapters to work with the normal TPDD cable.
 
You can make a custom cable to connect to other kinds of machines by just ignoring the silkscreen on the PCB and use one the following wiring tables instead.

## For TANDY WP-2, most modern PCs, most usb-serial adapters, and anything else with a DE9M DTE port.
You need a cable with a DE9F on the end instead of DB25M.  
The cable in the BOM link above has both a DB25M on one end and a DE9F on the other end, so you can use the same BOM to make this cable. Just keep the 9-pin connector instead of the the 25-pin.

The numbers next to the wire solder pads on the PCB normally indicate the pin# on a DB25M to connect to that pad.  
In this case ignore the meaning of the numbers and just treat them as arbitrary labels.  
IE: connect the wire solder pad with a 20 next to it, to pin# 6 of a DE9F.

|Signal|PCB pad|DE9F pin|Signal|
|:---:|:---:|:---:|:---:|
|GND|7|5|GND|
|RTS|4|8|CTS|
|DSR|6|4|DTR|
|CTS|5|7|RTS|
|DTR|20|6|DSR|
|RXD|3|3|TXD|
|TXD|2|2|RXD|

## For Cambridge Z88
*The Cambridge Z88 RS-232 port has a non-standard pinout.*  
*Do not connect this cable to anything but a Cambridge Z88.*

You need a different cable than what's in the BOM links. You need a cable with a DE9M on one end.
Delete the cable in the pre-loaded cart, search for "AE9869-ND" and add that instead.  

|Signal|PCB pad|DE9M pin|Signal|
|:---:|:---:|:---:|:---:|
|GND|7|7|GND|
|RTS|4|5|CTS|
|DSR|6|9|DTR|
|CTS|5|4|RTS|
|DTR|20|8|DSR|
|RXD|3|2|TXD|
|TXD|2|3|RXD|


# Credits / History
In the beginning, there was the [Marty Goodman Document](http://www.club100.org/library/ups/tpdd.do), and it was good.
<!-- ftp://salsa.net/pub/M100SIG/Lib-09-PERIFERALS/TPDD.DO -->

More recently, Rick Shear has taken a new and very careful look at a real cable, and the Marty Goodman doc, and has probably identified the "mystery" components that Marty Goodman talks about. It looks right, and the circuit does indeed work.<br>
[Rick's initial post](https://rsmicro.wordpress.com/2018/08/26/tpdd-cable/)<br>
[Rick's follow-up](https://rsmicro.wordpress.com/2018/09/08/built-tpdd-cable-comparison-to-oem/)

This cable uses the same transistors, but a different physical construction.
