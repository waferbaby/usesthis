---
title: Stephen Strowes
summary: Network measurements researcher 
date: 2020-07-10
categories:
- linux
- mac
- networking
- researcher
---

### Who are you, and what do you do?

My name's [Stephen](https://sdstrowes.co.uk/ "Stephen's website."), and I'm a researcher specialising in network measurements. I like network protocols, how they get deployed, and measuring their adoption.

I am currently working at the [RIPE NCC](https://www.ripe.net/ "A Regional Internet registry."). We're one of the five [Regional Internet registries](https://en.wikipedia.org/wiki/Regional_Internet_registry "The Wikipedia entry for Regional Internet registry.") that keep track of number resources, such as the IP addresses that your networks use.

### What hardware do you use?

My main workhorse machine -- for actual work -- is currently a 15" mid-2015 [MacBook Pro][macbook-pro]. It's been back to the shop twice after two catastrophic failures, so by now it's part-new and part-refurbed.

I have a couple of other machines that get regular use: a Dell [XPS 13 9350][xps-13] running [Ubuntu][]; a 2011 MacBook Pro which has outlived every company MBP I've been given since; an [iPad Pro][ipad-pro] which I'm sure I only use about 5% of. I have an HP [ProLiant N40L][proliant-microserver-n40l] that's been chugging along since forever, with more terabytes of storage than I'll need any time soon.

In the more Googley ecosystem, I've been using a [OnePlus 6][oneplus-6] as my phone for the last 18 months, and it's extremely nice. I have two [Chromecasts][chromecast]: one audio, plugged right into the back of my amplifier, and one video, plugged right into the back of my TV.

For audio, my amplifier is a Cambridge Audio [Azur 540A][azur-540a], which isn't super new but it's been with me for over a decade and, aside from soldering new switches into it a couple years ago, just keeps on going. My headphone selection is:

* RHA [MA650][] wired earbuds, which I typically use when on travel (so currently they're gathering dust). For the money, RHA make some of the best-sounding earbuds that I've ever tried.
* AKG [Y500][] Bluetooth on-ears which I throw in my bag between home and the office (so currently ... yeah). They're my "do not disturb" indicator.
* Audio Technica [ATH-M50x][] over-ears, which I can wear for hours on end.

Now that everybody works from home, I figure it's good to cover the home office. My setup is basically:

* An IKEA [SKARSTA sit/stand desk][skarsta]. I almost never adjust the height so I don't mind the manual mechanism, but it's good to have the option.
* A Herman Miller [SAYL chair][sayl]. It's real nice: solid construction and super comfortable.
* I also have a cheap monitor mount to free up desk space, which is currently holding a Samsung Curved 27" monitor and an ancient 27" ACER display.
* A small Pway [KVM][pw-sh0201b] to help reduce cable switching.
* I also have a laptop riser to put the laptop closer to eye-level.
* And, a cheap FIFINE [USB desk mic][k669b], an easy step-up from a built-in mic.

I said up-top that I'm a networking person, so of course I manage some of my own hardware. I have a Ubiquiti [Edgerouter X][edgerouter-x], a Ubiquiti [AC Lite wireless access point][unifi-ac-lite-ap], and a cheap 5-port TP-Link gigabit switch.

Also I'll occasionally take photos, and the camera on my phone is pretty good for a lot of point-and-shoot. For something more, I have a Canon [EOS 80D][eos-80d] and a handful of lenses. As far as possible, I like what came from the lens to be the finished photo. Capture, upload, done.

Finally: I've always been into the hardware that Atari produced starting from the 16-bit ST line. I have three STs in various states of disrepair, including the STE I grew up with. Recently I fixed an audio glitch in that computer that had been present for at least 25 years, and I couldn't have been happier. That machine has a full 4MB RAM, the last ROM revision for the hardware, a hardware mod to run a modem at 56kbps, an expansion cartridge to offer USB and Ethernet access, and an aftermarket internal IDE hard drive mod which I've since added an IDE-to-SD interface to. So now it boots from a 32GB SD card. I love it. I archive my old floppy disks with a [KryoFlux][] device that reads the magnetic data from the disk itself.

### And what software?

I spend my time on the command line, often logged into other machines. [mosh][] and [tmux][] are indispensable to me. I have very little time or energy for custom configuration, so whenever possible I like to stick with default configs. If I'm going to be on a machine often I'll drop in very simple configs for [bash][], [vim][], etc.

A lot of my time is spent poring over data or looking at fields in packet headers. [tcpdump][] is the workhorse, and [Wireshark][] is a wonderful tool. [Python][] + [Scapy][] and/or [dpkt][] can go a long way for some analyses. Certain types of work need me to throw blobs of JSON around, and [jq][] gets me through a lot. If I want to burn some cycles on a few local cores, or across some locally-managed machines, [GNU Parallel][gnu-parallel] comes in useful.

Occasionally I co-author papers with collaborators. Academic conferences push almost all of the typesetting work onto the authors, and for this [LaTeX][] is still definitely the common tool. The [TeX Live][tex-live] distribution is gigantic but it'll build a document that looks identical regardless of the system you build it on. For collaboration, [Overleaf][] has become an alarmingly good online collaborative writing tool for this, with some great [git][] integration to boot.

For drawing plots, [Gnuplot][] is still my go-to, and the main reason it stays that way is I can rattle off Gnuplot commands without reference. [R][] is ridiculously powerful for some analyses. I feel like I ought to double-down on [Jupyter][] notebooks or somesuch for more open analysis and collaboration.

Recently we've been throwing data into Google's [BigQuery][], so I've learned a bunch about how to work in that ecosystem. In the past, I've run ongoing analyses on massive [Hadoop][] clusters, and ad-hoc analyses on small clusters, and in all cases I find working with Hadoop to be way more work than I truly want.

For public speaking, [Keynote][], mainly because it's the default. I've built [Beamer][] slides with tikz diagrams in the past and, with enough time, they can be great. But the path of least resistance is to take the corporate keynote template and butcher it into what I need.

### What would be your dream setup?

I've kept a home office every place I lived for the last 10+ years, so by now I know what works for me.

Deep down I'd like a desk that's 2m wide and maybe only 50cm deep. And I'd like a more efficient way of storing a laptop while it's being used hooked up to external screens. The screens I have could be much newer. I'd like gigabit Ethernet throughout my apartment. I've been thinking of sorting out a tenkeyless mechanical keyboard, but whenever I look I get overwhelmed by choice and I never take the plunge. Also, I'd like to be good at cable management, and I am not good at cable management.

And, I'll always want an Atari [Falcon][falcon030] but [eBay][] prices are always comfortably above $1,000, and that always feels like a ridiculous price to pay. I'll simply continue dreaming.

[ath-m50x]: https://www.audio-technica.com/cms/headphones/99aff89488ddd6b1/index.html "Over-the-ear headphones."
[azur-540a]: https://techsupport.cambridgeaudio.com/hc/en-us/articles/200569842-Azur-540A-V1-V2 "An amp."
[bash]: http://www.gnu.org/software/bash/ "A terminal shell."
[beamer]: https://bitbucket.org/rivanvx/beamer/wiki/Home "A LaTeX class for creating presentations."
[bigquery]: https://en.wikipedia.org/wiki/BigQuery "A data warehouse service."
[chromecast]: https://en.wikipedia.org/wiki/Chromecast "A digital media player for televisions."
[dpkt]: https://dpkt.readthedocs.io/en/latest/ "A Python package for working with network packets."
[ebay]: https://www.ebay.com/ "An auction service."
[edgerouter-x]: https://www.ui.com/edgemax/edgerouter-x/ "A networking router."
[eos-80d]: https://www.usa.canon.com/internet/portal/us/home/products/details/cameras/eos-dslr-and-mirrorless-cameras/dslr/eos-80d "A 24.2 megapixel DSLR."
[falcon030]: https://en.wikipedia.org/wiki/Atari_Falcon "An Atari personal computer."
[git]: https://git-scm.com/ "A version control system."
[gnu-parallel]: https://www.gnu.org/software/parallel/ "A tool for running jobs in parallel on multiple computers."
[gnuplot]: http://www.gnuplot.info/ "A command-line graphing tool."
[hadoop]: http://hadoop.apache.org/ "Open-source distributed data computing software."
[ipad-pro]: https://en.wikipedia.org/wiki/IPad_Pro "An iOS tablet."
[jq]: https://stedolan.github.io/jq/ "A command line tool for manipulating JSON data."
[jupyter]: https://jupyter.org/ "Web-based live document software."
[k669b]: https://fifinemicrophone.com/collections/microphones/products/usb-microphone-with-volume-control-k669-669b "A USB microphone."
[keynote]: https://www.apple.com/keynote/ "Presentation software for the Mac."
[kryoflux]: https://www.kryoflux.com/ "A device for accurately reading data off floppy drives."
[latex]: https://www.latex-project.org/ "Typesetting software."
[ma650]: https://www.techradar.com/reviews/rha-ma650-wireless-in-ear-headphones "Wireless in-ear headphones."
[macbook-pro]: https://www.apple.com/macbook-pro/ "A laptop."
[mosh]: https://mosh.org/ "A remote terminal shell system."
[oneplus-6]: https://en.wikipedia.org/wiki/OnePlus_6 "A 6.28 inch Android smartphone."
[overleaf]: https://www.overleaf.com/ "A web-based LaTeX editor."
[proliant-microserver-n40l]: https://n40l.fandom.com/wiki/HP_MicroServer_N40L_Wiki "A small computer."
[pw-sh0201b]: http://www.pwaytek.com/en/product/products-0-20.html<Paste> "An HDMI KVM."
[python]: https://www.python.org/ "An interpreted scripting language."
[r]: http://www.r-project.org/ "Software for statistical computing and graphics."
[sayl]: http://www.hermanmiller.com/products/seating/performance-work-chairs/sayl-chairs.html "A work chair."
[scapy]: https://pypi.org/project/scapy/ "A tool for working with networking packets."
[skarsta]: https://www.ikea.com/gb/en/products/desks/desk-computer-desks/skarsta-desk-sit-stand-white-spr-29084966/ "A height-adjustable desk."
[tcpdump]: http://www.tcpdump.org/ "A command-line tool for analysing packets."
[tex-live]: https://tug.org/texlive/ "A TeX system."
[tmux]: https://sourceforge.net/projects/tmux/ "A terminal multiplexer, similar to screen."
[ubuntu]: https://www.ubuntu.com/ "A Unix distribution."
[unifi-ac-lite-ap]: https://www.ui.com/unifi/unifi-ap-ac-lite/ "A wireless access point."
[vim]: https://www.vim.org/ "A command-line text editor."
[wireshark]: https://www.wireshark.org/ "A network protocol analyser."
[xps-13]: https://www.dell.com/us/p/xps-13-9333/pd "A 13 inch PC laptop."
[y500]: https://www.akg.com/Headphones/Over-ear%20%26%20On-ear/AKG+Y500+Wireless.html "Wireless on-ear headphones."
