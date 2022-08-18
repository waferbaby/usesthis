---
title: TomNomNom
summary: Security researcher, developer 
date: 2020-09-16
categories:
- developer
- linux
- security
- windows
---

### Who are you, and what do you do?

I'm Tom; aka [TomNomNom](https://twitter.com/TomNomNom "Tom's Twitter account."). I'm the tech lead for security research at [Detectify][], where I've been since January 2020. Before that I was a technical trainer - teaching graduate students to code and do general ops type stuff. I've spent time as a lead software engineer, DevOpsy type person, a Solutions Architect, and a bunch of other stuff.

Outside of work I'm probably best known for [my open source tools](https://github.com/tomnomnom/ "Tom's GitHub account."), many of which were written for use in bug bounty hunting. Most of them are written in [Go][].

### What hardware do you use?

My main personal machine is a self-built desktop system. It's an [MSI X470 motherboard][x470-gaming-plus], a [Ryzen 7 2700X][ryzen-7-2700x], 16GB of DDR4, a couple of 500GB [Samsung 970 EVO NVMe SSDs][970-evo], a [GTX 1080][geforce-gtx-1080], and a few TB of mechanical disks. It sits in an Antec case under my desk. I'd rate the hardware as *OK*; it mostly does what I want, but it could do with being a little quieter.

I do love having good hardware (see last question ;)), but the parts I interact with are the most important, and where I stray from the norm a little. The most obvious thing on my desk is a 43' 2160p display. It's actually an LG TV; I forget the exact model but it's discontinued and has a few issues anyway. I used to run three 22' 1080p displays side-by-side; but it took up a lot of desk space, and wasn't all that great for playing games, or watching videos etc. 43' might seem like overkill, but honestly the 34' ultrawide I use on my work machine feels pretty cramped in comparison now that I'm used to it.

For sound I have a couple of [KRK ROKIT 5 active monitors][rokit-5] fed by a [Focusrite Scarlett 2i2][scarlett-2i2]. I listen to music a lot while I'm working, so I really appreciate having good quality sound.

My mouse is a wired [Microsoft Comfort 6000][comfort-mouse-6000]; which seems to be discontinued. It's quite big, so it suits my hands well. My keyboard is a [Filco Majestouch 2 Tenkeyless][majestouch-2] with Cherry MX Brown switches. I'm quite a heavy typer so it makes a hell of a noise when I get going.

For when I attend [live hacking events](https://www.hackerone.com/blog/london-called-hackers-answered-recapping-h1-4420 "A post about a HackerOne hacking event in London, 2019.") I have a 2019 [Dell XPS 15][xps-15]. It's OK, but this year's model looks to have a much better screen and trackpad.

### And what software?

My system is currently set up for dual-boot between [Windows 10][windows-10] and [Ubuntu][] 20.04. I only really boot into Windows to play the occasional game or use a piece of software that's misbehaving on Linux, or only available on Windows. [Valve's Proton][proton] has made impressive progress for running Windows games under Linux, but it still has a few quirks. I've been playing [Command & Conquer Remastered][command-and-conquer-remastered] recently, which has been a great way to re-live that part of my youth.

Ubuntu is where I do pretty much everything else. I usually have 4 windows open:

* [Terminator][]
* [Chrome][]
* [Spotify][]
* [Slack][]

If I'm doing some hacking I might have [Burp Suite][burp] open too. Other than Windows, Burp Suite is the only paid-for software I use.

Nearly all of my time spent actually "doing things" (as opposed to just browsing the web and watching endless [YouTube][] videos) is spent in the terminal; which is [something I seem to have become known for](https://www.youtube.com/watch?v=l8iXMgk2nnY "A YouTube video of Tom demonstrating pentesting with Linux shell tools."). I use [Bash][] as my shell, [vim][] as my editor, [grep][] for searching, and a long, long list of custom built tools. You can find my config for bash, vim etc [here](https://github.com/tomnomnom/dotfiles "Tom's dotfiles repo on GitHub.").

For writing tools I almost always use Go. It fits well with my mental model of how programs work, has a great standard library and tooling, and perhaps best of all: makes distributing software super easy.

I love open-source software, and release just about everything I write outside of work under the MIT license.

### What would be your dream setup?

My current setup is pretty nice, but there's plenty I'd change.

My screen is *OK*, but the fact that it's actually a TV really shows sometimes; e.g. you lose about 1mm of the very edge of the picture if you sit too close due to the way it's constructed. I think 43' is a reasonable size (I could deal with bigger though), but I'd really love for it to have 120 or 240hz refresh rate, be HDR, and be OLED.  Higher resolution would be nice too; maybe 8K / 4320p. I wouldn't turn down having three of them either :-P There's nothing quite like that on the market right now, but something like this [LG C9 OLED][oled55c9pua] would probably do fine for now.

For the hardware inside the case, I'd like it to be silent, have lots of cores, lots of RAM, good graphics, and most of all: lots of very fast storage. With current tech it'd probably be something like:

* [Intel Optane PCIe SSD][optane-ssd-900p] for boot/OS etc
* [Liqid Honey Badger][lqd4500] with 32TB of fast NVMe SSDs
* 512GB or more of fast RAM
* A [Threadripper 3990X][ryzen-threadripper-3990x]
* A couple of [RTX 2080 Ti][geforce-rtx-2080-ti] GPUs

The storage thing might seem crazy, but I'd really like to be able to do stuff like, for example, clone and search 100,000 git repos.

Otherwise I'd like a better mouse, and maybe a change to slightly quieter key-switches on my keyboard.

[970-evo]: https://www.samsung.com/semiconductor/minisite/ssd/product/consumer/970evo/ "An SSD drive."
[bash]: http://www.gnu.org/software/bash/ "A terminal shell."
[burp]: https://portswigger.net/burp/ "Software for vulnerability scanning and traffic interception."
[chrome]: https://www.google.com/intl/en/chrome/browser/ "A WebKit-based browser, where each tab runs in its own thread."
[comfort-mouse-6000]: https://www.microsoft.com/accessories/en-us/d/comfort-mouse-6000 "A mouse."
[command-and-conquer-remastered]: https://www.ea.com/games/command-and-conquer/command-and-conquer-remastered "A classic RTS game, remastered."
[detectify]: https://detectify.com/ "A service for automatically detecting security issues for your own service."
[geforce-gtx-1080]: https://www.nvidia.com/en-us/geforce/products/10series/geforce-gtx-1080/ "A graphics card."
[geforce-rtx-2080-ti]: https://www.nvidia.com/en-us/geforce/graphics-cards/rtx-2080-ti/ "A graphics card."
[go]: https://golang.org/ "A compiled programming language."
[grep]: http://www.gnu.org/software/grep/ "A command-line tool for pattern matching in files."
[lqd4500]: https://www.liqid.com/products/composable-storage/element-lqd4500-pcie-aic-ssd "A PCIe SSD drive."
[majestouch-2]: https://mechanicalkeyboards.com/shop/index.php?l=product_detail&p=2250 "A mechanical keyboard."
[oled55c9pua]: https://www.lg.com/us/tvs/lg-OLED55C9PUA-oled-4k-tv "A 55 inch 4K TV."
[optane-ssd-900p]: https://www.intel.com/content/www/us/en/products/memory-storage/solid-state-drives/consumer-ssds/optane-ssd-9-series/optane-ssd-900p-series.html "A PCIe SSD drive."
[proton]: https://github.com/ValveSoftware/Proton "A Steam tool to help Windows games run on Linux."
[rokit-5]: http://www.krksys.com/krk-studio-monitor-speakers/rokit/rokit-5.html "Studio monitors."
[ryzen-7-2700x]: https://www.amd.com/en/products/cpu/amd-ryzen-7-2700x "A computer processor."
[ryzen-threadripper-3990x]: https://www.amd.com/en/products/cpu/amd-ryzen-threadripper-3990x "A computer processor."
[scarlett-2i2]: https://focusrite.com/en/usb-audio-interface/scarlett/scarlett-2i2-studio "A USB audio interface."
[slack]: https://slack.com/ "A collaboration service."
[spotify]: https://www.spotify.com/us/ "A music streaming service."
[terminator]: https://code.google.com/archive/p/jessies/wikis/Terminator.wiki "A terminal client."
[ubuntu]: https://www.ubuntu.com/ "A Unix distribution."
[vim]: https://www.vim.org/ "A command-line text editor."
[windows-10]: https://en.wikipedia.org/wiki/Windows_10 "An operating system."
[x470-gaming-plus]: https://www.msi.com/Motherboard/X470-GAMING-PLUS "A PC motherboard."
[xps-15]: https://www.dell.com/en-us/shop/productdetails/xps-15-9530 "A 15.6 inch PC laptop."
[youtube]: https://www.youtube.com/ "A web site for watching 80's TV commercials and bad mashups."
