---
title: Chris Wellons
summary: Software engineer
date: 2019-10-04
categories:
- developer 
- linux
---

### Who are you, and what do you do?

My name is [Chris Wellons](https://nullprogram.com/ "Chris' website.") and I'm a software engineer with around 24 years of programming experience. In addition to my professional software work, I've written, collaborated on, and maintain a number of open source software projects such as [Elfeed][] (an RSS and Atom feed reader), [Endlessh][] (an SSH tarpit), and [Enchive][] (a cryptographic backup tool). I also mentor high school and [college students](https://nullprogram.com/blog/2016/09/02/ "Chris' post about being a high school mentor.") in software development.

For the past 12 years I've also regularly published a [wide variety](https://nullprogram.com/index/ "A list of Chris' posts on his website.") of programming articles on my blog, mostly related to open source software development.

### What hardware do you use?

I use various Dell computers, including right now as I currently type this on a [Latitude 7490][latitude-7490]. However, this situation isn't so much a deliberate choice as it is going with the flow and sticking to the simplest, least (personally) costly options. I really don't care too much about hardware so long as it has enough memory and it's compatible with my preferred software configuration.

I tend to use machines for a long time, far beyond their warranty and until they're no longer worth upgrading or repairing. Less than a year ago I was still using a Latitude E6410 from 2010 as my daily driver. The primary reason I replaced it was that modern web browsers had simply outgrown it.

I also rely significantly on a home server built from an [ODROID-C2][]. In the past this role had been filled by older [Raspberry Pi][raspberry-pi] models, but the ODROID is well-suited as a server. Since I don't need to run a web browser on these devices, my demands from them are much smaller.

### And what software?

I'm a Linux guy through and through and have been for the past 15 years. I strongly prefer [Debian][], but [Ubuntu][] is also acceptable. In either case I prefer stable Linux distributions where the software doesn't change for years at a time, where I get to decide exactly when the eventual upgrade happens. I'm a creature of habit, and I don't like my days interrupted by big, breaking updates.

I use [NeoMutt][] as my [email client](https://nullprogram.com/blog/2017/06/15/ "Chris' post about switching to Mutt."). It lets me comfortably compose all my mail in my favorite text editor, [Vim][]. I'm using both right now. With one exception, I use Vim for all my software development, and I dislike integrated development environments (IDEs). The one exception is [Emacs][], my second favorite text editor, though these days I only use Emacs for extending Emacs.

Why I like these editors so much is that I spend a significant amount of my time working inside of a terminal emulator connected via [SSH][openssh] to a remote machine. To manage this setup, I'm nearly always using [tmux][], a terminal multiplexer. I'm also using tmux this very moment as I type this on a remote system. For the terminal emulator itself I usually use [xterm][] because it's so configurable and featureful.

[Firefox][] is my favorite web browser. This is in large part due to [Tridactyl][], an add-on that makes the interface [Vim-like](https://nullprogram.com/blog/2018/09/20/ "Chris' article about switching to Tridactyl."), which makes the interface far more capable. I also use [uBlock Origin][ublock-origin] and [uMatrix][] for privacy, security, and efficiency.

I dislike big desktop environments, so instead I use [OpenBox][] - bare-bones, without any task bar, start menu, etc. It's heavily customized and configured especially for keyboard use. With it I can go for long periods without needing to touch the mouse.

Configuration is so important to me that I carefully track it all in [source control](https://github.com/skeeto/dotfiles "Chris' dotfiles on GitHub.") with [Git][] on [GitHub][]. That's why it doesn't matter what machine I'm working on. I carry my entire software configuration wherever I need it, so any machine will feel like home inside of a few minutes. In a pinch, the machine doesn't even need to have Linux installed since I can boot directly into my own Debian-based [live image](https://github.com/skeeto/live-dev-env "Chris' live development environment setup on GitHub.") with my personal configuration already baked in.

I use [mpv][] for most media consumption. Its minimalistic keyboard interface is perfectly suited for my needs. I nearly always use mpv for [YouTube][], too, watching videos downloaded with [youtube-dl][]. For instance, I'm "subscribed" to many different YouTube channels via their Atom feeds using my web feed reader, Elfeed. When one of these channels publishes a new video, Elfeed hands the new video URL directly to youtube-dl for downloading, and I watch it later with mpv. My procrastination is highly optimized.

### What would be your dream setup?

I've invested a lot of time getting everything just the way I like it, so my dream setup isn't much different from what I already use! It would be what I have now, minus the bugs.

Honestly, my dream setup is less about me and more about the people around me. The biggest issues with my existing setup involve working around *other* people's setups, particularly when they're using subpar software and they don't even realize it. Other people's limitations can limit me when I need to be compatible. Passive "choices" can negatively influence the future direction of technology, particularly when [dark patterns](https://www.darkpatterns.org/ "A website explaining dark patterns.") are involved.

And my role as an open source enthusiast, developer, and writer is to improve this situation, either through education or simply creating better tools!

[debian]: https://www.debian.org/ "A Linux distribution."
[elfeed]: https://github.com/skeeto/elfeed "An Emacs feed reader."
[emacs]: http://www.gnu.org/software/emacs/ "A free open-source text editor."
[enchive]: https://github.com/skeeto/enchive "A tool for encrypting files."
[endlessh]: https://github.com/skeeto/endlessh "An SSH tarpit."
[firefox]: https://www.mozilla.org/en-US/firefox/new/ "A cross-platform open-source web browser."
[git]: https://git-scm.com/ "A version control system."
[github]: https://github.com/ "A Git code repository service."
[latitude-7490]: https://www.dell.com/en-us/work/shop/dell-laptops-and-notebooks/latitude-7490-business-laptop/spd/latitude-14-7490-laptop "A 14 inch PC laptop."
[mpv]: https://mpv.io/ "A cross-platform media player."
[neomutt]: https://neomutt.org/ "A command line email client."
[odroid-c2]: https://en.wikipedia.org/wiki/ODROID "A single board computer."
[openbox]: http://openbox.org/wiki/Main_Page "A window manager for *nix."
[openssh]: http://www.openssh.com/ "A popular collection of SSH tools."
[raspberry-pi]: https://en.wikipedia.org/wiki/Raspberry_Pi "A single-board hackable computer."
[tmux]: https://sourceforge.net/projects/tmux/ "A terminal multiplexer, similar to screen."
[tridactyl]: https://github.com/tridactyl/tridactyl "A Firefox extension allowing Vim-like hotkeys."
[ublock-origin]: https://en.wikipedia.org/wiki/UBlock_Origin "A browser extension for blocking elements on the web."
[ubuntu]: https://www.ubuntu.com/ "A Unix distribution."
[umatrix]: https://github.com/gorhill/uMatrix "A browser extension for filtering request types."
[vim]: https://www.vim.org/ "A command-line text editor."
[xterm]: https://en.wikipedia.org/wiki/Xterm "Terminal software for the X Window System."
[youtube-dl]: https://rg3.github.io/youtube-dl/ "A command-line tool for downloading videos from YouTube etc."
[youtube]: https://www.youtube.com/ "A web site for watching 80's TV commercials and bad mashups."
