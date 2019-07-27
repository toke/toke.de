---
title: "Adding AVR JTAGICE MKII to Arduino IDE"
tags:
  - "worksforme"
  - "arduino"
  - "note"
categories:
  - "notes"
date: "2015-04-26T18:34:00+01:00"
slug: jtagice-mkii-arduino
aliases:
- /note/jtagice-mkii-arduino/
---

AVR JTAGICE MKII programmers.txt entry for Arduino IDE 1.6

```
## JTAGICE MK II
jtag2isp.name=JTAGICE MkII ISP
jtag2isp.communication=usb
jtag2isp.protocol=jtag2isp
jtag2isp.program.tool=avrdude
jtag2isp.program.protocol=stk500v2
jtag2isp.speed=115200
jtag2isp.program.extra_params=-Pusb

```
