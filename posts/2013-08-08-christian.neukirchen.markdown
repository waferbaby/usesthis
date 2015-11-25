---
title: Christian Neukirchen
summary: Software developer (Rack, bacon)
categories:
- bsd
- developer
- linux
- software
---

#### Who are you, and what do you do?

My name is [Christian Neukirchen](http://chneukirchen.org/ "Christian's website.") and after finishing my Bachelor's in Mathematics, I am currently pursuing a Master's degree in Computer Science. In the past, I have written popular Ruby libraries such as the abstract webserver interface [Rack][] and the Behavior Driven Development framework [bacon][].

I'm also known for creating the first tumblelog [Anarchaia](http://anarchaia.org/ "Christian's tumblelog.").

Currently -- apart from my studies -- I'm publishing the weekly linkblog [Trivium](http://chneukirchen.org/trivium/ "Christian's linkblog.") and occasionally churning out [smaller programs](https://github.com/chneukirchen/ "Christian's GitHub account.") to do whatever needs to be done.

#### What hardware do you use?

My computer usage is split threefold, in roughly equal parts between my notebook, my desktop and my phone.

I use a [Lenovo X220i][thinkpad-x220i] called [`juno`](http://vuxu.org/vuxi/juno "Christian's wiki entry for his laptop."). It has 8 GB RAM, a 80 GB SSD and a 320 GB hard disk. It's the best notebook I've ever owned. In particular, I love the keyboard (both the feel and the layout), the fact that it has three real mouse buttons (I use [X11][xfree86] heavily), and the dual-disk setup. I just wish I had shelled out the money for an IPS display, but I can stand it fine most of the time. The Core i3 inside seems to stay cooler than the Core i5 some of my friends have.

At home, I mostly use a self-built PC named [`hecate`](http://vuxu.org/vuxi/hecate "Christian's wiki entry for his desktop machine."). It contains a Core i5-2400, 16 GB RAM and two SSDs (64 GB + 250 GB added later) as well as a 2x3TB RAID1. Since I sleep next to it, it runs really silently unless the RAID is spinning. It's also supposed to be energy-efficient.

`hecate` runs a triple screen setup consisting of a cheap 1920x1080 TFT panel to my left, where I watch movies or look at a few webcams, as well as two old 1600x1200 screens ([Lenovo L201p][thinkvision-l201p], [Samsung 214T][214t]) in front of me, on which I work. I have tweaked the configuration such that the movie panel runs its own X11 display, thus popups and dialog boxes never appear there accidentally. (I use a similar technique when giving presentations.)

For typing, I use a [FILCO Majestouch NINJA Tenkeyless][majestouch-ninja-tenkeyless] with brown MX switches, but sometimes I grab one of the [IBM Model M][model-m] sitting on the cupboard and type on them. I have a very [modest collection of old keyboards](http://vuxu.org/vuxi/keyboards "Christian's wiki entry for his keyboards.").

I use an [IBM ScrollPoint mouse][scrollpoint] for pointing. It has three physical buttons, as well as a "nipple" for scrolling in two dimensions. I don't mind using a mouse this good.

I often wear [Superlux HD-668 B headphones][hd-668-b] which I pimped with AKG K 240/270/271 Velour Pads for comfort. It's absolutely the best audio quality you can get for such a low price. I also own a [Sony PlayStation Eye][playstation-eye] for video chat.

My phone is a [Desire Z][g2]. It was of the few [Android][] half-recent devices with a physical (slide-out) keyboard which was available in Europe. Out of luck, I got a model from the Netherlands, so I can use a QWERTY layout everywhere. I have made a [special key mapping](http://chneukirchen.org/dotfiles/.us-intl-german.xmodmap "Christian's key mapping file.") for German and other symbols I use on my machines.

I have a [few other](http://vuxu.org/vuxi/boxes "Christian's wiki entry for his computers.") small computers running which provide specific services, such as a Dockstar which serves as a Kerberos KDC and an old EEE-PC which I use for IPv6 tunneling. I run a headless [Raspberry Pi][raspberry-pi] when I want to test code on ARM.

#### And what software?

I am very conservative about software that works for me, yet very open about things that solve problems in novel ways. I hate nothing more than software breaking without good reason. This reflects nicely in my choice of software: I use some very old programs that work really well for me, but I'm also an early adopter of recent programs such as [tmux][], [mosh][], [ncdu][], [mupdf][] and others. I often run [Git][] versions of new tools and sometimes help development. I like the [Z shell][zsh] (which never changes default behavior) and [Emacs][] (where I begrudgingly read the Changelogs and revert most of their new "features")---tools I've been using for years.

I use [Linux][] almost exclusively, but I also dabble with [OpenBSD][] and [FreeBSD][] and occasionally boot into [Plan 9][plan-9]. Most of my machines run [Arch Linux][arch-linux], with moderate modifications: for example, I have switched its `init` system from systemd to my [`runit`][runit]-based [`ignite`][ignite] system. I also build and package many programs myself. Arch Linux is the distribution that annoys me the least, and I've had a look at many.

I spend most of the time in a bare-bones X11 session either running my port of the OpenBSD window manager [cwm]() or [FVWM][]. I don't call it "a desktop". They draw a simple border around windows and that's it. I do the rest with keybindings or mouse combos. I have adapted to a set of keybindings I can setup in almost any environment. I use the classic X11 "fixed" font 6x13 everywhere I need monospaced text, and I can't wait for the display resolution to raise to make my own [sq](http://chneukirchen.org/fonts/ "Christian's fonts.") font viable for terminal usage (on my current displays, it's too big). Usually, I run [Firefox][] and Emacs as well as various IM clients all the time. Almost all other windows are [urxvt][rxvt-unicode] terminals. Terminal windows and Emacs are sized to 80 characters per line by default, and often to as many lines as the screen fits.

For editing, I use both Emacs and [vi][] (mostly [vim][], sometimes [nvi][] or even [ex-vi][]), depending on my needs. Emacs is for almost all development and dealing with mail as well as writing longer texts. I prefer vi for administrative tasks and on remote machines, where I have no configuration of my own. I use [ed][] --the world's best WYSIWYG editor -- for quick editing such as removing old lines from `.ssh/known_hosts`, or when things are really broken. I can barely exit nano.

These days, I write most of my code in [Ruby][], [C][], or as shell scripts (POSIX sh or zsh, depending on where I want it to run), and I'm currently toying around with [Go][], [Ocaml][], and [R][]. I expect to use all three languages more and more in the future.

I generally don't use syntax highlighting because I find it distracting and I believe it harms code readability. When coding, I depend on Emacs smart indentation to find syntax errors.

I write most of my text as plain text, and everything that ends up as HTML using [Markdown][]. Most things longer than a line or two (e.g. blog comments) start off in a file called `~/Notes` which I have open constantly. It is very long. I write math-heavy and stuff-to-be-printed using [LaTeX][], but I've been in search of a good reason to learn [ConTeXt][context.2] for years. I also use LaTeX for making slides. I use [awk][] [instead of spreadsheets](http://c2.com/doc/expense/ "An awk calculator script."). I don't have [LibreOffice][] installed, and don't intent to.

I read my mail using [Gnus][] in Emacs, and juno actually is a self-contained mail host running its own [Postfix][] and [Dovecot][] setup, which syncs with [offlineimap][] against my [Gmail][] account. This nicely enables me to work with mail the Unix way, as well as queue mail when I'm not online. I follow many mailing lists, and try to use [Gmane][] to read them with Gnus over NNTP.

I use the Z shell heavily and it's one of the few programs I also install on remote machines, even if I only occasionally work on them. I also run tmux on almost all machines for remote attachment and having "terminal tabs". I use the shell a lot, and have written [scripts](http://chneukirchen.org/dotfiles/tools.html "Christian's shell tools.") for many tasks I do regularly, such as searching certain websites or looking up things. More than half of my shells are probably connected to different machines, using either SSH or the mobile variant Mosh, which works vastly better given enough network latency.

I use [ssh][], [rsync][], [bsdtar][libarchive] and Git to move data around, and trust few other tools about that. I use Git not only for version control but also for managing my dotfiles and my websites (which are rendered statically using my own tools). I love how easy it is to [add new features](http://chneukirchen.org/blog/archive/2013/01/a-grab-bag-of-git-tricks.html "Christian's post on extending Git.") to Git.

I keep a daily backup of my whole system using a rsync-driving [script][rdumpfs], which has saved my butt more than once. I consider it essential when running a rolling-release distribution.

I configure my software heavily, yet I can work with most default configurations (I won't use Emacs, and I don't need [much](http://chneukirchen.org/dotfiles/.zshrc.minimal "Christian's zsh config.") for zsh). I put my [dotfiles](http://chneukirchen.org/dotfiles/ "Christian's dotfiles.") online and sometimes download them on foreign machines when desired.

I listen to music using [mpd][] (with [ncmpcpp]()), tweet with [Hotot][], chat with [irssi][], [Pidgin][] and [Skype][], download torrents with [Transmission][] (Gtk+ or CLI), I debug with [strace][], [ltrace][], [fatrace][], [printf](http://ewontfix.com/10/ "An article on debugging with printf."), and [gdb][].

On my phone, I mostly use Google Mail, [Mosh Irssi Connectbot][irssi-connectbot-android], [Plume][plume-android], [Aix Weather][aix-weather-android] and [Öffi][oeffi-android]. I use [PinDroid][pindroid-android] to save links on [pinboard.in][pinboard] for later reading on my notebook. I occasionally surf using [w3m][] over SSH because I forget I have a native browser (and sometimes because it's quicker).

#### What would be your dream setup?

My current setup could be improved with the advent of high-resolution displays, either for on-desk usage or combined with power user friendly portable hardware (and by that I mean a matte display, proper keyboard, exchangeable battery and a Gigabit Ethernet port). Also, everybody wants more battery runtime.

My dream home features a symmetric 1Gbps internet connection, and we should be getting there in a few years. Although, I'm actually not sure about the "symmetric" part nor how many hours (minutes?!) I could actually max it out.

I am pretty satisfied with my current setup, yet I'm continuously improving it. One of my distant fears is [not being able to buy a computer in 10 years](http://boingboing.net/2012/08/23/civilwar.html "An article on Boing Boing about the coming war for general purpose computers.") which is affordable and apt for professional use. I hope some vendors will rediscover this as a market; else I'll need to start conserving hardware. I hope to be using some kind of Unix for the rest of my lifetime. And I hope I'm not alone in that.