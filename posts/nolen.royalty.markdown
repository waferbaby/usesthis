---
title: Nolen Royalty
summary: Game and web developer
date: 2025-05-30
categories:
- developer
- game
- linux
- mac
- windows
---

### Who are you, and what do you do?

I'm [Nolen Royalty](https://eieio.games/ "Nolen's website.")! My last name sounds fake but it's not. On the internet I sometimes use the screen name "eieio."

These days I'm a game developer and designer. I like to connect strangers over the internet and embed games in surprising places. My best known projects are probably [One Million Checkboxes](https://onemillioncheckboxes.com/ "A website with one million checkboxes.") (a multiplayer checkbox website that had a fun secret) and [Flappy Dird](https://eieio.games/nonsense/game-11-flappy-bird-finder/ "Nolen's Finder-based Flappy Bird clone.") (a version of Flappy Bird that runs inside MacOS finder). I've been making games since early 2023 - I started with more "normal" games but got pretty weird pretty quickly. I like it that way :)

Before I made weird games I worked at Jane Street Capital, a quantitative trading firm where I wrote code and managed a small team that made internal products. I was there for around 7 years and really enjoyed it! Before that I had some other tech jobs (at a startup, at AWS). And before that I was a camp counselor for a while.

### What hardware do you use?

Not too much! Day to day I program on a 14 inch [M3 MacBook Pro][macbook-pro] without an external monitor. I reallllly like being mobile while I program - I do a lot of work from the couch (I'm on the couch right now), mostly sitting cross legged. And there are a bunch of spaces other than my home that I like to work from - I regularly work from the [Recurse Center hub](https://www.recurse.com/ "A retreat for development in New York."), from the climbing gym, and from coffee shops. I'll talk about this more in my "Software" section, but I think I've got a really nice single-monitor setup and I'm at my happiest (and most productive) when my work lets me do that.

When I'm using my laptop I never have a mouse or external keyboard connected. I *love* the MacBook trackpad (and use some software to make it more powerful) and really like the keyboard too. For a while I had one of the MacBooks with a "bad" keyboard (from the early 2020s I think?) and that was super frustrating. 

Very little of what I do requires much computing power, so for the most part an M3 MBP is more than enough for what I need. But I'm occasionally grateful for the power. Right now I'm parsing 650,000,000 log lines to do some timelapses from One Million Checkboxes; it's certainly nice to have a fast computer for that.

That said, I've also got a Windows desktop that I somewhat regularly work from (although I originally got the desktop to play games, and I still use it for that too). It's got two 1440p monitors and an [RTX 3070TI][geforce-rtx-3070]. It's very rare that I shift to using it for computation power (except for when I want to play games) - but I do rely on it heavily when I'm doing work that realllly needs two monitors or a mouse (I think tasks that require one often require the other). Examples of those tasks are editing videos or working with heavier weight game engines - times where you need to do a ton of clicking.

For my desktop I've used the same [Filco Majestouch Tenkeyless][majestouch-ninja-2] with Cherry Black keys for the last decade. I love it. I think I picked it up because it was popular with [Starcraft][] players back when I was a Starcraft player. For a mouse I use a [Logitech G502 Hero][g502-hero]. It's a nice mouse! But I actually really use it because it was the only mouse available at Jane Street that had forward and back buttons, and I wanted my home setup to match my work setup. I truly can't imagine using a mouse that doesn't have forward and back buttons - noooo idea how people manage to browse the web without one.

It's also worth mentioning that I use plenty of rented hardware to run my sites. That's basically always a Linux server via [DigitalOcean][].

### And what software?

It depends a little on which of my setups I'm using!

Since I've been using a MacBook with no external monitor for over a decade, I've spent a lot of time configuring it. The most important thing is [iTerm2][], configured as a full-screen transparent dropdown terminal that I can pull up with a hotkey (I use ctrl-;). Having a full screen transparent terminal lets me read documentation or look at the website I'm working on *while* in my editor, which is critical.

I swap caps lock with control (doable just with a stock mac), which is also huge. 

For years I used [TotalSpaces][] to give myself a 2D grid of virtual desktops that I can navigate around in using [vim][] hotkeys (this was doable with older versions of macOS, but not anymore). But TotalSpaces isn't super compatible with new Macs so I've finally given up on that. That said, I still have 12 virtual desktops that are mentally (for me) in a grid. I access them by hitting cmd-ctrl-$something, where $something is 1, 2, 3, q, w, e, a, s, d, z, x, c. The idea is that the virtual desktops are in a 3x4 grid that maps to the grid of keys on the left side of my keyboard. I love being able to move between virtual desktops just with my left hand, and have a notion of which windows belong where (my browser is always in workspace 5, cmd-ctrl-w, for example).

I occasionally use [Karabiner][] to remap keys, although over time I've found that this isn't super necessary. I used to map "tapping caps lock" to escape (handy for vim), but that made it hard to use Linux machines since I couldn't figure out how to port the mapping, so I don't do that anymore. I do rebind ctrl-C in vim to be escape (instead of the pseudo-escape that it typically acts as), which is very accessible since I swap caps and ctrl rebound.

Speaking of vim - I'm happiest when I can edit code in vim, and when I'm writing in a language that I'm really comfortable in I use vim with no extensions for autocomplete beyond vim's simple built in textual autocomplete. I have a *heavily* customized vim setup. It'd be hard to go over everything, but one thing that I like is that I can use emacs-style commands when in insert mode to make text editing faster. You can see my dotfiles [on GitHub](https://github.com/nolenroyalty/dotfiles "Nolen's dotfiles on GitHub.").

I use [zsh][] as my shell. I've got some customizations for that too, but not too many. To be honest I switched to zsh before knowing enough about the shell to make a super principled decision on shell use and can't really justify it to you. But I like it and it works well enough.

I use [BetterTouchTool][] to add a tonnnn of functionality to the trackpad. Big ones include gestures for moving between tabs (which work across many applications), closing windows/tabs (cmd-W), and pulling up my terminal. There's a whole lot I can do on my computer with just trackpad gestures. Back when I used TotalSpaces I could also swap between virtual desktops in 2 dimensions using gestures, which was great. I *love* BTT, but I try to not add too many new commands because I already have so many.

I also do some editing in [VSCode][visual-studio-code]. I use it for [JavaScript][] since I don't know JavaScript as well as some other languages, which means I use it a fair amount now. I have GitHub CoPilot set up and mostly like it but I find it overeager - I'm not used to being offered realtime suggestions and they can sometimes be overwhelming. I've tried hard to not customize my VSCode that much; it's nice to use a stock config and not run into weird problems. VSCode is...fine, although I may try to move to vim for more stuff in the future.

And depending on what I'm up to, I make use of LLMs to help me code! I like to treat it more as pair programming than as asking it to do work.

Oh and I use (and love) [Kap][] for screen recording on Mac. I need to make lots of gifs to share my work and it's very good at that :)

My setup on Windows is much more boring. I write code in VSCode and make some use of [Windows Subsystem for Linux][windows-subsystem-for-linux] to get a shell when I need to do [React][] stuff. I use this autohotkey thing to give me better virtual desktop switching. But that's about it? I guess recently I used [Davinci Resolve][davinci-resolve] to edit my first video. 

On Mac I use [Arc][arc.2] for browsing the web; on Windows I use [Chrome][].

### What would be your dream setup?

I think by and large I'm living it! All I wanna do is write code on my MacBook while sitting in a funny position and mostly I've found a way to do that.

I do wish that I could merge the best parts of VSCode with my favorite parts of vim. VSCode has great (and easy to use plugin support), I like the Copilot integration, the UI when I want autocomplete is good, there are all sorts of handy little features, etc. But I love how quick it is to start up vim in my terminal and I'm still faster editing a file using vim-style navigation. I know that VSCode has vim plugins but it doesn't feel the same. And I also (afaik) can't run VScode using my "transparent full-screen dropdown editor triggerable via a hotkey" setup, which I really miss when I try to use it on my laptop.

I guess if I had to start fresh I'd also try to make my setup a little less complex. It's hard for me to use a machine I haven't configured for work, and I sometimes miss the customizations I've made when I'm ssh'd into a remote machine. And as I've aged I've just grown less eager to tweak my setup. I guess that's okay though - per [xkcd 1205](https://xkcd.com/1205/ "An XKCD comic about how much time to spend on tasks that will help you spend less time on tasks.") it's best to get some optimizations in early in life.

But all that said - I love my setup! I think I'm basically always blocked by the speed at which I come up with the right ideas, not the speed at which I type them. So I can't really complain.

[arc.2]: https://arc.net/ "A web browser."
[bettertouchtool]: https://www.boastr.net/ "Mac software to add custom multi-touch gestures."
[chrome]: https://www.google.com/intl/en/chrome/ "A WebKit-based browser, where each tab runs in its own thread."
[davinci-resolve]: https://www.blackmagicdesign.com/products/davinciresolve "Colour correction software."
[digitalocean]: https://www.digitalocean.com/ "An SSD-based web hosting service."
[g502-hero]: http://web.archive.org/web/20190506063330/https://support.logitech.com/en_us/product/g502-proteus-core-tunable-gaming-mouse "A gaming mouse."
[geforce-rtx-3070]: https://www.nvidia.com/en-us/geforce/graphics-cards/30-series/rtx-3070-3070ti/ "A graphics card."
[iterm2]: https://iterm2.com/ "An alternative terminal application for Mac OS X."
[javascript]: https://en.wikipedia.org/wiki/JavaScript "An interpreted scripting language."
[kap]: https://getkap.co/ "A screen capture tool."
[karabiner]: https://karabiner-elements.pqrs.org/ "Mac software for remapping the keys of your laptop."
[macbook-pro]: https://www.apple.com/macbook-pro/ "A laptop."
[majestouch-ninja-2]: https://www.diatec.co.jp/en/det.php?prod_c=763 "A mechanical keyboard."
[react]: http://web.archive.org/web/20230316153459/https://reactjs.org/ "A JavaScript UI framework."
[starcraft]: http://web.archive.org/web/20120625090500/http://starcraft.com:80/ "An immensely popular sci-fi RTS game."
[totalspaces]: https://totalspaces.binaryage.com/ "A tool for extending Mac OS X's Spaces."
[vim]: https://www.vim.org/ "A command-line text editor."
[visual-studio-code]: https://code.visualstudio.com/ "A development IDE."
[windows-subsystem-for-linux]: https://learn.microsoft.com/windows/wsl/about "A Linux environment for Windows."
[zsh]: https://www.zsh.org/ "An interactive shell and scripting language."
