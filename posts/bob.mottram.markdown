---
title: Bob Mottram
summary: Software developer (Freedombone) 
date: 2019-09-03
categories:
- developer 
- linux
---

### Who are you, and what do you do?

My name is [Bob Mottram](https://twitter.com/motters "Bob's Twitter account."). I'm a Free Software developer working on self-hosted server and mesh network systems. My main project is called [Freedombone][]. In the past I worked on industrial robots and computer vision (eg. [chestscan][], [depth map](https://www.youtube.com/watch?v=Mx_JqLWVwgM "Bob's YouTube video of his depth map of his desktop.")), but as employment in that industry dried up almost a decade ago I switched over to being more of a generalist.

I live in a remote area of northern England where costs are low and the population is sparse. In addition to coding my daily existence includes building garden furniture, cooking and roof maintenance.

Like the archetypal hacker I started programming at the age of ten and never really stopped. It's almost like an addiction. I am a creature of the shell and keyboard. Since childhood I don't think there has been any period of time where I havn't had software projects going.

### What hardware do you use?

My main hardware is a ThinkPenguin laptop which I bought in 2015. It's a re-branded Clevo with Atheros wifi, 16GB RAM and two 512GB SSD drives. The build quality isn't the greatest since it's quite plasticy, but performance is good. There are NFC stickers on the lid and beneath the keyboard containing my GPG public key and contact details so that people can quickly scan that if needed.

I also have a desktop machine which is a [ROCK64][] with 4GB RAM. It has a small USB 3 hub plugged in and an SSD connected, monitor, Kingston Orbit trackball and Unicomp spacesaver keyboard. Without the monitor the whole system runs on 10W of electrical power and with the monitor it's about 40W. I also have a full sized Unicomp keyboard which I "bolted" recently (replaced the plastic rivets on the backplate with metal bolts) but it consumes too much electrical power for what I'm doing currently. Maybe I will investigate changing the electronics.

My mobile phone is an increasingly archaic Samsung [Galaxy S4][galaxy-s4] with a large battery such that I don't need to be overly concerned about charging it. I will probably replace it within the next year, because the operating system is no longer updated and sooner or later there will be some major security bug which I won't be able to fix. Even though it's old by phone standards it runs very well with no discernible slowness.

I also have some single board computers for testing. [BeagleBone Blacks][beaglebone-black], [ODROID][] and [Cubieboard][]. They're also not exactly the latest thing, but good enough for testing server deployments. I use an old Samsung [N140][netbook-n140] netbook for serial access to single board computers so that I can debug the boot sequence or update router firmware when necessary. The netbook has also been retrofitted with an SSD and replacement Atheros wifi.

My server is currently an old quad core Lenovo laptop with 8GB RAM and a 240GB SSD which was donated in 2012. Its screen is broken, but that doesn't affect its performance as a server. I also removed the wifi card since it wasn't needed in this use case and otherwise merely creates attack surface.

### And what software?

My laptop and netbook run [Parabola][], which is a Free Software version of [Arch][arch-linux] with the [linux-libre][] kernel. The desktop is environment is [LXDE][], which takes minimal resources and keeps out of the way. The random assortment of screen savers is nice too. I've been running Parabola for the last three years and most of the time it's been a great distro. There have been a couple of occasions where there were show-stopping bugs, such as kernel boot failure, so I wouldn't recommend this to new GNU/Linux users, but for software development having recent versions of packages with a rolling distro is useful.

On the ROCK64 desktop I run [Armbian][], based on [Debian][] 10 with [XFCE][]. It's undoubtedly slower when building server disk images but for most other purposes is adequate. The kernel is stuck on an old version due to a proprietary graphics driver, but I would rather make this trade-off than be running a desktop machine consuming hundreds of watts of electricity.

I've been an [Emacs][] user for about a decade and so most of the time my screen is just Emacs buffers and I can keyboard switch between that and a [Tor][] browser or [IceCat][]. I'm currently typing this in Emacs [org-mode][], which I use for nearly all kinds of documentation.

As for programming I mainly use [bash][] and [C][] and am starting to do more things with [Python][].

### What would be your dream setup?

In an ideal world I would be as technologically autonomous as possible and be running everything from solar power. Living in the north of England this is not a highly realistic aim unless I had money for giant panels and permission to install them. There are some people who do this however, and every year I occasionally see a few more houses whose south facing roof is covered by solar PV.

In terms of hardware ideally I would be using open hardware designs with no proprietary drivers, and computers would be more repairable than they currently are. So my dream setup would be something which doesn't presently exist but might in future. A phone based on an open hardware design running either a full GNU/Linux or [Android][] with a mainline kernel would be ideal. I know there are people working towards that, but it might still be a while before anything similar is available in my price range.

My ideal laptop would have metal casing, a mechanical keyboard similar to some early machines from the 1990s (I don't care if that makes it physically thicker) and be similar to the EOMA68 concept in that the computing electronics would be swappable. Something like a pi-top, but better build quality.

[android]: https://developers.google.com/android/?csw=1 "A mobile phone platform."
[arch-linux]: https://www.archlinux.org/ "A Linux distro."
[armbian]: https://en.wikipedia.org/wiki/Armbian "A Linux distribution."
[bash]: http://www.gnu.org/software/bash/ "A terminal shell."
[beaglebone-black]: https://beagleboard.org/black "A tiny development computer."
[c]: https://en.wikipedia.org/wiki/C_(programming_language) "A compiled programming language."
[chestscan]: https://code.freedombone.net/bashrc/chestscan "Software for extracting ribcage images from chest x-rays."
[cubieboard]: https://en.wikipedia.org/wiki/Cubieboard "A single board computer."
[debian]: https://www.debian.org/ "A Linux distribution."
[emacs]: http://www.gnu.org/software/emacs/ "A free open-source text editor."
[freedombone]: http://web.archive.org/web/20220922130740/http://freedombone.net/ "Self-hosted Internet service software."
[galaxy-s4]: http://web.archive.org/web/20160303195928/http://www.samsung.com/global/microsite/galaxys4/ "A 5 inch Android smartphone."
[icecat]: https://www.gnu.org/software/gnuzilla/ "A GNU version of Firefox."
[linux-libre]: https://en.wikipedia.org/wiki/Linux-libre "A Linux kernel."
[lxde]: https://en.wikipedia.org/wiki/LXDE "A Linux desktop environment."
[netbook-n140]: https://www.samsung.com/us/support/owners/product/n140 "A 10.1 inch netbook."
[odroid]: https://en.wikipedia.org/wiki/ODROID "A single board computer."
[org-mode]: https://orgmode.org/ "An Emacs mode for notes and to-do items."
[parabola]: https://en.wikipedia.org/wiki/Parabola_GNU/Linux-libre "A Linux distribution."
[python]: https://www.python.org/ "An interpreted scripting language."
[rock64]: https://www.pine64.org/devices/single-board-computers/rock64/ "A single board computer."
[tor]: https://www.torproject.org/ "A software and network package for protecting your anonymity."
[xfce]: https://www.xfce.org/ "A lightweight UNIX-like desktop environment."
