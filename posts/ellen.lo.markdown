---
title: Ellen Lo
summary: Creative technologist, dancer
date: 2020-05-14
categories:
- dancer
- mac
- technologist
- windows
---

### Who are you, and what do you do?

Hi, I am [Ellen](https://ellenlowing.com/ "Ellen's website."). I am a freelance creative technologist and dancer based in Brooklyn. When I am not making websites, I am working on [this series](https://www.instagram.com/codebrewed/ "Ellen's Instagram account about Chinese characters and Hong Kong.") about Chinese characters and Hong Kong.

Before COVID-19, I was also working at HYPNO, where I designed an [RFID scanner](https://hypno.com/c/color-factory-htx "Ellen's RFID scanner project at HYPNO.") + [iOS][] integration flow, developed a motion-triggered camera app for a slide, and made a [face filter](https://instagram.com/a/r/?effect_id=512224676011992 "Ellen's Instagram filter (requires the app).").

### What hardware do you use?

For the first LED installation I did in 2018, [Fluid](https://axismundi.info/pages/fluid/index.html "Ellen's LED installation."), I used a Garmin [LiDAR-Lite sensor][lidar-lite-v3] and an [Arduino Uno][arduino-uno] to calculate viewers' distance and filtered out noise in [TouchDesigner][touchdesigner]. To keep the playback on the LEDs in sync, I used Syphon to share textures with the [PixelPusher][] interface. 

Before the lockdown in NYC, I was doing [ARKit][] dev with an [iPad Pro 12.9"][ipad-pro]. For lights and electronics stuff, Adafruit [HUZZAH32][] is my go-to board for prototyping, but the Arduino Uno is easier sometimes because I use the [Ethernet Shield][ethernet-shield-2] and [DMX Shield][dmx-shield] a lot. If USB is available, the ENTTEC [DMX USB Pro Mk2][dmx-usb-pro-mk2] is the least confusing DMX interface to me that does both send/receive. For the RFID scanner, I used a [Raspberry Pi 3B+][raspberry-pi-3b-plus] and the [ACM1252U-Y3 module][acm1252u-y3].

In my experience, Kinect for Windows on PC running TouchDesigner is the only answer to Kinect skeleton mapping. Otherwise, a [MacBook Pro 13"][macbook-pro] (2019) and [Kinect][] V1 is okay for a home setup, only when absolutely necessary. 🤠

### And what software?

I am language agnostic – I've used [Matter.js][], [p5.js][], [Three.js][], [Hanzi Writer][hanzi-writer], [OpenCV][], [openFrameworks][], and [ShaderToy][], but it's been mostly the good old [Processing][] for sketches. And I usually end up creating my own tools to do things like extract outline and signed distance functions of Chinese characters. Sometimes I add feedback with TouchDesigner to get the extra procedural look. Then I use [QuickTime][quicktime-pro] to record my screen and document the sketch. 

[Atom][] is my default text editor, if I am not using any IDEs. [Tower][] is a great [Git][] client, but I also just like to stick to the command line when developing my own projects. 

For website stuff, I use [Safari Technology Preview][safari-technology-preview] to prototype and check for responsiveness. [Sketch][] is my favorite when designers do dev handoff. I use [GitHub Pages][github-pages] to share prototypes. When a CMS is needed for a project I've been using [WordPress][], but I'm looking to explore other prettier options.

### What would be your dream setup?

A Sketch plugin that returns CSS code in viewport units. A physical notebook that lets me cmd+f 🤖. A custom EEG headset that would put up a Do Not Disturb sign for me whenever my brain activity is high (when working with people.)

[acm1252u-y3]: https://www.acs.com.hk/en/products/368/acm1252u-y3-usb-nfc-reader-module-with-detachable-antenna-board/ "An NFC reader module."
[arduino-uno]: https://store.arduino.cc/products/arduino-uno-rev3/ "A microcontroller board."
[arkit]: https://developer.apple.com/augmented-reality/arkit/ "Apple's augmented reality framework."
[atom]: https://github.blog/2022-06-08-sunsetting-atom/ "A text editor based on web technology."
[dmx-shield]: https://www.dfrobot.com/product-984.html "A DMX controller for Arduino boards."
[dmx-usb-pro-mk2]: https://www.enttec.com.au "A USB interface for controlling lights via DMX."
[ethernet-shield-2]: http://web.archive.org/web/20210801203036/https://store.arduino.cc/usa/arduino-ethernet-shield-2 "An ethernet add-on for Arduino boards."
[git]: https://git-scm.com/ "A version control system."
[github-pages]: https://pages.github.com/ "A simple GitHub-based web publishing system."
[hanzi-writer]: https://hanziwriter.org/ "A JavaScript framework for drawing and tracing Chinese characters."
[huzzah32]: https://www.adafruit.com/product/3405 "A tiny hackable computer board."
[ios]: https://www.apple.com/ios/ "A mobile operating system."
[ipad-pro]: https://en.wikipedia.org/wiki/IPad_Pro "An iOS tablet."
[kinect]: http://web.archive.org/web/20141020163539/http://www.xbox.com:80/en-US/Kinect "An adapter for the Xbox that uses your body as a controller."
[lidar-lite-v3]: https://www.adafruit.com/product/4058 "A distance sensor device."
[macbook-pro]: https://www.apple.com/macbook-pro/ "A laptop."
[matter.js]: https://brm.io/matter-js/ "A 2D JavaScript physics framework."
[opencv]: https://opencv.org/ "A programming library for working with real-time computer vision."
[openframeworks]: https://openframeworks.cc/ "A C++ library for creative projects."
[p5.js]: https://p5js.org/ "A Javascript library based on Processing."
[pixelpusher]: http://web.archive.org/web/20210225072214/http://www.heroicrobotics.com/products/pixelpusher "A computer board for controlling light strips and LEDs."
[processing]: https://processing.org/ "A programming language/environment."
[quicktime-pro]: http://web.archive.org/web/20230706193331/https://support.apple.com/en-us/HT201175 "A commercial version of QuickTime."
[raspberry-pi-3b-plus]: https://magpi.raspberrypi.org/r//raspberry-pi-3bplus-specs-benchmarks/ "A tiny computer."
[safari-technology-preview]: https://developer.apple.com/safari/technology-preview/ "A bleeding edge version of the Safari web browser."
[shadertoy]: https://www.shadertoy.com/ "A web-based 3D shader tool."
[sketch]: https://www.sketch.com/ "A vector drawing application for Mac OS X."
[three.js]: https://threejs.org/ "A Javascript 3D library."
[touchdesigner]: https://derivative.ca/product "Visual development software."
[tower]: https://www.git-tower.com/ "A Mac GUI for Git."
[wordpress]: https://wordpress.com/ "Weblog publishing software."
