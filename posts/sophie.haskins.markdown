---
title: Sophie Haskins
summary: Site reliability engineer (GitHub)
date: 2018-09-14
categories:
- linux
- service
- windows
---

### Who are you, and what do you do?

Ahoy there! I'm Sophie Haskins - I post hot takes on [Twitter Dot Com](https://twitter.com/sophaskins "Sophie's Twitter account."), restore vintage workstations at [pizzabox.computer](https://blog.pizzabox.computer/ "Sophie's site about restoring old computers."), am a pink hair enthusiast, and work as an SRE at [GitHub][]. Most of my professional work is centered around "building infrastructure that makes it easy to build reliable scalable software".

### What hardware do you use?

I could tell you about my unsurprising work-from-home desktop setup (the only "surprising" thing is that I use a Windows PC - I had built it for playing four [EVE Online][eve-online] sessions at once, so it just happens to be the most responsive/fastest computer in the house), but I _suspect_ you'd all be more interested in the hardware I use with the **Pizzabox Workstations**. The important hardware in my toolbox is:

* the literal toolbox - I have an [iFixit Pro Tech Toolkit][pro-tech-toolkit] that has been _invaluable_. Its super high quality, has half a billion screwdriver bits, and tons of options for ways to poke inside cases to get them to open.
* the [SCSI2SD][] "hard drive" - most of my workstations were built with SCSI disks in mind. The remaining 50-pin SCSI drives out there are pretty old, largely used (rather than new-old-stock), and **pricy**. The SCSI2SD lets me skip the gamble on drive reliability and just use SD cards for storage. The configuration tool is a little clunky, using its advanced features (like acting as multiple devices at once) takes some custom setup, and figuring out the right settings for compatibility is tricky, but it's a LIFESAVER nonetheless. I have _many_ of these in the various pizzaboxes.
* a Sun 411 external SCSI enclosure & SCSI CD-ROM drive - setting up the SCSI2SD as a CD-ROM is tricky so this old-school caddy-loading drive is my workhorse for setting up OSes on the workstations. It supports the 512-byte block mode that some older models require (*cough* [Sun](http://www.retrocomputing.net/parts/sun/ss10/cdrom_faq.htm "An FAQ for dealing with CD-ROMs for Sun hardware.")). The enclosure pulls double-duty when I want to take an image of the initial state of drives in new boxes - I pull out the CD-ROM, put in the new drive, and connect them to my HP 712 for dumping (HP-UX seems most tolerant of drives w/o partition tables it likes).
* a [TP-LINK N300][tl-wr802n] mini wifi router in "client mode" lets me connect pizzaboxes directly to my home network without needing to run a really long cable all the way to my Ethernet switch. Another important tool for some of the boxes is an AUI-to-Twisted-Pair tranciever - lots of the pizzaboxes don't have RJ-45 ports onboard and need one of these to connect (sadly, I'm not aware of _new_ ones being made, you have to get an old one on ebay).
* a [USB-Serial adapter][icusb2321f] - none of my modern computers have built-in serial ports, so I use one of these handy numbers. I've got an [Airconsole LE](https://www.get-console.com/shop/en/36-airconsole-le) that should make this wireless but I haven't put in the time to get used to how it works yet. Lots of the Pizzaboxes need weird peripherals to start up using their main console, so a serial console is super useful. 
* an [Epiphan DVI2USB framegrabber][dvi2usb] lets me take video & screenshots without needing OS support for it on the pizzaboxes (or before such support would be loaded). The software for this is a bit finicky and I sometimes have a hard time getting fine-tuning of the image right but it's been really cool to be able to get high-quality videos of what's on-screen.
* an old 4:3 monitor (mine is an [NEC 1770NX][lcd1770nx] - the framegrabber has a little bit too much lag to be comfortable to use directly as a screen - its much nicer to use a VGA monitor with the right aspect ratio with broad compatibility (this one supports _most_ sync-on-green signals I've sent it). Its native resolution of 1280x1024 matches a lot of the CRTs the pizzaboxes would originally have used, too.

If "home lab" stuff is more your speed, I also spend a decent amount of time maintaining my home network and [Kubernetes][] cluster that serves my websites (overbuilt much? :P). If that stuff is your jam, my setup is:

* a [12U Tripp Lite Rack][srw12u] that sits in the corner of my living room.
* a bunch of StarTech rack shelves and a simple rack PDU.
* an [EdgeRouter Lite][edgerouter-lite] and a [EdgeSwitch Lite 24][edgeswitch-lite] from UBNT for core networking - they're _really_ good stuff.
* a couple of Intel NUCs (I have some a couple of [NUC6i3SYK][] and a [NUC6i5SYH][].
* a [QNAP TS-231P][ts-231p] NAS - real talk I don't have that much data to back up, but having a designated "network storage" box is super helpful. It also comes in handy with the pizzaboxes - they basically all are able to access at _least_ the NAS's public NFS share.

### And what software?

The **software** I use for the pizzabox restorations is:

* [Terra Term][terra-term] for a serial console.
* [Xming][] for setting up a remote X session from my desktop to pizzaboxes (in situations where I can't use the local console.)
* [The Internet Archive][internet-archive] for archived software, manuals, and websites of long-gone hardware.
* [Bitsavers](http://bitsavers.org/ "An archive of old computer manuals and software.") and [Manx Docs](http://manx-docs.org/ "An archive of old computer manuals.") have also been HUGELY helpful sources of documentation.
* [Microsoft OneNote][onenote] for taking notes, collating research, and tracking progress on projects.
* [dd][] (in various incarnations) for taking an image of working drives, putting data on to the SCSI2SD, and setting up floppy disks.

For my home-lab stuff, I use:

* [Ubuntu 18.04][ubuntu] for the base OS on my NUCs as well as for most of the VMs that run on it. I use the built-in KVM-based [uvtool][] for creating and managing VMs.
* Kubernetes w/ kubeadm for setting up the Kube cluster.
* [cert-manager][] for setting up certificates in an automated fashion.
* [netboot.xyz][] handles PXE-booting on my network (it's suuuuuuuper dope.)

### What would be your dream setup?

My dream setup would add to what I have now with:

* a physical serial console (I love the [DEC VT320][vt320].)
* a physical X Terminal (mostly for the novelty of it.)
* a wider variety of vintage CD-ROM and external hard disks to help with the more stubborn pizzaboxes.
* furniture for both displaying _and_ connecting the pizzaboxes to peripherals (maybe some sort of shelf where they'd all be wired going to a central console?
* a more comfortable dedicated work-desk - right now I either put things on my normal desk and push aside my normal gear, or use a crappy table in the corner of my apt that isn't a great height and isn't near my comfy office chair.
* a real lighting kit for taking photos / video of working on the pizzaboxes.
* a convenient outdoor / well-ventilated indoor space for soldering and using contact cleaner / other noxious cleaning agents.

[cert-manager]: https://github.com/cert-manager/cert-manager "A Kubernetes add-on for managing TLS certificates."
[dd]: https://en.wikipedia.org/wiki/Dd_(Unix) "A tool for copying raw data from disks."
[dvi2usb]: https://www.epiphan.com/products/dvi2usb-3-0/ "A USB video frame grabber."
[edgerouter-lite]: https://www.ui.com/edgemax/edgerouter-lite/ "A three port router."
[edgeswitch-lite]: https://www.ui.com/edgemax/edgeswitch-lite/ "A gigabit switch."
[eve-online]: https://www.eveonline.com/ "A space-based MMO game."
[github]: https://github.com/ "A Git code repository service."
[icusb2321f]: https://www.startech.com/en-us/cards-adapters/icusb2321f "A USB to serial adapter."
[internet-archive]: https://archive.org/ "A non-profit Internet library."
[kubernetes]: https://kubernetes.io/ "Software for deploying containers."
[lcd1770nx]: https://www.sharpnecdisplays.us/p/lcd1770nx "A 17 inch LCD monitor."
[netboot.xyz]: https://netboot.xyz/ "A boot loader."
[nuc6i3syk]: https://corpredirect.intel.com/Redirector/404Redirector.aspx?https://ark.intel.com/products/89186/Intel-NUC-Kit-NUC6i3SYK "A tiny PC."
[nuc6i5syh]: https://corpredirect.intel.com/Redirector/404Redirector.aspx?https://ark.intel.com/products/89190/Intel-NUC-Kit-NUC6i5SYH "A tiny PC."
[onenote]: https://www.onenote.com/signin?wdorigin=ondc "Synced notes software (part of Office)."
[pro-tech-toolkit]: https://www.ifixit.com/Store/Tools/Pro-Tech-Toolkit/IF145-307 "A toolkit for repairing computer devices."
[scsi2sd]: http://www.codesrc.com/mediawiki/index.php/SCSI2SD "An emulator device for SCSI hard drives."
[srw12u]: https://tripplite.eaton.com/smartrack-12u-low-profile-switch-depth-wall-mount-rack-enclosure-cabinet~SRW12U "A rack enclosure."
[terra-term]: http://web.archive.org/web/20230513144705/https://ttssh2.osdn.jp/ "Terminal emulation software."
[tl-wr802n]: https://www.tp-link.com/us/home-networking/wifi-router/tl-wr802n/ "A mini wifi router."
[ts-231p]: https://www.qnap.com/s3/404/en.html "A two bay NAS."
[ubuntu]: https://ubuntu.com/ "A Unix distribution."
[uvtool]: https://ubuntu.com/server/docs "A command line tool for generating virtual machines."
[vt320]: https://terminals-wiki.org/wiki/index.php/DEC_VT320 "A terminal."
[xming]: https://en.wikipedia.org/wiki/Xming "An X server for Windows."
