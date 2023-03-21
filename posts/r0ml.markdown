---
title: Robert Lefkowitz
summary: Software architect, developer
date: 2021-03-13
categories:
- developer
- mac
---

### Who are you, and what do you do?

I'm [Robert Lefkowitz](https://twitter.com/r0ml "Robert's Twitter account.") - and I am known as the r0ml. I used to be a software architect - and before that, a computer programmer - but I retired about two years ago. Which means that whatever things I "do" are, by definition, hobbies; and none of them are privileged over any of the others by virtue of being monetized.

### What hardware do you use?

Well, that kind of depends on which hobby I'm engaging in.

When the weather is nice, I like to chop down trees and remove the stumps - and for that the hardware I use is a two-bladed axe and a mattock.

One of my year round hobbies is writing code, which I was lucky enough to do professionally for so many years. And that's where most of the hardware and software come in. When I retired, I concluded that I wasn't going to be commuting or traveling as much, so I should retire my laptop and switch to a desktop. Little did I realize at the time that events would conspire to encourage non-retirees to make the same transition.

A desktop setup begins with a desk. I acquired an [Uplift curved corner standing desk][v2] in rubberwood. Atop the desk, the most elegant piece, a [BENT design industrial burned steel monitor stand][industrial-burned-steel-monitor-stand] which (as the description notes) is designed for the [iMac][]. Hence, atop the monitor stand, an iMac (a 2019 27-inch model with the Radeon Pro 580X GPU) and 40GB of RAM. Next to the iMac, my [27-inch LG UltraFine display][ultrafine-5k] which used to be my external monitor when I used laptops. Between the two, my [BenQ LED desk lamp][e-reading] which is very bright and can be easily oriented to illuminate me - so I don't need a separate ring lamp for teleconferencing. Behind the iMac is my trusty [Synology DS413][ds413] with 4x4Tb [Western Digital Reds][wd-red] (RAIDed, of course) which I've had for over ten years (the disks have been replaced over time). And on the far corner of the desk, my [Epson Perfection V600 Photo scanner][perfection-v600] in case one of my retirement hobbies would turn out to be digitizing the dozens of shoeboxes filled with old family photos from a previous century. But I digress.

The keyboard is a [Logitech wireless MX Keys][mx-keys] next to the [Apple wireless trackpad][magic-trackpad]. And I have a [RAVPower 60W USB charger][rp-pc028] for the small set of portable devices that need powering (my [iPhone X][iphone-x], [iWatch 3][apple-watch-series-3], [iPad Pro][ipad-pro] 12.9" 2nd gen (with a first gen [Pencil][]), and wireless Beats headphones).

You might think that I have a cozy office somewhere to locate my hacking setup, but as it turns out, as part of the retirement planning, we renovated the house to turn it into a large aerial studio (don't ask unless you have time for a really long answer), so my desk is located on a catwalk.
 
The headphones are only for midnight hacking, or when the aerialists are being noisy - the rest of the time, I'm streaming to my pair of [Sonos Fives][five]. All of this connected to the internet via the eero Pro mesh network.

Lastly, the most important piece of hardware, my [Warby Parker Ames][ames] spectacles. These are a special single-vision prescription for staring at my computer screens from a constant distance, and not the progressive lenses I wear when not at my desk.

So much for the hardware.

### And what software?

As for software..

When I said that one of my hobbies was to write software, I forgot to mention that I also liked to run software just to see what it did - I wasn't "using" it, I was "evaluating" it (that's the difference between a programmer and an architect - the programmer writes software, the architect evaluates it). There are several side effects of this activity. One of them is that I used to have terabytes of software installed. Another side effect is that I kept changing the things I used - you know, to evaluate alternatives. This behavior bordered on the pathological. Just to give you a sense, I used [Emacs][] for about 20 years, and then, realizing that I was in an editor rut, I switched to [Vim][] for the next 15 years. I don't need anybody else to have an [editor war](https://en.wikipedia.org/wiki/Editor_war "The Wikipedia article about the rivalry between Emacs and Vim."). As part of my retirement plan, I resolved to stop "evaluating" software and stick to using it, or writing it.

I decided to focus on a few areas. 

Firstly, programming GPUs in [Metal][]. Why Metal? Because my first professional programming language was [APL][] - which has many similarities to GPU programming - and the XCode Metal debugger struck me as futuristic and awesome. Metal was a way to return to my youth and my roots, and at the same time leap into the future. 

Secondly, to work with my daughter (who is a physics professor specializing in acoustics) on some of her programming projects (which involve acoustic ray-tracing - and could *so* be done on a GPU). 

Thirdly, to develop iPad apps using graphics / game technologies / augmented reality (hello, again, GPU) in [Swift][].

Lastly, I decided to stop using open source software whenever possible and use any available alternatives (don't ask unless you have time for a really long answer).

With those objectives in mind, I could start deleting software. In fact, I could delete most of it. It's a work in progress. After all, [the best code is no code at all](https://blog.codinghorror.com/the-best-code-is-no-code-at-all/ "A post by Jeff Atwood about software developers.").

My spouse has never been interested in software. Many years ago, when we first met, I would rib her about the fact that she never installed software. She would get a phone or laptop, and only ever use the software that came pre-installed. And now that I have stopped "evaluating" software, I find that I mostly only use the software that comes pre-installed on my devices. Given that I have an iMac and iPhone and iPad, I use the pre-installed software. [Mail][] for mail. [Pages][] for writing. [Keynote][] for presentations. [Messages][] for texting. [Photos][] for photos. [Music][] for music. [Safari][] for browsing. If I'm not using a pre-installed app, I'm using an app that came with hardware. Sonos for Sonos. Eero for eero. Epson Scan for scanning with the Epson scanner. On mobile devices, there is another kind of software: which is best described as "oft-used-websites-are-better-as-apps". My bank has a web site - which I use - except on a mobile device where I use the app. I subscribe to The New York Times and the Washington Post. On my desktop I read them in the browser; on the iPad I read them in their respective apps. I watch Amazon Prime Video in the browser on my desktop; I use [the app][amazon-prime-video-ios] on my iPad. You get the idea. There are probably twenty such apps. 

Other than these three categories (pre-installed, came-with-hardware, mobile-website) there are very few software packages I use. Those are: 
[1Blocker][] for ad blocking. Eero offers an ad blocking service which I use, so the network now blocks many of the ads before they reach the device - but it is always worth a few extra bucks to block even more ads. Although this is the kind of software that one uses without being aware of using it.

[XCode][] for software development. Although XCode is an Apple application, it needs to be explicitly installed. One could consider it to be a "comes with the hardware" app, but since I use it for so many hours a day, I'll give it special mention. In addition to XCode, I use [Hacking with Swift+][hacking-with-swift-plus] and [Stack Overflow][stack-overflow] - which might not be considered software - but they are full of software that I use (with explanations) - so I count them. And as long as we're using an expansive definition of software, I should mention [Rossini operas](https://en.wikipedia.org/wiki/List_of_operas_by_Gioachino_Rossini "A Wikipedia list of Rossini operas."). I have a 96+ hour playlist of these which feeds the afore-mentioned Sonos speakers with software for my head. Before Rossini operas, the playlist was [Handel oratorios](https://en.wikipedia.org/wiki/Category:Oratorios_by_George_Frideric_Handel "A Wikipedia list of Handel oratorios.").

To organize my research materials and scraps of text I've accumulated over the years I use [DEVONthink][]. 

I still use [1Password][] to store passwords - although I find that lately I'm mostly using the built-in [Keychain Access][keychain-access]. 
I use [Tweetbot][] for checking in on [Twitter][]. This is the rare case where using an app on the desktop is better than using the browser.

When I need to draw a diagram, I use [Omnigraffle][].

And lastly, the [New York Times Crossword Puzzle app][nytimes-crosswords-ios]. Our family has a long-lasting ritual that consists of gathering in the family room after dinner and AirPlaying the New York Times crossword puzzle onto the television from my iPad. The emcee reads the clues aloud and people volunteer answers. We usually do two or three puzzles after dinner (obviously, since they only publish one a day, we've been plumbing their historical archives). More recently we've set up a 135-inch diagonal projection screen which we use for the family crossword puzzle event.

### What would be your dream setup?

My desktop is pretty much where it needs to be. I'm not super thrilled about my desk chair (it's an [Aeron][]), and I started thinking about getting a new one - but now that I have the standing desk, if I'm feeling uncomfortable in the chair, I raise the desk and stand. At some point I might invest in a more comfortable chair. Definitely leather.

An eGPU of some kind would be nice (did I mention I'm interested in GPU programming?). That will wait until I have some projects that could really benefit from it. (I'm thinking that the urban landscape sonic boom simulations that my daughter is working on might do the trick. Unlike light ray-tracing where there is a single (virtual) camera to collect the rays - in sonic raytracing there is a grid of thousands of (virtual) microphones to collect the sound waves. That project is likely to lead to an eGPU - and also installing a Fortran compiler.)

I've also got my eye on a new desktop using Apple Silicon. At present the only desktop with an M1 is the [Apple Mini][mac-mini]. I will start being tempted when a big screen iMac is available with Apple Silicon.

I have spent the last few weeks researching "dream setup" in another direction. Remember that New York Times Crossword Puzzle? Well, the 135-inch projection screen we have is not very good, and the projector is an ancient 720p model. The discussion of the "dream setup" around the Alliance household (that's what we call ourselves) revolves around a nicer screen (we're leaning towards the [Elite Screens Manual pull-down 135" 16:9][manual]), a nicer projector (we're leaning towards the [Optoma HD28HDR][hd28hdr] or perhaps the [Optoma UHD50X][uhd50x], upgrading to the [Apple TV 4K][apple-tv-4k], and we might need to get the [HDFury 4K Arcana][4k-arcana] in order to hook up the [Sonos Arc][arc] so that we can get Dolby Atmos working with the projector. Not sure if that can be made to work yet - but that's the dream. After all, if one is going to do the Sunday crossword puzzle on a projection screen from 13 feet away, 720p is a sub-optimal experience regardless of which pair of Warby Parker glasses one is wearing.

To be fair, we don't need Dolby Atmos for the crossword puzzle. However, we do sometimes watch movies. Because when one is retired, what one "does" is indistinguishable from "entertainment" (which, as Arthur C. Clarke might have noted - requires a sufficiently advanced level of technology).

Also on the dream setup wishlist is the [LG OLED GX 55" TV][oled55gxpua] - which would go over the fireplace. When wall mounted, it is thinner than a framed picture. Looks like one, too.

With all that video, let's not forget audio. Since karaoke bars have become a thing of the past, one can't help but daydream about a home karaoke setup. The [Sennheiser e 835 dynamic cardioid vocal microphone][e-835] is on the list. And I suppose I could use it for Zoom calls with a [Gator Frameworks Short Weighted Base Microphone Stand][gfw-mic-0822]. Although there is software for karaoke, I can't help but think that perhaps the better approach is to buy some hardware - a karaoke machine, as it were - and install whatever software came with the hardware (if any). Yes, the dream setup would definitely have a karaoke machine; karaoke software would be a settle-for.

And finally, as long as we're dreaming, the [Breville Oracle Touch espresso machine][the-oracle-touch]. Because a computer programmer is a machine for converting caffeine into code. Presumably higher quality caffeine will result in higher quality code. And I have heard that the highest quality coffee machines are Australian. And it doesn't come with software.

[1blocker]: https://1blocker.com/ "An ad blocker for Safari."
[1password]: https://1password.com "Password management software for Mac OS X."
[4k-arcana]: https://hdfury.com/product/4k-arcana-18gbps/ "An HDMI video processor."
[aeron]: https://www.hermanmiller.com/products/seating/office-chairs/aeron-chairs/ "A work chair."
[amazon-prime-video-ios]: https://itunes.apple.com/us/app/amazon-prime-video/id545519333 "A client app for the streaming video service."
[ames]: https://www.warbyparker.com/eyeglasses/men/ames/ "Glasses."
[apl]: https://en.wikipedia.org/wiki/APL_(programming_language) "A programming language."
[apple-tv-4k]: https://en.wikipedia.org/wiki/Apple_TV#5th_generation_(4K) "A media player."
[apple-watch-series-3]: https://en.wikipedia.org/wiki/Apple_Watch_Series_3 "A smartwatch with optional cellular data."
[arc]: https://www.sonos.com/en-us/shop/arc.html "A soundbar."
[devonthink]: https://www.devontechnologies.com/products/devonthink/ "Software for storing all your documents, scans etc."
[ds413]: https://www.synology.com/en-us/support/download/DS413 "A NAS device."
[e-835]: https://en-us.sennheiser.com/live-performance-microphone-vocal-stage-e-835 "A microphone."
[e-reading]: https://www.benq.com/en-us/lamps/desklamp/desklamp.html "A desk lamp."
[emacs]: http://www.gnu.org/software/emacs/ "A free open-source text editor."
[five]: https://www.sonos.com/en-us/shop/five.html "A wireless speaker."
[gfw-mic-0822]: http://web.archive.org/web/20220529000532/https://gatorframeworks.com/products/telescoping-boom-podcast-bass-drum-and-amp-mic-stand-gfw-mic-0822/ "A telescoping boom arm for microphones."
[hacking-with-swift-plus]: https://www.hackingwithswift.com/plus "A Swift tutorial service."
[hd28hdr]: https://www.optomausa.com/product-details/HD28HDR "A projector."
[imac]: https://www.apple.com/imac/ "An all-in-one computer."
[industrial-burned-steel-monitor-stand]: https://www.bent.design/collections/frontpage/products/burned-steel-monitor-stand-monitor-riser-imac-stand-metal-shelf-tv-stand-desk-decor-industrial-shelf-laptop-stand "A monitor stand."
[ipad-pro]: https://en.wikipedia.org/wiki/IPad_Pro "An iOS tablet."
[iphone-x]: https://en.wikipedia.org/wiki/IPhone_X "A 5.8 inch smartphone."
[keychain-access]: https://support.apple.com/en-au/guide/keychain-access/kyca1083/mac "A macOS app for storing passwords."
[keynote]: https://www.apple.com/keynote/ "Presentation software for the Mac."
[mac-mini]: https://www.apple.com/mac-mini/ "A small desktop computer."
[magic-trackpad]: https://en.wikipedia.org/wiki/Magic_Trackpad "A trackpad for desktop machines."
[mail]: https://en.wikipedia.org/wiki/Mail_(application) "The default Mac OS X mail client."
[manual]: https://elitescreens.com/products/manual-series/ "A pull-down screen for projectors."
[messages]: https://en.wikipedia.org/wiki/Messages_(application) "A chat client for Mac."
[metal]: https://en.wikipedia.org/wiki/Metal_%28API%29 "An API for working with 3D graphics."
[music]: https://en.wikipedia.org/wiki/Music_(software) "A media player."
[mx-keys]: https://www.logitech.com/en-us/products/keyboards/mx-keys-wireless-keyboard.920-009294.html "A keyboard."
[nytimes-crosswords-ios]: https://itunes.apple.com/us/app/nytimes-crosswords/id307569751 "A crosswords app for iOS."
[oled55gxpua]: https://www.lg.com/us/tvs/lg-oled55gxpua-oled-4k-tv "A 55 inch OLED TV."
[omnigraffle]: https://www.omnigroup.com/omnigraffle/ "Diagramming software for the Mac."
[pages]: https://www.apple.com/pages/ "A Mac word processor and layout tool from Apple."
[pencil]: https://www.fiftythree.com/pencil "An iPad stylus."
[perfection-v600]: https://www.amazon.com/Epson-B11B198011-Perfection-Photo-Scanner/dp/B002OEBMRU "A photo scanner."
[photos]: https://www.apple.com/macos/photos/ "A photo editor for macOS."
[rp-pc028]: https://www.ravpower.com/products/rp-pc028-60w-usb-charger "A 6-port USB power charger."
[safari]: https://www.apple.com/safari/ "A fast web browser."
[stack-overflow]: https://stackoverflow.com/ "A developer community."
[swift]: https://www.lamyusa.com/us_en/rollerball-pen-lamy-swift.html "A rollerball pen."
[the-oracle-touch]: https://www.breville.com/us/en/products/espresso/bes990.html "A coffee machine."
[tweetbot]: https://tapbots.com/tweetbot/mac/ "A Twitter client for the Mac."
[twitter]: https://twitter.com/ "An online micro-blogging platform."
[uhd50x]: https://www.optomausa.com/product-details/UHD50X "A projector."
[ultrafine-5k]: http://web.archive.org/web/20190711102445/https://www.apple.com/shop/product/HKN62LL/A/lg-ultrafine-5k-display "A 27 inch monitor."
[v2]: https://www.upliftdesk.com/uplift-v2-standing-desk-v2-or-v2-commercial/ "A standing desk."
[vim]: https://www.vim.org/ "A command-line text editor."
[wd-red]: https://www.wdc.com/en/products/products.aspx?id=810 "A hard disk designed for NAS/RAID usage."
[xcode]: https://en.wikipedia.org/wiki/Xcode "An IDE for Mac developers."
