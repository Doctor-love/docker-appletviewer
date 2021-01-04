# docker-appletviewer
#### For those terrible times when you need to use a Java applet

## Introduction
Once upon a time, a few Sunburned thought it would be a good idea to put Java applications
in the web browser. After a few years, everyone realized it was a terrible idea and
support was removed from any browser with the slightest sense of self-preservation.
  
A few years after the few years, a group of Oracles foresaw this as well and decided
to deprecate it in JRE/JDK 9.
  
This is all well and good, but sometimes there is a need to use one of these ancient applets.
Back in the days, there used to be an application called "appletviewer" in the JDK which
allowed developers to launch applets without fiddling with a web browser and tweak Java
runtime options, such as HTTP proxy settings. This application was also slain in the great
deprecation wars of JDK 9.
  
This Docker image basically takes a somewhat dusty version of Debian (which shipped with
OpenJDK 8) and allows you to use "appletviewer" by forwarding an X11 socket.
  
**WARNING:** You are running outdated and likely vulnerable code by using this Docker image.
If you are gonna use it for untrusted applets, consider running a separate X11 server,
such as "Xpra", and enforce stricter sandboxing in the container runtime.

## Usage
```
$ docker build -t appletviewer:latest .
$ cat appletviewer

#!/usr/bin/env bash

docker run --rm --volume /tmp/.X11-unix:/tmp/.X11-unix:ro -e DISPLAY appletviewer:latest ${@}

$ cp appletviewer /usr/local/bin/ && chmod 755 /usr/local/bin/appletviewer
$ appletviewer https://example.com/java_applet.html
```
