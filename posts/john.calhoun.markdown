---
title: John Calhoun
summary: Programmer, woodworker
date: 2023-12-24
categories:
- developer
- mac
---

### Who are you, and what do you do?

My name is John Calhoun. I’m retired for the time being but worked as a programmer at Apple for about twenty-six years and wrote a few commercial computer games for the Macintosh before that. [Glider][], a little paper airplane game, is the one you may have heard of if you are old enough. I have always had an interest in drawing and art in general, writing and playing music, dabbling in electronics, woodworking, and of course computers and coding. Surprisingly many of these interests have intersected at various times for various projects. For example, my woodworking and computer hobbies are assisting my current project to make a virtual pinball cabinet. Another example: I also enjoy modeling (like plastic model kits) and so taught myself [Blender][] and figured out 3D resin-printing well enough to have been able to create a simple model of a "space tug" (a 1970's NASA project that never got the green light from Congress, BTW). Writing computer games is also inter-disciplinary because it combines programming, art, music...

Lots of hobbies can take a lot of physical space in the home (and I suppose I have mastered none of them) but I find it impossible to stick to one hobby. There seems to be a kind of seasonal calling for one versus another. As an example, for some reason the woodworking projects and 3D printing appeal to me in the colder months of the year but by the spring I am tired of woodworking and am often drawn back to coding projects for whatever reason — electronic projects in the fall...

I [blog from time to time](https://engineersneedart.com/ "John's website."). [GitHub](https://github.com/EngineersNeedArt "John's GitHub account.") [Insta](https://www.instagram.com/engineersneedart/ "John's Instagram account.").

### What hardware do you use?

I wish with woodworking I could do everything with hand tools. Some years back I got a nice set of planes and chisels — this was fortunate because we moved soon after and for a year I did not have access to my power tools as they were still in storage while we were renting. I found that with just hand tools I could only make very simple things like a stand for holding rolls of tape, ha ha. I waited to do to do the furniture-size projects until we finally got a new house and I got my shop set up again with my table saw, etc.

I envy the people on YouTube that can make actual furniture with hand tools. For me though a lot of my woodworking involves nicer plywood (no hand-planing there!) and so the table-saw (or a really nice track-saw) is my primary woodworking tool. A router is a close second in utility (just recently got a nice soft-start Makita router that takes some of the terror out of the tool — for better or worse).

For electronics I tell people they really need to get a nice soldering station such as a [Hakko][fx-888d] and good, thin, solder. Years ago I started building electronic kits and thought that my soldering skills sucked. At some point I got a Hakko and immediately found out it was just my crappy Radio Shack soldering pen and crappy solder that were making for blobby, cold solder joints.

I also recently picked up a Greenlee stainless steel wire stripper and it has been a beautiful thing to use to strip wires for breadboarding-up circuits, etc.

With the likes of [PCBWay][], inexpensive Chinese electronics, and microcontrollers/single-board-computers like the [Arduino][] and [Raspberry Pi][raspberry-pi], we are truly living in a golden age for the electronics hobbyist. The list of projects I want to do is longer than what I have time for. [Pi-Hole][] anyone? Teensy-based MP3 player? Software-defined radio? [MAME][] cabinet? Visual Pinball cabinet? An all-sky camera?

For 3D printing I really don’t have anything to contribute as I am still rather a novice at it. I definitely prefer the resin to the filament since my interest is modeling and only the resin can get that level of detail. I’m seeing increasingly, BTW, modelers on YouTube assembling and painting 3D printed kits. There have been “garage kits” for a long time but it was a niche and esoteric thing. Now modelers themselves can download .stl files and print kits in their own garage, ha ha. Brave new world.

### And what software?

I refuse to subscribe to software. Corporate rent-seeking has become way, way too prevalent these days. So I seek out fair-priced commercial software or open-source projects whenever I can.

Affinity make an excellent suite of apps with their [Affinity Photo][affinity-photo], [Affinity Designer][affinity-designer] and [Affinity Publisher][affinity-publisher] apps. I bought and use all three. [Pixelmator][] (the original version, not [Pixelmator Pro][pixelmator-pro] although I own that too) is my go-to graphics app for anything pixel-artsy.

These companies have to put food on the table so I understand when every so-many years they release a completely new version and ask that you pay for it again. (Or not if you’re happy with the current app you own and it keeps running despite OS updates.) I definitely prefer that business model. No one is seemingly picking my pocket every month whether I used their app or not.

I already mentioned Blender — that is open source. I use it for 3D modeling the designs I want to print in 3D resin. I know there are CAD tools out there that might be a better fit for the kind of "hard surface" modeling I do (proposed NASA spacecraft from the 1970's) but I have never found a free CAD tool that I have had the time to become comfortable with. (And like the rent-seeking I find abhorrent, I also distrust the free (for now) software that big companies tease.)

The learning curve on Blender though is insane. It’s something I come back to every 9 or 10 months and each time I feel I get a little but more comfortable with it. Definitely watch some YouTube tutorials to see what workflows the pros use. I learn something almost every time I watch another Blender tutorial.

Similarly, [KiCad][] is an excellent open-source CAD program (I guess that is what you call them) that I use for my electronic projects. It too has a bit of a learning curve but there’s something magical about designing your own PCB on a home computer, exporting it as a Gerber file, uploading the file to a certain-company-in-Taiwan and getting back a circuit board that looks like it could have shipped commercially. Again, in many ways we are already living in a fantastic future.

By the way — a kind of software — there is [a fantastic site](https://www.worldradiohistory.com/Popular-Electronics-Guide.htm "An archive of electronic magazines.") that has scans of electronic hobbyist magazines going back around 100 years. I have pulled down a number of older issues of _Popular Electronics_, the _Electronic Experimenter’s Handbook_ and more. When I want to relax I do some mining for some electronics gems there. There are plenty of educational articles throughout that explain electronics for the novice. And of course there are all manner of projects — some classics like Don Lancaster’s TV Typewriter just as an example. There’s a kind of fascinating history of electronics there as well — early issues using vacuum tubes of course, lots of point-to-point wiring. Transistors in cans come along, later SCR’s (I guess a kind of stop-gap component that is no longer used). TTL gives way to CMOS... the microcomputer comes arrives on the scene...

Coding games I of course lean on [Xcode][] since as a former Apple employee I had been using it since version 1. If I do work on other platforms I found Microsoft’s free [Visual Studio][visual-studio] to be fine. I even like [Visual Studio Code][visual-studio-code] — even on my Mac platform (editing for Arduino or in [Python][] for example).

When I want to write a cross-platform game I found I really enjoy the [SDL framework][sdl]. It’s in [C][] and is low-level enough to stay out of your way — but still manages to abstract the graphics context, windows, events. I’ve only ever compiled [macOS][], Windows and Linux versions of games with SDL but I understand there are other platforms you can compile for as well.

I learned just enough [CMake][] to create makefiles that will work cross platform. For the Mac I still rely on the Xcode project to describe how to compile/link, but Visual Studio is C-Make-aware and allows for building my projects on Windows a breeze. (I tried [CLion][] for building for Linux — it too could ingest C-Make files and worked — but once the free 30-day trial ended I decided I couldn't justify paying rent on the software).

### What would be your dream setup?

I _have_ my dream setup for electronics, programming. I wish though I had an entire Quonset-hut like shop for my woodworking so I could get my garage back for other things. For that matter I wish I had an entire studio that I could move all my hobbies into (so I can give a large part of our house back to my wife).

When I see one of those giant warehouse structures on the outskirts of town I wish I could own one. When I see a large, abandoned grain silo I also wish I could buy it, fix it up to make it livable, live in it.

[affinity-designer]: https://en.wikipedia.org/wiki/Affinity_Designer "A vector graphics editor."
[affinity-photo]: https://affinity.serif.com/en-us/photo/ "Photo editing software."
[affinity-publisher]: https://affinity.serif.com/en-us/publisher/ "Page layout and design software."
[arduino]: https://www.arduino.cc/ "Open-source prototyping hardware."
[blender]: https://www.blender.org/ "A free, open-source 3D renderer."
[c]: https://en.wikipedia.org/wiki/C_(programming_language) "A compiled programming language."
[clion]: https://www.jetbrains.com/clion/ "A C/C++ IDE."
[cmake]: https://cmake.org/ "An open-source cross-platform build tool."
[fx-888d]: https://www.hakko.com/english/products/hakko_fx888d.html "A soldering iron."
[glider]: https://en.wikipedia.org/wiki/Glider_(video_game) "A video game about a paper aeroplane."
[kicad]: http://web.archive.org/web/20220324205847/https://kicad-pcb.org/ "Open-source CAD software."
[macos]: https://en.wikipedia.org/wiki/MacOS "An operating system for Mac hardware."
[mame]: https://en.wikipedia.org/wiki/MAME "Arcade emulation software."
[pcbway]: https://www.pcbway.com/ "A PCB prototyping service."
[pi-hole]: https://pi-hole.net/ "Linux-based ad blocking software."
[pixelmator-pro]: http://web.archive.org/web/20230523091827/https://www.pixelmator.com/pro/ "An image editor."
[pixelmator]: http://web.archive.org/web/20230419034642/https://www.pixelmator.com/mac/ "An image editor for the Mac."
[python]: https://www.python.org/ "An interpreted scripting language."
[raspberry-pi]: https://en.wikipedia.org/wiki/Raspberry_Pi "A single-board hackable computer."
[sdl]: http://www.libsdl.org/ "A cross-platform multimedia/gaming library."
[visual-studio-code]: https://code.visualstudio.com/ "A development IDE."
[visual-studio]: http://web.archive.org/web/20180617165945/https://www.visualstudio.com/ "A Windows development environment."
[xcode]: https://en.wikipedia.org/wiki/Xcode "An IDE for Mac developers."
