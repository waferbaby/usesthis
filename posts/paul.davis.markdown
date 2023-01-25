---
title: Paul Davis
summary: Developer (Ardour, JACK) 
date: 2020-02-06
categories:
- audio
- developer 
- linux
- mac
---

### Who are you, and what do you do?

I'm [Paul Davis](http://equalarea.com/paul/ "Paul's website."), the original developer and benign dictator of [Ardour][], an open source digital audio workstation used for recording, editing and mixing music (or more generally sound). Ardour has been my central project for the last 20 years, and I've made a living from it for the last 10 years or so. I've also worked on some other audio and MIDI software, most notably [JACK][] which can be used to interconnect different audio/MIDI applications so that they can share/exchange data. My development work spans just about every aspect of native programming, from the many nuances and complications of GUI and UX design down to bare metal performance considerations, parallel, real time and lock free programming, complex data structure design and large scale data handling. Sometimes I have to deal with [Drupal][] and web stuff too, but I try to avoid it if possible. Before I got into audio software, I helped to get Amazon started.

### What hardware do you use?

My current machine is a self-built system based on an AMD [Ryzen Threadripper 2950X][ryzen-threadripper-2950x] (16 cores). It has 64GB of RAM, a 500GB NVEme drive as the primary storage, along with a secondary 500GB SSD and an external 2TB USB SSD. This system has totally changed the way I work. Compiling Ardour can take a long time - my previous system took about 9 minutes for a full build. The Ryzen system takes 2m50s! This is really helpful for encouraging me to feel entirely free to make frequent code changes that may require full rebuilds. When that now takes less than 3 minutes, its easy to not hesitate about making changes.

I run [macOS][] Mojave in an 8-core, 16GB KVM/[QEMU][] VM "within" the Ryzen system in order to do test builds for macOS and to check the functionality of Ardour on macOS.

The Ryzen system has two video interfaces. I don't need video power, I do need silence, so both of them are fanless. An ASUS [GeForce GT 710][geforce-gt-710] drives two ASUS 24" 1920x1200 monitors via HDMI and DVI; An ASUS [Radeon R5][radeon-r5-230] drives a 42" TCL 4K "TV". I don't use the TV screen for normal work, but I do like to run things like [VCV Rack][vcv-rack] (an open source modular synthesizer system) there because of the sheer size of the screen.

I use a Logitech [K800][] wireless keyboard for input, which I'm mostly ambivalent about - I can't be bothered to do more research. The mouse is a Logitech [Performance MX][performance-mouse-mx], which is almost the best pointing/input device ever created. I also have a Lenovo [Y700][ideapad-y700] "gaming" laptop which I use for mobile computing. The cost/power ratio of this beast was so far ahead of anything else, and more or less remains that way. Only the SD card reader and the absurd subwoofer in the underside don't work out of the box with Linux, which is no hardship for me.

In addition to the computer, I also have a fairly wide variety of music/audio related gear that is an integral part of my work. First up is the MOTU [UltraLite AVB][ultralite-avb] audio interface, which is connected via USB and gives me 24 channels of audio I/O along with a completely portable web-based configuration system. That is connected to a Yamaha [01V96i][] digital mixer, which in turn feeds two Genelec [1029A][] monitors along with a Genelec [7050C][] subwoofer. I also have some cheap M-Audio monitors to complete a 4 speaker "surround" setup that I use for testing Ardour with multichannel workflows. I use a pair of Sony [MDR-7506][] headphones which are absolutely superlative, particularly in the low end.

In addition to the actual audio signal flow, I also have a variety of MIDI control surfaces:

  - Mackie [MCU Pro][mcu-pro]
  - Solid State Logic [Nucleus][] 1
  - Presonus [FaderPort][] 1
  - Ableton [Push][] 2
  - DrumKat DK10
  - Roland [HandSonic][handsonic-hpd-20]
  - M-Audio KeyStation 88
  - Behringer [FCB1010][] pedal board
  - M-Audio MIDI sustain/expression pedals

These will soon be joined by a Roli [Seaboard][].

I use an ancient Ensoniq KMX-16 MIDI patchbay to route all my traditional MIDI devices, which ultimately connect to the computer via an old Midiman MIDISport 2x2. The MOTU Ultralite has MIDI I/O but the performance is unacceptable.

My one and only hardware synth is a Kawaii K5000S which I've had for more than 20 years. I use it less and less in favor of software (plugin) synths. My current favorites are Pianoteq 5, and Zebra 2 and Hive from U-he.

I work at a self-built electric variable height desk. The mechanism itself is a VertDesk V3. When sitting I switch between a Balans kneeling chair and a regular office chair. 

### And what software?

The Ryzen currently runs [Debian][] Buster. Ardour is written almost entirely in [C++][c-plusplus], with bits of assembler (that we rarely touch) and Lua as a builtin scripting environment. I've used GNU [Emacs][] for more than 30 years, and continue to use it as my editor for just about everything except formatted text documents where I tend to use [LibreOffice][]. I use [zsh][] as my shell, [Firefox][] as my browser. My family uses [Telegram][] to keep in touch, and the Ardour project uses IRC, so I run a Quassel server on ardour.org and connect to it use the graphical Quassel client. I play/manage my 15k song collection using Clementine, though when I'm working out I listen on a Sansa Clip+ player with a 128GB SD card. 

We build Ardour using waf (itself written in [Python][]), and manage its development using [git][].  Ardour's web presence exists across several subdomains, all hosted on [AWS][] with [nginx][] as our web server. On git.ardour.org we use an ancient version of [GitLab][] as a self-hosted git server. tracker.ardour.org uses [Mantis][] as our bug tracker. discourse.ardour.org uses [Discourse][] to run our web forums. community.ardour.org runs Drupal (for historical reasons), and ardour.org itself is a static site generated using some custom Ruby code. The same is true of manual.ardour.org

### What would be your dream setup?

I think I already have it.

[01v96i]: https://usa.yamaha.com/products/proaudio/mixers/01v96i/index.html "A digital mixer."
[1029a]: https://www.genelec.com/previous-models/1029a "Studio speakers."
[7050c]: https://www.genelec.com/7050c/ "A subwoofer."
[ardour]: http://ardour.org/ "A digital audio workstation."
[aws]: https://aws.amazon.com/ "Amazon's web service platforms."
[c-plusplus]: https://en.wikipedia.org/wiki/C%2B%2B "A compiled programming language."
[debian]: https://www.debian.org/ "A Linux distribution."
[discourse]: https://www.discourse.org/ "An open-source discussion platform."
[drupal]: https://www.drupal.org/ "An open-source content management system."
[emacs]: http://www.gnu.org/software/emacs/ "A free open-source text editor."
[faderport]: https://www.presonus.com/products/FaderPort/ "A audio control deck."
[fcb1010]: http://web.archive.org/web/20211111012024/https://www.sweetwater.com/store/detail/FCB1010--behringer-midi-foot-controller-fcb1010 "A MIDI foot controller."
[firefox]: https://www.mozilla.org/en-US/firefox/new/ "A cross-platform open-source web browser."
[geforce-gt-710]: https://www.asus.com/Graphics-Cards/710-2-SL/ "A graphics card."
[git]: https://git-scm.com/ "A version control system."
[gitlab]: https://about.gitlab.com/ "A git repository manager."
[handsonic-hpd-20]: https://www.roland.com/us/products/handsonic_hpd-20/ "A hand-held drum machine."
[ideapad-y700]: https://www.lenovo.com/us/en/laptops/ideapad/ideapad-y700-series/Ideapad-Y700-15/p/88IPY700618 "A 15 inch gaming laptop."
[jack]: https://jackaudio.org/ "A tool for connecting audio sources."
[k800]: https://www.logitech.com/en-us/product/wireless-illuminated-keyboard-k800 "A wireless keyboard."
[libreoffice]: https://www.libreoffice.org/ "A free, open-source productivity suit."
[macos]: https://en.wikipedia.org/wiki/MacOS "An operating system for Mac hardware."
[mantis]: https://en.wikipedia.org/wiki/Mantis_Bug_Tracker "Web-based bug tracking software."
[mcu-pro]: https://mackie.com/products/mcu-pro-and-xt-pro-control-surfaces/ "An audio control deck."
[mdr-7506]: https://www.amazon.com/Sony-MDR7506-Professional-Diaphragm-Headphone/dp/B000AJIF4E "Studio-quality headphones."
[nginx]: http://nginx.org/ "A very fast web/mail server."
[nucleus]: https://www.solidstatelogic.com/support/discontinued-products?active=11 "An audio controller."
[performance-mouse-mx]: https://www.logitech.com/en-us/product/performance-mouse-mx "A wireless laser mouse."
[push]: https://www.ableton.com/en/push/ "Unique music-making hardware."
[python]: https://www.python.org/ "An interpreted scripting language."
[qemu]: https://en.wikipedia.org/wiki/QEMU "Open-source emulation software."
[radeon-r5-230]: https://www.asus.com/Graphics-Cards/R5230SL2GD3L/ "A graphics card."
[ryzen-threadripper-2950x]: https://www.tomshardware.com/reviews/amd-ryzen-threadripper-2950x-2990wx-cpu,5797.html "A computer processor."
[seaboard]: https://roli.com/products/seaboard/ "A unique musical keyboard."
[telegram]: https://telegram.org/ "A secure messaging service."
[ultralite-avb]: https://motu.com/products/avb/ultralite-avb/ "An 18 port audio interface."
[vcv-rack]: https://vcvrack.com/ "A virtual audio rack."
[zsh]: http://www.zsh.org/ "An interactive shell and scripting language."
