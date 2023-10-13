---
title: iliana etaoin
summary: Software developer catgirl
date: 2023-10-13
categories:
- developer
- bsd
- linux
- mac
---

### Who are you, and what do you do?

I'm [iliana etaoin](https://iliana.fyi/ "iliana's website."), and I spend too much time around computers (my parents were right!). Depending on context, I'll sometimes refer to myself as a "systems engineer" or a "software developer" or a "catgirl". I work at [Oxide Computer Company](https://oxide.computer/ "A rack computer company.") on the control plane for a rack-scale server; I previously worked on Linux distributions at AWS and Red Hat for about a decade. Outside of work I spend much of my time tinkering with my homelab-outside-the-home and the network it lives in.

### What hardware do you use?

My main computer ("redwood") is a [Mac studio][mac-studio], bought as an emergency upgrade when one of the DIMMs in my [Mac mini][mac-mini] failed. Under my desk is a [System76 Thelio][thelio] I use for testing at work. My primary on-the-go device is a heavily-stickered [MacBook Pro][macbook-pro] ("keysmash"). I have a pile of ThinkPads as old as the [X220][thinkpad-x220] strewn across the house; one is my formerly-daily-driver [ThinkPad X270][thinkpad-x270] ("horizon") that I recently moved to a nearby friend's place to use when I'm there. There's also several Raspberry Pi boards of different generations running in my closet.

Plugged into my main computer is a [Keyboardio Model 100][model-100] with [my firmware](https://github.com/iliana/kbd "iliana's custom keyboard firmware."); I have been using Keyboardio's keyboards since my first [Model 01][model-01] shipped. I use an [MX Ergo trackball][mx-ergo] and I wish they would stop using a rubberized coating for it; after barely over a year of use I can feel it returning to petroleum. I have two [HP Z27n G2 displays][z27n-g2]; perched atop one is a [Kiyo Pro][kiyo-pro]. I use [DT 770 PRO headphones][dt-770-pro] (with [aftermarket cat ears][kitty-ears-for-razer-kraken]) plugged into a [a DAC][fulla-2] I use solely for its tactile volume control knob. I have a [Planck Light keyboard][planck-light] I sometimes use as a generic button board; currently I use it for [speedrunning](https://www.speedrun.com/vvvvvv "Speedrun entries for the game VVVVVV on speedrun.com.") [VVVVVV][].

In the homelab-outside-of-home, alongside a handful of friends' servers, is a [PowerEdge R620][poweredge-r620] ("pancake") as my main server. I'm currently working on moving to a new router based on a [Supermicro server board][x10sdv-4c-7tp4f] and a [FORCE10 S4810P switch][powerswitch-s4810p]; the equipment I'm trying to move off of is a router based on some x86 SOC both I and my mailbox have forgotten the name of and an [ProCurve 2848 switch][procurve-2848]. I try to use recycled hardware for my homelab because, well, it's cheap, but also I want to see it keep getting some use even if businesses think it's past its "useful" life or whatever. I have also developed very specific opinions about rail kits from different server manufacturers.

My pocket RSI brick is an [iPhone SE][iphone-se], and my main device for video games is a [Nintendo Switch][switch.2].

I honestly don't know if the number of devices in my life has increased or decreased over the past decade.

### And what software?

My Macs tend to follow the oldstable release of [macOS][] (Ventura has been out for most a year and I'm on Monterey). My Thelio is running Helios, Oxide's [illumos][] distribution. I recently installed [Arch Linux][arch-linux] on my X270. The PowerEdge R620 runs [Debian][]. Most of my personal infrastructure runs in VMs on the R620 running my [NixOS][] [configurations](https://github.com/iliana/nixos-configs "iliana's NixOS configs on GitHub."), but I still have some Debian VMs running services I haven't Nixified yet. My current homelab router is running [OpenBSD][], and the new homelab router is currently slated to run a custom Linux distro build using [Buildroot][].

My Macs get [Homebrew][] installed on them first thing. I like using [KDE][] for my Linux desktops, but some are also running [XFCE][].

I use [kitty][] as a terminal emulator, [tmux][] as a terminal multiplexer, and [Helix][] as a code/text editor; these are extensively configured by [my dotfiles](https://github.com/iliana/dotfiles "iliana's dotfiles on GitHub."). My terminal font is [Iosevka][]. Based on my `~/.bash_history`, the other command-line tools I use the most are [Git][], [ripgrep][], [fd][], [htop][], [curl][], and [jq][].

I use [Firefox][] for my web browser, but I'd probably use [Safari][] on my Macs if it had anything like [Container Tabs](https://support.mozilla.org/en-US/kb/containers). Other load-bearing Firefox extensions include [uBlock Origin][ublock-origin] (along with some [personal filter rules](https://github.com/iliana/ublock-rules/blob/gh-pages/rules.txt "iliana's uBlock rules on GitHub.")) and [Stylus][stylus.2]. My feed reader is [NetNewsWire][].

I use [Tailscale][] heavily; along with Helix, it's some of the only software I've used recently that feels absolutely magical. My web servers run [Caddy][], and my authoritative DNS servers run [PowerDNS][]. I use [Syncthing][] to sync things, and [Time Machine][time-machine] and [restic][] for backups. For IRC I use [pounce][] as a bouncer, [WeeChat][] on my computers, and [Palaver][palaver-ios] on my phone. 

When programming, I tend to reach for [Bash][], [Rust][], and [Python][], in roughly that order; [ShellCheck][] finds most of my Bash programming mistakes. [mpv][] is my desktop music player, and [noTunes][] helps me keep it that way; I use [Doppler][doppler-ios] to listen to music on my phone. I maintain my music library with a combination of some Python scripts, [MusicBrainz Picard][picard], and [Mp3tag][]. In the rare moments I am working on something graphical, I use [Affinity Designer][affinity-designer] and [Publisher][affinity-publisher]. I mostly use [Mail.app][mail] to read email. Depending on where my brain is at, I'll either use the Python REPL or [PCalc][] in RPN mode as my desktop calculator.

### What would be your dream setup?

My dream setup is to defeat whichever demons cursed me with computering, then open a gluten-free bakery/deli. I do not think I will find these demons for a very long time, so if you are my employer please do not be concerned.

In the shorter-term, I want to start learning to use [Talon][] and an eye tracker so I can stop abusing my hands so much. I'd also love to have [AsciiDoc][] support in Helix, but I've looked into it just enough to classify it as a "dream" rather than something I can reasonably achieve on my own.

[affinity-designer]: https://en.wikipedia.org/wiki/Affinity_Designer "A vector graphics editor."
[affinity-publisher]: https://affinity.serif.com/en-us/publisher/ "Page layout and design software."
[arch-linux]: https://archlinux.org/ "A Linux distro."
[asciidoc]: http://www.methods.co.nz/asciidoc/ "A text file format and software that's easily translated to other formats."
[bash]: http://www.gnu.org/software/bash/ "A terminal shell."
[buildroot]: https://en.wikipedia.org/wiki/Buildroot "A collection of tools for building Linux for embeddable systems."
[caddy]: https://caddyserver.com/ "A web server."
[curl]: https://curl.se/ "A command-line tool for transferring data from URLs."
[debian]: https://www.debian.org/ "A Linux distribution."
[doppler-ios]: https://brushedtype.co/doppler/ "An audio player app."
[dt-770-pro]: http://web.archive.org/web/20230811124931/https://north-america.beyerdynamic.com/ "Closed headphones."
[fd]: https://github.com/sharkdp/fd "Command line software for finding files."
[firefox]: https://www.mozilla.org/en-US/firefox/new/ "A cross-platform open-source web browser."
[fulla-2]: https://www.schiit.com "A combined DAC/amp."
[git]: https://git-scm.com/ "A version control system."
[helix]: https://helix-editor.com/ "A command line text editor."
[homebrew]: https://brew.sh/ "Command-line package manager for Mac OS X."
[htop]: https://htop.dev "A command-line process viewer."
[illumos]: https://www.illumos.org/ "A Unix operating system."
[iosevka]: https://typeof.net/Iosevka/ "A monospaced font."
[iphone-se]: https://en.wikipedia.org/wiki/IPhone_SE "A 4 inch smartphone."
[jq]: https://stedolan.github.io/jq/ "A command line tool for manipulating JSON data."
[kde]: https://kde.org/ "A graphical environment for *nix operating systems."
[kitty-ears-for-razer-kraken]: https://www.razer.com/gaming-headsets-and-audio-accessories/Kitty-Ears-for-Razer-Kraken/RC21-01140100-W3M1 "Cat-like ears for attaching to the Kraken headset."
[kitty]: https://sw.kovidgoyal.net/kitty/ "A GPU-based terminal emulator."
[kiyo-pro]: http://web.archive.org/web/20221212234624/https://www.razer.com/streaming-cameras/razer-kiyo-pro/RZ19-03640100-R3U1 "A USB webcam."
[mac-mini]: https://www.apple.com/mac-mini/ "A small desktop computer."
[mac-studio]: https://en.wikipedia.org/wiki/Mac_Studio "A small form factor computer."
[macbook-pro]: https://www.apple.com/macbook-pro/ "A laptop."
[macos]: https://en.wikipedia.org/wiki/MacOS "An operating system for Mac hardware."
[mail]: https://en.wikipedia.org/wiki/Mail_(application) "The default Mac OS X mail client."
[model-01]: https://shop.keyboard.io/ "A mechanical keyboard."
[model-100]: https://shop.keyboard.io/products/model-100 "A keyboard."
[mp3tag]: https://www.mp3tag.de/en/ "Software for adding metadata to audio files."
[mpv]: https://mpv.io/ "A cross-platform media player."
[mx-ergo]: https://www.logitech.com/en-us/product/mx-ergo-wireless-trackball-mouse.html "A wireless trackball mouse"
[netnewswire]: https://en.wikipedia.org/wiki/NetNewsWire "A popular feed reader for the Mac."
[nixos]: https://nixos.org/ "A Linux distribution."
[notunes]: https://github.com/tombonez/noTunes "Mac software to prevent iTunes and Apple Music from launching."
[openbsd]: http://www.openbsd.org/ "An open-source operating system emphasising security and cryptography."
[palaver-ios]: https://palaverapp.com/ "An IRC client for iOS/iPadOS."
[pcalc]: https://pcalc.com/ "A scientific calculator for the Mac."
[picard]: https://github.com/broadinstitute/picard "Software for working with HTS data."
[planck-light]: https://drop.com/buy/massdrop-x-olkb-planck-light-mechanical-keyboard "A mechanical keyboard."
[pounce]: https://git.causal.agency/pounce/about/ "IRC bouncer software."
[powerdns]: https://www.powerdns.com/ "DNS server software."
[poweredge-r620]: https://www.dell.com/support/home/en-us/product-support/product/poweredge-r620/overview "A rack server."
[powerswitch-s4810p]: https://www.dell.com/support/home/en-us/product-support/product/force10-s4810/docs "A network switch."
[procurve-2848]: https://support.hpe.com/hpesc/public/docDisplay?docId=emr_na-c01814383 "A network switch."
[python]: https://www.python.org/ "An interpreted scripting language."
[restic]: https://restic.net/ "Backup software."
[ripgrep]: https://github.com/BurntSushi/ripgrep "A tool for searching directories via regular expressions."
[rust]: https://www.rust-lang.org/ "A programming language."
[safari]: https://www.apple.com/safari/ "A fast web browser."
[shellcheck]: https://www.shellcheck.net/ "Shell script linting software."
[stylus.2]: https://github.com/openstyles/stylus "A userscript manager for Firefox."
[switch.2]: https://www.nintendo.com/switch/ "A gaming console."
[syncthing]: https://syncthing.net/ "Self-hosted file syncing software."
[tailscale]: https://tailscale.com/ "A VPN service."
[talon]: https://talonvoice.com/ "Voice-control input software."
[thelio]: https://system76.com/desktops "A desktop PC."
[thinkpad-x220]: http://web.archive.org/web/20170206231919/http://shop.lenovo.com/us/laptops/thinkpad/x-series/x220 "A 12.5 inch PC laptop."
[thinkpad-x270]: https://en.wikipedia.org/wiki/ThinkPad_X_series#X270 "A 12.5 inch PC laptop."
[time-machine]: https://en.wikipedia.org/wiki/Time_Machine_(Mac_OS) "Backup software for the masses, included with Mac OS X 10.5."
[tmux]: https://sourceforge.net/projects/tmux.mirror/ "A terminal multiplexer, similar to screen."
[ublock-origin]: https://en.wikipedia.org/wiki/UBlock_Origin "A browser extension for blocking elements on the web."
[vvvvvv]: https://thelettervsixtim.es/ "An indie platformer."
[weechat]: https://weechat.org/ "A multi-protocol chat program."
[x10sdv-4c-7tp4f]: https://www.supermicro.com/en/products/motherboard/X10SDV-4C-7TP4F "A motherboard."
[xfce]: https://www.xfce.org/ "A lightweight UNIX-like desktop environment."
[z27n-g2]: https://support.hp.com/us-en/document/c05822916 "A 27 inch monitor."
