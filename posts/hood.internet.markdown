---
title: Steve Sleeve
summary: Musician, DJ (The Hood Internet)
date: 2015-07-16
categories:
- mac
- musician
---

### Who are you, and what do you do?

I'm STV SLV (Steve Sleeve), one half of the duo known as [The Hood Internet](http://www.thehoodinternet.com/ "The Hood's website."). We are producers, DJs, masher-uppers, smasher-togetherers, musicians.

### What hardware do you use?

For our live shows, the source of music is each of our [MacBook Pros][macbook-pro], run through [Focusrite Scarlett 2i4s][scarlett-2i4] into the mixer, usually a [Pioneer DJM-800][djm-800] or [DJM-900][djm-900nxs]. We each have MIDI controllers. ABX has managed to keep his [M-Audio Trigger Finger][trigger-finger] intact over the years. I broke mine and switched over to an [AKAI MPD18][mpd18]. The MIDI controllers are used largely to turn looping sections of songs on and off, as well as for triggering one-shot sound effects. We don't use Ableton to add things like flanger, delay, etc - those sound better to us when processed through the Pioneer mixer's built-in effects.

We also have lighting information that runs from one of the MacBooks through an [ENTTEC DMX USB Pro][dmx-usb-pro] into a set of custom-built LED tiles. Each tile has a dimmer, all connected to each other with Cat-5 cable. The ENTTEC box translates RGB color values that are coming from the laptop, and translates them to [DMX](https://en.wikipedia.org/wiki/DMX512 "The Wikipedia entry for DMX512."), the language that the lighting dimmers use to talk to each other.

### And what software?

Our sets are performed using [Ableton Live][live]. The Focusrite I/O boxes send out to two separate channels each, so that either of us are able to have one song playing and silently be cueing up / looping the intro to the next song in a separate mixer channel, monitorable by headphones.

<img src="/images/interviews/hood.internet/lights.gif" width="500" height="335" alt="The Hood Internet's lights." class="detail">

The LED lighting sequences also originate in Ableton. When a song is triggered to play, a MIDI sequence is simultaneously cued up to launch at the same time as the song. Ableton uses its IAC Driver to send MIDI information over to video-mixing program [Modul8][], which then launches lighting sequences assigned to whichever MIDI notes are coming from Ableton. Next, Modul8 uses its internal [Syphon][] channel to send the video data over to [MadMapper][], the app that (with the help of the ENTTEC box) translates the lighting's color and brightness to DMX, and the dimmer in each LED tile distributes that DMX info to each of its channels.

### What would be your dream setup?

Our lighting designer Morgan Leek recently made a supersized version of Hood's LED lights for the band Tegan & Sara, and it's pretty fantastic. It would be awesome if we had an unlimited budget for him to work with to create something along those lines, as well as incorporate video screens that work in tandem with the design, which would be operated by our video artist, Joe Carsello.

[djm-800]: http://web.archive.org/web/20190626133114/https://www.pioneerelectronics.com/PUSA/DJ/Mixers/DJM-800 "A MIDI mixer."
[djm-900nxs]: http://web.archive.org/web/20161115015835/http://www.pioneerdj.com:80/en/product/mixer/djm-900nxs/black/overview/ "A MIDI mixer."
[dmx-usb-pro]: https://www.enttec.com/index.php?main_menu=Products&prod=70304&show=description "A dongle for connecting computers to DMX512 lightning systems."
[live]: https://www.ableton.com/en/live/ "Musical creation software."
[macbook-pro]: https://www.apple.com/macbook-pro/ "A laptop."
[madmapper]: https://madmapper.com/ "Mac software for video-mapping projections."
[modul8]: http://web.archive.org/web/20170621070923/http://www.garagecube.com:80/modul8/index.php? "Real-time video mixing/compositing software for Mac OS X."
[mpd18]: http://web.archive.org/web/20170623124249/http://www.akaipro.com:80/product/mpd18 "A DJ pad controller."
[scarlett-2i4]: http://web.archive.org/web/20180808200531/http://us.focusrite.com:80/usb-audio-interfaces/scarlett-2i4 "A USB audio interface."
[syphon]: http://syphon.v002.info/ "Real-time video frame mixing."
[trigger-finger]: http://web.archive.org/web/20220522192913/https://www.musiciansfriend.com/keyboards-midi/m-audio-trigger-finger-16-midi-drum-control-surface "A MIDI control pad."
