---
title: Katherine Cox-Buday
summary: Writer, computer scientist 
date: 2020-03-03
categories:
- bsd
- developer
- linux
- writer
---

### Who are you, and what do you do?

Hi there, internet! I'm [Katherine Cox-Buday](https://katherine.cox-buday.com/ "Katherine's website."), and I'm a writer, computer scientist, and mother. I'm currently working at [DigitalOcean][] on software that helps us manage our fleet of servers. I'm also author of "[Concurrency in Go](https://katherine.cox-buday.com/concurrency-in-go/ "Katherine's book on Go concurrency.")", and a few unpublished novels. When I can find time, I contribute to a smattering of open-source projects which generally follow my interests/needs.

### What hardware do you use?

Let's take a walk down my stack, yes? As someone who holds computers near to her heart, my setup is at once sprawling, and boring. Let's start with personal tech and work out from there.

I used to wear a [Pebble Time][pebble-time] watch which I loved dearly. But Pebble was purchased by Fitbit, and then my Pebble Time's battery died, and I found myself in the market for a new watch. I do what I can to maintain control of my own personal data, and so setting up a pipeline directly from my body to a tech company wasn't very appealing to me. Also, I was accustomed to multi-day battery life in watches, and the number of watches on the market which have this is small. Eventually, I landed on an Amazfit [Bip][bip.2] paired with [Gadgetbridge][]. I charge it every month or so, and Gadgetbridge ensures my data stays local. This has worked pretty well for me.

I'm currently using a first generation Google [Pixel][]. I have mixed feelings about smartphones. I love having a tiny computer in my pocket with a pretty fast connection to the internet, but I am not convinced that they have provided a net positive effect on humanity. I hear encouraging stories about what smartphones have enabled in developing countries (i.e. commerce, community, education, etc.), but I also see [stories](https://www.wired.com/2016/01/facebook-zuckerberg-internet-org/ "A Wired article about Facebook's goal of connecting the whole world.") about tech companies positioning themselves as the gatekeepers to the wider internet. The two dominant operating systems for phones have impenetrable privacy models, and it is often difficult to tell what apps are accessing and sharing, and with whom. Never in human history have we created such a pervasive and capable engine for monitoring what humans are doing. Most phones are not made in such a way that they can be repaired: their support is artificially ended before the hardware has reached the end of its usefulness, and their batteries are not replaceable. And some phones are seen as status symbols. These things have helped drive a pump which is producing tremendous amounts of [electronic waste](https://en.wikipedia.org/wiki/Electronic_waste "The Wikipedia entry on electronic waste."). In addition, phones can help drive addictive behavior, and an entire industry has popped into existence to help companies produce software which engages their users more frequently, and for longer periods of time. We are only beginning to see the effects their usage are having on young brains.

For my next phone, I'm looking at purchasing either a [Librem 5][librem-5], or a [PinePhone](https://www.pine64.org/pinephone/). Both are Linux based phones which I hope will help me address all of the downsides I outlined. I view the dearth of software for these devices as a feature which will help me to use them less. My hope is that after purchasing one of these, I won't have to purchase another for a long time.

For my work laptop, I always take whatever the Linux offering is. In the past that has been a Dell [XPS 13][xps-13], and currently I'm using a [ThinkPad T480s][thinkpad-t480s]. The most important thing to me in a work machine is performance and Linux compatibility. I.e., I want to spend as little time possible preparing or waiting to work. It's nice when the laptop is a good form-factor, but most of the time it's docked, so that isn't too much of a concern.

My personal laptop is a System76 [9th generation Gazelle Pro][gazelle] from 2014. I tend to hang onto hardware for a long time both out of environmental concerns, and because nothing I do generally requires a refresh. But even by my standards, this thing is getting long in the tooth. I've dropped it a few times, and the monitor's hinges are broken on one side, and sharp.

For the little time I have to play games, I have [Windows 10][windows-10] installed on an old System76 Leopard Extreme (leox3 if that means anything to you). It sits in my homelab and runs headless so I can stream games to other machines in the house via [Steam][] [Remote Play](https://store.steampowered.com/streaming/ "Details on streaming games from Steam."). This used to be my main computer, but I wanted a gaming machine, and since my laptop was adequate for my productivity needs, I frankensteined this into something that could run most of the games I'm interested in. The hardware isn't great anymore, but I don't find myself playing many new games, so it works just fine. I've replaced the CPU's liquid cooling pump once.

For my home's infrastructure, I ran Cat 5e throughout the house which terminates into a Ubuiquiti [Unifi 24][unifi-switch] port switch. My edge-router is a PC Engines [apu2][] running [OpenBSD][]. Being the thing that sits between my personal tech and the internet, I wanted something I was reasonably confident in being as secure as possible, and OpenBSD has that reputation. I use [Ansible][] to manage this so I can bring a new one up from scratch quickly. I have a [UniFi HD](https://unifi-hd.ui.com/) running [OpenWRT][] for the things which move around the house. And I have a [Synology DS1819+][diskstation-ds1819-plus] NAS for running some light workloads and providing on-site storage. This setup is continually evolving (hopefully towards simplicity) as I can find time to work on it.

For headspace-work, I have a buckwheat shell filled meditation cushion, and the timer on my watch.

### And what software?

It wouldn't make sense to start out with anything other than [Emacs][]. I don't think there has been a piece of software which has had a larger impact on my life. I began using this about fifteen years ago, and it has followed me across operating systems, jobs, roles (I used it to manage my teams), languages, and needs. Every time I start something new, Emacs has been there to make it just a little easier, and the more I do in it, the easier everything gets. I believe this power comes from Emacs being the closest thing we have to a working [Lisp Machine](https://en.wikipedia.org/wiki/Lisp_machine "The Wikipedia entry for Lisp machines."). If you know a little emacs-lisp, you can begin down the path of creating your own perfect tool which will grow with you, for life.

Sitting on top of Emacs is [Org mode][org-mode]. It is the thing which made irrelevant my search for the perfect task management software. Like Emacs, you can mold it into whatever workflow works best for you at the time. Later, I discovered it is also a wonderful *publishing* platform (this document was created with Org Mode). I have used it to author countless [technical specifications](https://katherine.cox-buday.com/blog/2015/03/14/writing-specs-with-org-mode/ "Katherine's post about writing tech specs with Org mode."), my [blog](https://katherine.cox-buday.com/blog/2015/01/02/migrating-to-a-statically-generated-blog/ "Katherine's post on switching to a static weblog."), and all of my books. In "Concurrency in Go", it allowed me to execute the code snippets embedded in the book &#x2013; a form of [literate programming](https://en.wikipedia.org/wiki/Literate_programming "The Wikipedia entry on literate programming."). This ensured that the code people are reading, the output from that code, and the code exported into the book's [repository](https://github.com/kat-co/concurrency-in-go-src "Katherine's GitHub repo for her Go book.") all have the same provenance.

As for Operating Systems, with the exception of my gaming machine and edge router, everything runs Linux. I cannot foresee myself entrusting my external brain to anything not open source, and currently, Linux is the thing I'm most familiar with. I've pretty consistently used [Ubuntu][] since 2005 (after much distro-hopping). It's certainly not perfect, but it usually "just works", and I don't have to fuss with it too much.

A couple of years ago, I added [Guix][] to the mix. It's both a Linux distribution, and a package manager; I use it as the latter on all my machines. Guix is [awesome](https://guix.gnu.org/manual/en/html_node/Features.html#Features "A list of Guix's features.") for more reasons than I can enumerate here, but here's the short-list: it provides transactional upgrades (i.e. if something goes wrong, roll back to the previous state of your system); it allows for multiple versions of packages to be installed simultaneously; it can [produce container images](https://guix.gnu.org/manual/en/html_node/Invoking-guix-pack.html#Invoking-guix-pack "Details on Guix's ability to build a container image.") or [development environments](https://guix.gnu.org/manual/en/html_node/Invoking-guix-environment.html#Invoking-guix-environment "Details on Guix's ability to build different dev environments.") from package definitions, or even a list of packages; all of it is laid out declaratively in [Guile][], a lisp; and it also places a lot of emphasis on [reproducible builds](https://reproducible-builds.org/ "A site detailing development practises for creating reproducible software builds."). When you use it as an operating system, all of these benefits apply to the entire system. All in all, Guix, or something like it, feels like what the future of our current style of operating systems will look like.

I write software in various languages, but my two favorites are [Go][] and [Common Lisp][common-lisp]. Go for what is not possible, Common Lisp for what is. Most of my personal projects are in Common Lisp because it allows one person to go farther, faster, and back-fill those things with safety checks like typing.

It's for this reason I use [StumpWM][] as my window manager (although I used [i3][] for a *long* time). Because it's written in Common Lisp, I can modify it pretty extensively.

I use [Firefox][] as my browser (although I keep experimenting with [Next][] to see if it's ready for me). I like to support browsers other than [Chrome][] both because increasingly it seems like Google doesn't have my best-interests in mind, and because I don't want to end up where we were in the 90s with one company controlling the web. I try to remain cognizant that Mozilla is also a for-profit company and also may not always have my best interests in mind.

For communication, I have consolidated to [Matrix][] and [Signal][]. I prefer Matrix, but it's a newer project, and Signal provides an experience more like SMS for the people in my life for whom technology is not an emphasis. Matrix is nice because it's a decentralized protocol which aims to have bridges into other messaging ecosystems. This means that I can use a client that best suits me, control where my data lives, and still engage with people who aren't using Matrix.

### What would be your dream setup?

I believe in the philosophy of supporting protocols, not apps. Protocols allow us to create clients that work for the users, and create servers we can run ourselves. I also believe in Steve Job's philosophy that a computer should be a [bicycle for the mind](https://www.brainpickings.org/2011/12/21/steve-jobs-bicycle-for-the-mind-1990/ "A Brain Pickings post about Steve Jobs and his bicycle for the mind quote.") &#x2013; that it should help us to think. Today, computers have become appliances for most people: we don't understand how they work, but we expect them to. This part is great, and we should continue pushing into this space. Unfortunately, it seems as though not many people take advantage of their computers as bicycles.

My dream setup would be a computing appliance &#x2013; one which, like TVs &#x2013; most have in their home. This appliance would plug directly into the internet and then provide seamless services to the people that lived there: email, messaging, storage, a VPN, a desktop environment, etc. It could be expanded by purchasing additional units which would use something like [PCIe](https://en.wikipedia.org/wiki/PCI_Express "The Wikipedia entry for PCI Express.") and [Plan 9][plan-9] to expand its resources (maybe you have a gamer in the family so you buy one with a good GPU). Adding additional instances of the appliance would somehow provide fault tolerance in case one of the other instances went down.

People would interface with this appliance with peripherals (e.g. a watch) suitable to what they needed to do. They would not need to own what we colloquially consider a "computer", nor a screen. Instead they would use augmented reality glasses that displayed windows from a remote session running on the appliance ([John Gage's](https://en.wikipedia.org/wiki/John_Gage "John Gage's Wikipedia page.") "the network is the computer" idiom). Let's throw some haptic gloves in there as a hand-wavey (literally) way of performing input.

And finally, all of this should have open protocols, and be controllable both through a simple, clear, interface, defined in a programming language which is also exposed. The interface keeps things in the "appliance" zone, and exposing the programming language it is written in nudges people to modify their environments to better suit their needs, as Emacs, spreadsheets, and HTML do. This is the philosophy of users being indistinguishable from programmers. This would allow people to begin using their computers more like bicycles and less like washing machines. Both are useful, but bicycles can take you places!

[ansible]: https://www.ansible.com/ "An IT automation service."
[apu2]: https://www.pcengines.ch/apu2.htm "A networking router."
[bip.2]: http://web.archive.org/web/20201109025003/https://us.amazfit.com/pages/amazfit-bip?variant=336750 "A smartwatch."
[chrome]: https://www.google.com/intl/en/chrome/ "A WebKit-based browser, where each tab runs in its own thread."
[common-lisp]: https://common-lisp.net/ "A programming language."
[digitalocean]: https://www.digitalocean.com/ "An SSD-based web hosting service."
[diskstation-ds1819-plus]: https://www.synology.com/en-us/support/download/DS1819+ "An 8-bay NAS."
[emacs]: http://www.gnu.org/software/emacs/ "An extensible, customizable, free/libre text editor — and more."
[firefox]: https://www.mozilla.org/en-US/firefox/new/ "A cross-platform open-source web browser."
[gadgetbridge]: http://gadgetbridge.org/ "Android software for using smartwatch devices."
[gazelle]: https://system76.com/laptops/gazelle "A Linux laptop."
[go]: https://go.dev/ "A compiled programming language."
[guile]: https://www.gnu.org/software/guile/ "A programming language."
[guix]: https://guix.gnu.org/manual/html_node/Package-Management.html "A package management system."
[i3]: https://i3wm.org/ "An X window manager."
[librem-5]: https://puri.sm/products/librem-5/ "A 5.7 inch Linux smartphone."
[matrix]: https://matrix.org/ "A decentralised group communication tool."
[next]: https://github.com/atlas-engineer/nyxt "A keyboard-focused web browser."
[openbsd]: http://www.openbsd.org/ "An open-source operating system emphasising security and cryptography."
[openwrt]: https://openwrt.org/ "An embedded Linux distribution for wireless routers."
[org-mode]: https://orgmode.org/ "An Emacs mode for notes and to-do items."
[pebble-time]: https://en.wikipedia.org/wiki/Pebble_Time "A smartwatch."
[pixel]: https://store.google.com/product/pixel_phone?hl=ja "A 5 inch Android smartphone."
[plan-9]: https://en.wikipedia.org/wiki/Plan_9_from_Bell_Labs "A distributed operating system."
[signal]: https://en.wikipedia.org/wiki/Signal_%28software%29 "An encrypted messaging service."
[steam]: https://store.steampowered.com/ "A digital game distribution service."
[stumpwm]: https://stumpwm.github.io/ "A window manager for X."
[thinkpad-t480s]: https://www.lenovo.com/us/en/p/22TP2TT480S "A 14 inch PC laptop."
[ubuntu]: https://ubuntu.com/ "A Unix distribution."
[unifi-switch]: https://www.ui.com/ "A networking switch."
[windows-10]: https://en.wikipedia.org/wiki/Windows_10 "An operating system."
[xps-13]: http://web.archive.org/web/20230706193216/https://www.dell.com/en-us/shop/cty/pdp/spd/xps-13-9333 "A 13 inch PC laptop."
