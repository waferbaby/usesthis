---
title: Zach Beane
summary: Developer (Common Lisp, Quicklisp)
date: 2020-06-10
categories:
- developer
- linux
- mac
---

### Who are you, and what do you do?

I'm [Zach Beane](https://xach.com/ "Zach's website."). I work on [Common Lisp][common-lisp] and homestead projects. My most popular project is [Quicklisp][], a library manager for Common Lisp.

### What hardware do you use?

For working with Common Lisp, I use a 2016 13" [MacBook Pro][macbook-pro], sometimes with an external 27" 4K monitor. For building Quicklisp I have a homebuilt Linux server with lots of memory and a fast SSD running virtual machines.

For homestead projects, I use a [John Deere 1070][1070] tractor with some attachments: a Fransgård [V-4000 logging winch][v-4000], a Valby/Normet CH150 wood chipper, a John Deere Model 3 wood splitter, a Land Pride [RTR1872 rotary mower][rtr1872], a Bush Hog FM72 flail mower, and a Tartan/CountyLine rototiller. I make lumber and other sawn wood products with a Thomas 6013 bandsaw mill. I fell trees and buck logs with a Husqvarna [365 chainsaw][365]. Sometimes I use a smaller [435][435-e-series] for lighter jobs or as backup.

### And what software?

I've used the same core software for many years: [GNU Emacs][emacs], a web browser (currently [Safari][]), and [xterm][]. These translate pretty well to any environment, but I've used Mac laptops for 20 years so I run them on Mac.

When writing Common Lisp code I use the [SBCL][] implementation of Common Lisp. It produces fast machine code and has a big community of users and is actively developed. I deploy most of my Lisp code on [Debian][] Linux servers, fronted by [nginx][] proxies and static asset servers.

For Quicklisp hosting and distribution I use AWS [S3][] and [CloudFront][].

I used [Wunderlist][] for a few years for todo list tracking, but Microsoft bought it and turned it into Microsoft [To Do][to-do], so now I use that.

Within Emacs, I use [SLIME][] and [ParEdit][] for writing Lisp. I'd like to try [SLY][] as a replacement to SLIME but haven't been able to commit the time to switching. I take notes with [Org mode][org-mode] but I feel like I'm only scratching the surface of its functionality. I manage checkouts with [Magit][].

I keep various seasonal journals in [Google Docs][google-docs] - tracking my goals and progress for firewood management, orchard management, and maple syrup production.

### What would be your dream setup?

I really like my current setup and I'm blessed with a lot of nice tools and toys. So all this stuff is certainly dream territory, not stuff I truly need. With that said...

Computer hardware wishlist:

* Newer, faster laptop
* Rack of quiet, fast Linux servers

Software wishlist:

* xterm 7x14 font with emojis and better glyph coverage in general and XQuartz that understands multiple displays OR
* [iTerm2][] that exactly replicates xterm (then I could ditch XQuartz/xterm) without constant little missing parts that trip me up
* Multiple profile support in Safari (the one thing I miss from [Chrome][])
* Tight Common Lisp/Mac interaction and integration that compares to the old [MCL][macintosh-common-lisp] capabilities or Symbolics systems; not merely nostalgic emulation but supporting modern, native-style applications that are Lispy all the way down. Maybe it's not possible...

Homestead hardware wishlist:

* Bigger tractor - something in the 50-60HP range like a [4052M][]
* Smaller tractor for cultivation like a [Farmall Cub][farmall-cub] 
* Mini-excavator for digging and ditching
* Newer Husqvarna saw in the 70cc class - something like the [572 XP][572-xp]
* Fancier sawmill with hydraulics and a trailer package, like a Wood-Mizer [LT35][]
* A big barn to store everything under cover

[1070]: http://www.tractordata.com/farm-tractors/000/1/5/154-john-deere-1070.html "A tractor."
[365]: https://www.husqvarna.com/us/chainsaws/365x-torq/ "A chainsaw."
[4052m]: https://www.deere.com/en/tractors/compact-tractors/4-series-compact-tractors/4052m/ "A tractor."
[435-e-series]: https://www.husqvarna.com/us/chainsaws/ "A chainsaw."
[572-xp]: https://www.husqvarna.com/us/chainsaws/572xp/ "A small tractor."
[chrome]: https://www.google.com/intl/en/chrome/ "A WebKit-based browser, where each tab runs in its own thread."
[cloudfront]: https://aws.amazon.com/cloudfront/ "A content delivery service."
[common-lisp]: https://common-lisp.net/ "A programming language."
[debian]: https://www.debian.org/ "A Linux distribution."
[emacs]: http://www.gnu.org/software/emacs/ "A free open-source text editor."
[farmall-cub]: https://en.wikipedia.org/wiki/Farmall_Cub "A small tractor."
[google-docs]: https://en.wikipedia.org/wiki/Google_Docs "A web-based office suite."
[iterm2]: https://iterm2.com/ "An alternative terminal application for Mac OS X."
[lt35]: https://woodmizer.com/us/LT35-Hydraulic-Portable-Sawmill "A portable sawmill."
[macbook-pro]: https://www.apple.com/macbook-pro/ "A laptop."
[macintosh-common-lisp]: https://en.wikipedia.org/wiki/Macintosh_Common_Lisp> "A Lisp implementation for the Mac."
[magit]: https://github.com/magit/magit "A git mode for Emacs."
[nginx]: http://nginx.org/ "A very fast web/mail server."
[org-mode]: https://orgmode.org/ "An Emacs mode for notes and to-do items."
[paredit]: https://www.emacswiki.org/emacs/ParEdit "An emacs mode for working with Lisp and Scheme source code."
[quicklisp]: https://www.quicklisp.org/beta/ "A library manager for Common Lisp."
[rtr1872]: https://www.landpride.com/products/148/rcr18-series-rotary-cutters "A rotary mower."
[s3]: https://aws.amazon.com/s3/ "Cloud-based Internet storage magic."
[safari]: https://www.apple.com/safari/ "A fast web browser."
[sbcl]: http://www.sbcl.org/ "A Common Lisp compiler."
[slime]: https://slime.common-lisp.dev/ "An emacs mode for working with Common Lisp."
[sly]: https://github.com/joaotavora/sly "A Common Lisp IDE in Emacs."
[to-do]: https://www.microsoft.com/en-au/microsoft-365/microsoft-to-do-list-app "A to-do application."
[v-4000]: https://www.fransgard.dk/all-products/forest/v-winch<Paste> "A tractor winch."
[wunderlist]: http://web.archive.org/web/20210128064548/https://www.wunderlist.com/ "A cloud-syncing to-do manager."
[xterm]: https://en.wikipedia.org/wiki/Xterm "Terminal software for the X Window System."
