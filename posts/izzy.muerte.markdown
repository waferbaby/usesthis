---
title: Izzy Muerte
summary: Software engineer (C++)
date: 2025-01-27
categories:
- developer
- linux
- mac
- windows
---

### Who are you, and what do you do?

I'm Izzy Muerte. I'm a software engineer, internet shitposter, open source proponent, occasional [C++][c-plusplus] standards contributor, and inconsistent [Twitch][] streamer who focuses on developer experiences with build systems for [C][], C++, and similar languages, while doing "cursed shit" in the process. I live and work in the San Francisco Bay Area, where I've worked for companies such as Apple, Mercedes-Benz, and Roblox, almost entirely on maintaining build systems for whatever project I was on. Currently, I'm working at an employer I don't wish to disclose at this time, where I'm more or less doing the same thing.

In my spare time outside of work (and open source) I'm usually enjoying the outdoors in some capacity, playing (or modding) video games, self-studying whatever rabbit hole of a subject I've recently fallen down until something else grips my attention by the throat and pulls me aside. I also (sometimes) post on my [blog](https://izzys.casa/ "Izzy's website.").

### What hardware do you use?

At present, my main PC is a custom built machine from 2016 that I've not upgraded (save for the GPU after a hardware failure) partially out of spite, and partially out of curiosity to see just how long this machine can last under modern workloads. It has 64GB of RAM, an [Intel i7 6700K][core-i7-6700k], a [GeForce 3060][geforce-rtx-3060], and a few SATA SSDs. I'm also using 3 ViewSonic 27" 144hz monitors from 2016 that work extremely well, and an [RØDE  NT-USB mini microphone][nt-usb-mini]. For what is about 100 USD, it is hands down the best microphone I've ever owned for desktop usage. For peripherals, I'm using a [Keychron Q3][q3] keyboard with [NovelKeys Kailh Box Pinks][box.2], and a [Logitech G502 Lightspeed][g502]. These are both a recent upgrade and change up due to an unfortunate situation where a [Stream Deck Mini][stream-deck-mini] shorted out a USB hub and damaged every device that was attached to it.

For general portable workloads, I have a [Lenovo ThinkPad X1 Carbon][thinkpad-x1-carbon] (6th Generation) that I've throw whatever Linux distro I fancy at the moment onto. This machine is old and intended more for general internet usage rather than software development at this point as it's extremely lightweight and holds a battery charge quite well despite its age. For computing, I turn to a Quartz [Razer Blade 16"][blade] that has a dedicated GPU in it and runs quite well, though it's slower than my desktop for some software workloads.

I also have a medium server rack with some low energy usage Mini PCs that are running both Intel and AMD GPUs, a [Home Assistant Yellow][home-assistant-yellow], as well as a [TrueNAS Mini R][mini-r] with a decent number of hard drives for storage. I'm currently waiting on Uptime Lab's delivery of their [Compute Blades][compute-blade], which I'll be using to act as [Forgejo][] runners for a self hosted instance, as well as for general homelab compute operations.

For non-tech related stuff, I have a single synthesizer at the moment, the [ELTA SOLAR 42f][solar-42f] which I've been enjoying a great deal. It's a neat analogue synthesizer and I've been enjoying dipping my toes back into music after a *very* long hiatus.

### And what software?

For software development (both at home and at work), I use [neovim][] for development. I only recently switched in the last few years as the number of plugins with improved performance over vimscript was growing in size, though I am perpetually exhausted by *some* of the behavior changes that exist in vanilla vim that work much better than those found in neovim (e.g., vim's `:terminal` support is loads better than neovim's `:terminal` support, especially for Windows specific features. Because I move between Linux, [macOS][], and Windows *a lot* I use the one shell as my daily driver that actually works well with all of them: *[Powershell][windows-powershell]*. People who read this might think I'm mad. People who know me personally already know I am. There isn't any one reason for it, but my workflow and command set are equal across all platforms, save for some differences regarding remote operations. As for tools outside of "an editor and shell", I'll use whatever is necessary for me to get the job done. However the usual suspects of [ripgrep][] and co. are found in my toolbox for CLI operations. If anyone is truly curious, they can always check my [dotfiles](https://github.com/bruxisma/dotfiles "Izzy's dotfiles on GitHub.") which are for all machines I use. (I also have the very last parts of my minimal `vimrc` file there. I just don't have the heart to delete a file I've been editing in one way or another for 21 years.

For a web browser, I use [Mozilla's Firefox][firefox]. For RSS I've been without a cross platform solution until I recently discovered that Firefox's removed RSS features were moved to... Thunderbird! Thus, I might start using that. For task tracking in my day to day life, I use [Todoist][], and I highly recommend it to others. Social media has been a bit rough, so I'm just using default apps for Mastodon, Twitter, etc. With the shutdown of Cohost, I've opted to start revamping my personal blog so I can do more short form posts. I don't use a mail client at the moment, as I use [Proton][protonmail] as my primary mail provider since 2017 and I've been quite pleased with it. For larger note taking on specific topics, I currently use [Obsidian][] to store my "digital gardens" even though it's just a bunch of markdown files that I push up to git from time to time and don't ever publish them anywhere. Proton recently purchased [Standard Notes][standard-notes], which might end up available as part of a proton subscription so I might consider moving to that if it becomes available. There's also one program I've been keeping an eye on lately. It's an IRC client named [Halloy][]. I'm not using it as a daily driver (I don't have many spaces to be in regarding IRC anymore, as many communites have sadly moved to [Discord][] or have entirely dissolved), but it has been a wonderful experience on all platforms all while being a self contained executable and having a nice *native* interface, even on Windows.

For managing general services, I am currently in the process migrating from Pulumi to [OpenTofu][] (having previously migrated to [Pulumi][] from [Terraform][]). I have some private custom providers I've written so that I can manage things like my domains, my home network, and even some basic machine specific settings (such as SSH credentials and internal domains), while also using it to manage my online settings where I can (e.g., [GitHub](https://github.com/bruxisma "Izzy's GitHub account."), [Twitch][], [Backblaze][], etc.). To help fight against my ADHD and procrastination, I try to automate as much of the *toil* of my day to day away as possible so that I can focus on the parts I find rewarding, or don't consider toil to begin with.

### What would be your dream setup?

honestly don't know. I'm very close to what it is right now, at least ergonomically. 3 screens, an operating system where I can *drag the effing task bar to any side of the screen I want*, decent performing system, keyboard with clickity clackity switches, a decent weighted mouse, and a spacious desk. Ideally placed in an area with plenty of sunlight and a view of greenery, but not in a way where I'm getting a glare off the screens. I don't really *need* additional compute resources except for reducing toil in my daily life, and that's what I currently use these small processors and machines for anyhow.

[backblaze]: http://web.archive.org/web/20230716083556/https://www.backblaze.com/cloud-backup.html "Online backup."
[blade]: https://www.razer.com/gaming-laptops/razer-blade-16 "A thin gaming PC laptop."
[box.2]: https://novelkeys.com/products/kailh-box-switches "A mechanical keyboard switch"
[c-plusplus]: https://en.wikipedia.org/wiki/C%2B%2B "A compiled programming language."
[c]: https://en.wikipedia.org/wiki/C_(programming_language) "A compiled programming language."
[compute-blade]: https://www.kickstarter.com/projects/uptimelab/compute-blade "A rack-mountable ARM-based computing board."
[core-i7-6700k]: https://corpredirect.intel.com/Redirector/404Redirector.aspx?https://ark.intel.com/products/88195/Intel-Core-i7-6700K-Processor-8M-Cache-up-to-4_20-GHz "A computer processor."
[discord]: https://discord.com/ "A voice and text chat service."
[firefox]: https://www.mozilla.org/en-US/firefox/new/ "A cross-platform open-source web browser."
[forgejo]: https://forgejo.org/ "Self-hosted version control and project software."
[g502]: http://web.archive.org/web/20190506063330/https://support.logitech.com/en_us/product/g502-proteus-core-tunable-gaming-mouse "A gaming mouse."
[geforce-rtx-3060]: https://www.nvidia.com/en-au/geforce/graphics-cards/30-series/rtx-3060-3060ti/ "A graphics card."
[halloy]: https://github.com/squidowl/halloy/ "An open-source IRC client."
[home-assistant-yellow]: https://yellow.home-assistant.io/ "A small computer dedicated to running Home Assistant."
[macos]: https://en.wikipedia.org/wiki/MacOS "An operating system for Mac hardware."
[mini-r]: https://www.truenas.com/truenas-mini/ "A 12-bay rack-mounted NAS device."
[neovim]: https://neovim.io/ "A refactored vim."
[nt-usb-mini]: https://rode.com/en/microphones/usb/nt-usb-mini "A USB microphone."
[obsidian]: https://obsidian.md/ "Note-taking software."
[opentofu]: https://opentofu.org/ "An open-source infrastructure as code tool."
[protonmail]: https://proton.me/mail "A secure email provider."
[pulumi]: https://www.pulumi.com/ "An infrastructure as code tool."
[q3]: https://www.keychron.com/products/keychron-q3-qmk-custom-mechanical-keyboard "A mechanical keyboard."
[ripgrep]: https://github.com/BurntSushi/ripgrep "A tool for searching directories via regular expressions."
[solar-42f]: https://www.eltamusic.com/solar-42f "An experimental drone machine."
[standard-notes]: https://standardnotes.com/ "A cross-platform encrypted note taking application."
[stream-deck-mini]: https://www.elgato.com/ww/en/p/stream-deck-mini "A small programmable keyboard with 6 keys."
[terraform]: https://www.terraform.io/ "A tool for managing computer infrastructure."
[thinkpad-x1-carbon]: http://web.archive.org/web/20201225130617/https://www.lenovo.com/us/en/laptops/thinkpad/thinkpad-x/ThinkPad-X1-Carbon-5th-Generation/p/22TP2TXX15G "A lightweight PC laptop with a 14 inch screen."
[todoist]: https://todoist.com/ "A to-do service."
[twitch]: http://web.archive.org/web/20230525093711/https://www.twitch.tv/ "A video broadcasting service."
[windows-powershell]: https://en.wikipedia.org/wiki/Windows_PowerShell "A shell and scripting language for Windows."
