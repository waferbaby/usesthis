---
title: Rose Peck
summary: Software developer
date: 2026-01-30
version: 2
categories:
- developer
- mac
- windows
---

### Who are you, and what do you do?

I'm Rose Peck! I go by sixfold in most places.

- Pronouns are she/her or they/them. Choose your own adventure!
- I have a [website](https://sixfold-origami.com/about "Rose's website.") where I write about stuff sometimes.
- I work for the [Foresight Spatial Labs](https://www.fslabs.ca/ "A software company in Canada."), where I'm a *Team Lead*. This title was much more prestigious back when there were people on my team other than me. We had our budget cut a few months ago, so I've been running solo for a little bit.
- I mostly write code all day (over 90% of my time is spent doing code related tasks), but I also do some management-adjacent tasks:
    - Talking with clients, and making sure their needs are heard.
	- Scoping and estimating work.
	- Helping teammates with issues.
- The main piece of software I work on is a digital-twinning, mining CAD application written in [Rust][]. That's a lot of jargon!
	- Digital-twinning: The general idea of making a digital version of some real world space. For example, making a digital representation of all the rock in a pit mine, then using the digital representation to answer questions about the pit and inform planning.
	- Mining: Like, digging metal out of the earth. For real.
	- CAD: Computer-aided design. Broad term for software that engineers use to make... designs. This often means the designs of things like mechanical parts and bridges, but it also applies to things like mining.
	- Rust: The programming language.
- Said piece of software is primarily concerned with the digital twinning aspect. I can't go into too much detail, but the main thing it does is track all of the material in a pit mine over time. What the material is, what it's made of, where it started, when it got dug, etc. This is a harder thing to do than you might expect! (I can go into more detail about this if desired.)
- There is a second piece of software that I also work on sometimes. This is a more traditional CAD appliation written in [JavaScript][]. It handles movement simulation for blast mining, among other things. (I can also go into more detail about this if desired.)
- Foresight also has a sizable R&D division. Those people work on streaming spatial storage systems, rendering tech for large scale models, CSG spatial math, and application frameworks for making CAD software. The stuff that I make is built on all of that tech.

### What do you use to get the job done?

#### Space Heaters

I have two computers. The first is a Windows desktop that I've been regularly upgrading for over 10 years now. By this point in its lifespan, it has completed the full [Ship of Theseus](https://en.wikipedia.org/wiki/Ship_of_Theseus "The Wikipedia entry for The Ship of Theseus."). Not a single original part remains!

Relevant specs:

- CPU: [AMD Ryzen 9 5950X][ryzen-9-5950x] (16 cores, hyperthreaded)
- Motherboard: [ASUS TUF Gaming X570-Plus][tuf-gaming-x570-plus-wi-fi]
- RAM: 48GB DDR4
- GPU: [NVIDIA GeForce RTX 3080][geforce-rtx-3080] (LHR)
- Storage: Two Samsung NVME drives hooked up in a RAID 0 array. 3.6 TB of total space. (I forget the exact model)
- OS: [Windows 10 Pro][windows-10-pro] (Yes I know it's past the end of service. I've been... putting off upgrading.)

The software I write is only released (officially) for Windows, so a Windows environment is basically a must for testing.

The other benefit of the Windows box is that it has an NVIDIA GPU, which is required to run [CUDA][]. Some of the physics engines that the R&D teams cook up run on CUDA, so having a CUDA enabled device is important for that (although we're currently moving away from CUDA for a few reasons.)

It's also been my personal machine for its entire life. I work from home, and my company is cool with me using my personal machine for work when needed. (I don't mind it either.)

The second computer is a [MacBook Pro][macbook-pro], provided to me by my company. It's an M4 Max, with 14 cores and 36GB of unified RAM. The main benefit of the MacBook is that the Apple Silicon CPUs are *crazy*. I mostly write Rust, so compile times for Rust code are important for my job. The M4 chip compiles faster than anything else I've owned or used. It's *nuts*.

#### Peripherals

- Mouse: [Logitech MX Master 3][mx-master-3]. It's comfortable in the hand, and it's pretty configurable. It's popular for a reason.
- Keyboard: [Keychron V4][v4-qmk] with [Gateron G Pro 3.0][gateron-g-pro] (blue) switches.
    - The keyboard is *awesome*. Super comfortable to type on, and the QMK firmware makes it very customizable. I currently have caps lock configured to be a layer toggle key, so holding changes what the other buttons do. I have other stuff (like the function keys, and the tilde) mapped on that layer to account for the fact that the keyboard doesn't have physical buttons for all of those.
	- The switches *suck*. Do not buy these. They're very clicky and comfortable, but they have some serious reliability issues. I keep getting double presses with them, and I've already had to replace a lot after only a year or so. Maybe Gateron just had a bad run and they're fixed now, but that was my experience.
- Keyboard... 2?: [Keychron Q0 Max][q0-max-qmk] with the same switches. Having a separate numpad is nice because I can south paw it. (i.e. use it lefty.) Would recommend! The metal case has a satisfying weight to it.
- KVM Switch: [StarTech SV231DHU34K6][sv231dhu34k6]. I have two computers, so having a KVM switch to quickly switch back and forth is very nice. I like this KVM switch! My only complaint is that it has a tendency to wake up the Windows machine from sleep, but this is fixable by just swapping it to the Mac whenever the Windows box is sleeping.
- Monitors: [Acer VG240Y][vg240y-m3biip]. I have two of these. These were relatively inexpensive and they have very low latency. (True latency, not just response time.) However, I would not recommend them because they have significant color accuracy issues. The left side of the monitor shifts slightly purple, and the right side shifts slightly green.
- Headphones: [Sony WH-1000XM5][wh-1000xm5]. They're pretty good! I used to have the [WH-1000XM3][wh-1000xm3], which served me valiantly for nearly 8 years before dying on me. The M5's multi-device support is very convenient for swapping the audio between my computers, but they're slightly less comfortable. So it kinda comes out in the wash.

I have other peripherals (docks, a tablet that I only use for playing osu, etc.), and some other weird hardware (a professional-grade CRT, a mixing board, etc.) but they're not really relevant to my work so I ommitted them.

#### The 'ol twig and leaves

I like paper and pens, and I often use them for quick note-taking for work. Or, more frequently, for doodling to prevent early onset insanity from interminable work meetings.

My current workhorse notebook is the Midori MD Notebook (A5 Gridded). I also have a leather case for it that I got off Etsy some years ago. I also use the Midori Brass Clips to mark certain pages.

For writing, I rotate between a handful of pens and pencils. Here's some of my current loves:

- [Uni-ball ONE P][one-p], with a Pentel LRN5-V refill: The ONE P is much more comfortable in my hand than I thought it would be, and it can fit a wide variety of refills. The Pentel LRN5 and ZRN5 are both *excellent*, with a super smooth write and clear lines.
- [Mark One by Studio Neat][mark-one], with the recommended Schmidt P8126 refill: The click action on this pen is very satisfying, and the metal barrel is very classy and well made overall. The Schmidt refill also writes very smoothly.
- The [Rotring 800][800]: This was one of the first "nice" writing implements I bought and it stood the test of time. Practical and precise, and the twist click mechanism is fun to fidget with.
- The [Tombow MONO Graph Shaker][mono-graph]: There are a surprising amount of gimmick mechanical pencils, and this is one of them. This one's gimmick is that you can feed the led by shaking the pencil (in addition to a normal click). I ended up liking this motion a surprising amount, so it's stayed in my rotation for longer than I initially expected.

A lot of the software I use is the same across both computers, but some of it is distinct.

- [VS Code][visual-studio-code]: Code editor of choice. It's pretty good! Apparently it's marketing itself as "the open source AI code editor", which is definitely not what it was when I started using it. Each release they add new [GitHub][] Copilot features, and each release I turn them off. Notably, I don't use any LLM stuff to help me code. Not for moral reasons (although I do have moral issues with these things), but simply because they just don't work that well. It's kinda like a slot machine. Every once in a while, the LLM hits all 7's and generates the code right on the first try. But most of the time you're just hitting failed spins.
- [GitKraken][]: I've been using this as my [git][] client for nearly as long as I've been programming. It's pretty good, and it's cross platform. I wouldn't necessarily recommend it for someone just learning git (it's pretty complex), but once you've got a handle on things, it works very well.
- [Watson][]: Watson is a CLI time tracker. I like it better than the other options I've tried, but its aggregation features could definitely use some love.
- [Quire][]: Quire is the task manager I use for anything that needs to survive longer than a day. (Short TODOs often end up in the physical notebook.) Quire's killer feature is that it allows for arbitrary nesting of subtasks. If you want your task manager to be a big tree, then Quire is best in class. Unfortunately, I can't give it as glowing a recommendation as I used to. Over the past few years, it's been steadily getting slightly worse in small ways. Such is the lifecycle of most software, unfortunately.

For digital notetaking, I also use VS Code. I take my notes in Markdown and sync them using a GitHub repository and a few custom scripts. I would not recommend this for anyone who isn't a programmer.

- [qsv][]: Working in industry, I deal with a lot of CSV files. Some of these CSV files are multiple gigabytes in size. Many programs can't handle CSVs that big! But qsv can. It has a terminal version (for free) and a GUI version (for a fee). I use the terminal version and it's *great*.

There's other software I use ([Discord][], [Slack][], [Teams][], [Spotify][], [Gmail][], [Firefox][], etc.), but most of these are so common that I don't really have anything interesting to say.

Other than that Teams sucks.

#### Windows-specific

- [Windows Terminal][windows-terminal] and [PowerShell][windows-powershell] (pwsh): These are my terminal and shell of choice on Windows. Windows Terminal is pretty good. pwsh is decent, but not as good as [zsh][]. There are a lot of articles online about terminals and shells and all the bells and whistles that people have made for them. My setup doesn't really break the mold much, so I'll just gesture vaguely at the resources that smarter people have already written :)
- [f.lux][]: Flux has been around for over a decade and no one has beaten it yet. It's a blue light filter that uses your location to know when the sun is setting, and sets the blue light schedule based on that. It's wonderful.
- [AutoHotKey][]: AHK lets you define custom keyboard shortcuts and scripts. For any problem that involves automating something on Windows, AHK is probably the solution. It's robust and very powerful in the right hands. I use it to do weird mapping stuff for arrow keys, and occasionally to fix the keyboard control schemes in games that I play.

#### macOS-specific

- [kitty][] and zsh. Terminal and shell of choice on macOS. Again, other people have written entire tomes about this stuff, so I'll just say that I like these and move on.
- [Karabiner Elements][karabiner-elements]: This is essentially a macOS version of AutoHotKey. Is it as good? No! Not even close. But it works! In addition to the aforementioned Weird Arrow Key Stuff, I also use it to remap various OS level shortcuts on macOS to be more like Windows. I tried learning the muscle memory for the "Mac way" of doing things, but then I would just trip up when switching back to the Windows machine. After a few months of frustration, I've just come to the conclusion that, if you're using both operating systems regularly, you should just standardize on one style of keyboard shortcuts.
- [AltTab][]: Staying on theme, this is an alternate alt-tab solution that works more like Windows. I think the main reason I like it is that I'm used to it working this way.

### What would be your dream setup?

Honestly, I like my setup a lot at this point. I've put a lot of thought into it (good lord that's over 2000 words T_T), and I'm always looking for ways to improve it. I think my ideal setup would be pretty similar to what I have now, but with a dozen or so small annoyances ironed out:

- Watson could use some better aggregation features
- I wish f.lux had a release for Apple Silicon Macs.
- I wish Windows could use bash and zsh without having to resort to git bash or WSL
- There are a few things in the macOS window manager that are annoying to use (maximizing windows and moving them between monitors is awkward, for example)

And so on, and so on...

[800]: https://www.rotring.com/pens-pencils/mechanical-pencils/rotring-800/SAP_1904447.html "A mechanical pencil."
[alttab]: https://alt-tab-macos.netlify.app/ "Software to mimick the Windows alt-tab functionality in macOS."
[autohotkey]: http://web.archive.org/web/20221226174824/https://www.autohotkey.com/ "A hotkey and keystroke program for Windows."
[cuda]: https://en.wikipedia.org/wiki/CUDA "A programming platform for GPUs."
[discord]: https://discord.com/ "A voice and text chat service."
[f.lux]: https://justgetflux.com/ "A tool to make the colour of your screen adapt to the current time of day."
[firefox]: https://www.mozilla.org/en-US/firefox/new/ "A cross-platform open-source web browser."
[gateron-g-pro]: https://www.keychron.com/products/gateron-g-pro-3-0-switch "Keyboard switches."
[geforce-rtx-3080]: https://www.nvidia.com/en-us/geforce/graphics-cards/30-series/rtx-3080-3080ti/ "A graphics card."
[git]: https://git-scm.com/ "A version control system."
[github]: https://github.com/ "A Git code repository service."
[gitkraken]: https://www.gitkraken.com/ "A Git client."
[gmail]: https://en.wikipedia.org/wiki/Gmail "Web-based email."
[javascript]: https://en.wikipedia.org/wiki/JavaScript "An interpreted scripting language."
[karabiner-elements]: https://karabiner-elements.pqrs.org/ "Mac software for remapping the keys of your laptop."
[kitty]: https://sw.kovidgoyal.net/kitty/ "A GPU-based terminal emulator."
[macbook-pro]: https://www.apple.com/macbook-pro/ "A laptop."
[mark-one]: https://www.studioneat.com/products/markone "A pen."
[mono-graph]: https://www.tombow.com/en/products/mono_graph/ "A mechanical pencil."
[mx-master-3]: http://web.archive.org/web/20200818170656/https://www.logitech.com/en-us/product/mx-master-3.910-005620.html "A wireless mouse."
[one-p]: https://www.unibrands.co/products/uniball-one-p-gel-pen-5mm-black-ink-yogurt-and-la-france-2-count "A gel pen."
[q0-max-qmk]: https://www.keychron.com/products/keychron-q0-max-qmk-custom-number-pad "A number pad with mechanical keyboard keys."
[qsv]: https://github.com/dathere/qsv "Command-line software for working with CSV files."
[quire]: https://quire.io/ "A task management service."
[rust]: https://www.rust-lang.org/ "A programming language."
[ryzen-9-5950x]: https://www.amd.com/en/products/cpu/amd-ryzen-9-5950x "A CPU."
[slack]: https://slack.com/intl/ja-jp/ "A collaboration service."
[spotify]: https://open.spotify.com/__noul__?pfhp=2c2ccb58-8a92-4713-a1c0-8b43b3090b49 "A music streaming service."
[sv231dhu34k6]: https://www.startech.com/en-us/kvm-switches-accessories/sv231dhu34k6 "A KVM switch."
[teams]: https://www.microsoft.com/en-us/microsoft-teams/group-chat-software "A team collaboration service."
[tuf-gaming-x570-plus-wi-fi]: https://www.asus.com/us/motherboards-components/motherboards/tuf-gaming/tuf-gaming-x570-plus-wi-fi/ "A motherboard."
[v4-qmk]: https://www.keychron.com/products/keychron-v4-qmk-custom-mechanical-keyboard "A mechanical keyboard."
[vg240y-m3biip]: https://store.acer.com/en-us/23-8-nitro-vg0-gaming-monitor-vg240y-m3biip "A 23.8 inch gaming monitor."
[visual-studio-code]: https://code.visualstudio.com/ "A development IDE."
[watson]: https://jazzband.github.io/Watson/ "Time tracking software."
[wh-1000xm3]: https://electronics.sony.com/audio/headphones/headband/p/wh1000xm3-b "Wireless over-the-ear headphones."
[wh-1000xm5]: https://www.sony.com/electronics/headband-headphones/wh-1000xm5 "On-ear headphones."
[windows-10-pro]: https://www.microsoft.com/en-us/windowsforbusiness/windows-10-pro "A PC operating system."
[windows-powershell]: https://en.wikipedia.org/wiki/Windows_PowerShell "A shell and scripting language for Windows."
[windows-terminal]: https://apps.microsoft.com/detail/9n0dx20hk701 "A terminal application."
[zsh]: https://www.zsh.org/ "An interactive shell and scripting language."
