Diogenes NG
===========

This is a half fork of the old
[Diogenes](https://community.dur.ac.uk/p.j.heslin/Software/Diogenes/)
code, to get it running on modern Ubuntu, and have a cross-platform
front-end application for viewing the locally hosted site.

It is likely riddled with bugs, and possibly even may have some issues
in security, as the code is quite old, without tests, and not well
documented. Please use with caution. This has only been tested as being
able to even run on 18.04. It's not clear if all features will even work
at this point.


Installation
============

Currently, this will only likely run well on Linux or similar systems.
Before installing, one needs to have some dependencies installed for the
app to function, including a somewhat unknown list of perl modules to run
the server. On Debian/Ubuntu you can install some packages with apt to
start:

```
sudo apt install qmlscene qml-module-qtwebengine \
 libcgi-pm-perl libhttp-daemon-perl libhttp-message-perl
```

Now you can install Diogenes NG.

```
sudo ./linux-installer.pl
```

This will install the app and server under _/usr/local/diogenes_ and
install an icon and .desktop file for launching the application, in the
standard locations. You can also run _diogenes-ng_ to start the app.
