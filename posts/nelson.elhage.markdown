---
title: Nelson Elhage
summary: Software developer (Stripe) 
date: 2019-10-08
categories:
- developer
- linux
---

### Who are you, and what do you do?

I write software and write stuff on the internet. I was one of the first engineers at [Ksplice][], where I worked on our kernel hot-patching technology as well as the build infrastructure and update-distribution system. For the last seven years, I've worked at [Stripe][], where I worked on all kinds of infrastructure and software design projects. Recently I was a founding member of the [Sorbet][] team, helping build design and build a static typechecker for [Ruby][] that's now open-source and in use at Stripe and numerous other Ruby development shops.

Outside of work, I've developed a handful of open-source projects, including the [CrossMe][] collaborative crossword puzzle app, the [livegrep][] source-code search tool, and [reptyr][], a tool for moving programs between terminals on Linux and FreeBSD.

I also write about software and software engineering. I run a [personal blog](https://blog.nelhage.com/ "Nelson's weblog.") that's mostly about software and writing software, and maintain the [Accidentally Quadratic](https://accidentallyquadratic.tumblr.com/ "Nelson's software quadratic behaviour Tumblr account.") tumblr account, documenting instances of software performance problems caused by inadvertent quadratic behavior.

### What hardware do you use?

Right now, my main laptop is a Google [Pixelbook][] with maxed specs. I develop inside the [Crostini][] VM environment to get a real Linux environment. I love the Pixelbook's hardware and find [Chrome OS][chrome-os] reasonably reliable and pleasant to work with (and it has nice security properties), but I'm getting a bit tired of not having root on my own hardware. I use the Pixel stylus and the laptop in tablet mode for reading or taking notes on PDFs (academic papers or the like).

I maintain a dedicated server hosted with 1&1 IONOS for my personal website and other hosting projects. For personal use I find having a single server much easier to administer than a complex cloud setup in [AWS][] or [GCE][google-compute-engine], and you can get much more RAM and CPU per dollar with physical hardware.

I'm pretty solidly bought into the Google ecosystem (for better or worse) these days, so I tend to use the latest or latest minus 1 Google-branded [Android][] phone, which means a [Pixel 3][pixel-3] right now.

As to gadgets, I love my Jabra [Elite 65t][elite-65t] true wireless ear buds on the go, but prefer Bose [QC2s][quietcomfort-2] when I'm traveling on an airplane, or the Sennheiser [HD 280 Pro][hd-280-pro] for all-day listening at my desk.

I wear a FitBit [Charge 3][charge-3], although I mostly only use it as a watch (and occasionally the built-in timer); I don't use it that much as a fitness or activity tracker. I love my [Kindle Oasis][kindle-oasis] for reading books, and have been on the Kindle train for many years now.

### And what software?

I've been a Linux-on-the-desktop person since 2005 or so, with occasional defections to the Apple universe, mostly when my work required it. As mentioned earlier I currently run Chrome OS, with a [Debian][] development environment inside the Crostini VM, but I tend to prefer [Ubuntu][] on my non-Pixelbook hardware. Servers tend to get the latest LTS release, and my laptops track more bleeding-edge. I'm over my window-manager hacking days and tend to just use whatever the default desktop environment is on any installation I have.

Especially after a few years working on the kernel at Ksplice, I prefer Linux to other environments largely because I've gotten incredibly good at debugging it. No matter what's going wrong on my laptop, by now I probably have the skill set to at least know where to start investigating, which I've come to really value.

I'm a diehard [Emacs][] user, and while I have basic proficiency in many other editors (I even deliberately reach for [vim][] over ssh sessions when I need a fast startup time), I can't really imagine ever leaving Emacs. I still stubbornly use it even when working in [Java][] or other environments with strong IDEs — there are too many keybindings burned too deep into my psyche. My `.emacs` is [available on GitHub](https://github.com/nelhage/elisp "Nelson's Emacs configuration on GitHub.") and I'm still relatively actively evolving it. Recently I got [lsp-mode][] set up, which has been quite nice for the languages with mature server implementations.

I used to be a heavier [org-mode][] user but a few years ago I stopped using it for my TODO lists. I still use a handful of org-mode buffers for [lab notebooking](https://blog.nelhage.com/2010/05/software-and-lab-notebooks/ "Nelson's post about lab notebooking."), though, especially when debugging something tricky or doing extending performance work.

I use [Hugo][] to host my blog, but tend to compose posts (and other documents — like these answers!) in [Dropbox Paper][dropbox-paper]. I find the minimalist UI and the combination of Markdown-esque input with WYSIWYG formatting to be an incredibly pleasant authoring environment.

On the server, I've played with a bunch of different tech stacks, but currently I run out of a single relatively straightforward [docker-compose][] setup to orchestrate all the pieces running on my personal infrastructure.

### What would be your dream setup?

Even as everything moves to the cloud, I tend to stubbornly cling to wanting my development environments and tools local. I've definitely been pondering getting a desktop again, so I can have a huge number of cores and all the RAM sitting right under my desk. Being able to build the Linux kernel in just a few minutes without having to ssh anywhere is quite appealing, and I have aspirations of scaling up livegrep by a few powers of 10; it'd be lovely to just fit that work locally without having to ssh anywhere. It's hard to beat the convenience of a local editor and local everything else.

[android]: https://developers.google.com/android/?csw=1 "A mobile phone platform."
[aws]: https://aws.amazon.com/ "Amazon's web service platforms."
[charge-3]: https://www.fitbit.com/global/us/charge3 "A fitness tracker."
[chrome-os]: https://en.wikipedia.org/wiki/Chrome_OS "A Linux distribution for running web applications."
[crossme]: https://crossme.app/ "An online collaborative crossword solver."
[crostini]: https://chromium.googlesource.com/chromiumos/docs/+/master/containers_and_vms.md#Crostini "A VM environment for Chrome OS."
[debian]: https://www.debian.org/ "A Linux distribution."
[docker-compose]: https://docs.docker.com/compose/ "A tool for controlling multiple Docker containers."
[dropbox-paper]: https://www.dropbox.com/paper/start?no_redirect=1 "A document collaboration service."
[elite-65t]: https://www.jabra.com.au/bluetooth-headsets/jabra-elite-65t#/#100-99000000-40 "In-ear wireless headphones."
[emacs]: http://www.gnu.org/software/emacs/ "A free open-source text editor."
[google-compute-engine]: https://cloud.google.com/compute/ "A virtual machine hosting service."
[hd-280-pro]: http://web.archive.org/web/20221206010356/https://www.amazon.com/Sennheiser-HD-280-Pro-Headphones/dp/B000065BPB/ "Closed stereo headphones."
[hugo]: https://gohugo.io/ "A static site generator."
[java]: http://web.archive.org/web/20221226094350/https://www.java.com/en/ "A cross-platform compiled programming language."
[kindle-oasis]: http://web.archive.org/web/20230201064729/https://www.amazon.com/Amazon-Kindle-Oasis-eReader-with-Leather-Charging-Cover/dp/B00REQKWGA "An ebook reader."
[ksplice]: https://ksplice.oracle.com/ "Software to update Oracle Linux without rebooting."
[livegrep]: http://web.archive.org/web/20221213070955/https://livegrep.com/search/linux "A tool for searching source code."
[lsp-mode]: https://github.com/emacs-lsp/lsp-mode "A Language Server Protocol mode for Emacs."
[org-mode]: https://orgmode.org/ "An Emacs mode for notes and to-do items."
[pixel-3]: https://en.wikipedia.org/wiki/Pixel_3 "A 5.5 inch Android phone."
[pixelbook]: http://web.archive.org/web/20201111203427/https://store.google.com/us/product/google_pixelbook?hl=en-US "A 12.3 inch Chromebook."
[quietcomfort-2]: http://web.archive.org/web/20230706192559/https://www.amazon.com/Bose-QuietComfort-Acoustic-Canceling-Headphones/dp/B000AP05BO "Noise-cancelling headphones."
[reptyr]: https://github.com/nelhage/reptyr "A tool for attaching a running program to a different terminal."
[ruby]: https://www.ruby-lang.org/en/ "An interpreted scripting language."
[sorbet]: https://sorbet.org/ "A type-checking framework for Ruby."
[stripe]: https://stripe.com/jp "A payment service."
[ubuntu]: https://ubuntu.com/ "A Unix distribution."
[vim]: https://www.vim.org/ "A command-line text editor."
