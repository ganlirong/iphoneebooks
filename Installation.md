# READ THIS FIRST! #

The wonderful people who made the Installer.app have also made a one-click solution for installing Installer itself on your iPhone.  (My head is spinning just thinking about that.)  [Visiting their site is strongly encouraged](http://iphone.nullriver.com/beta/), and Installer.app is the recommended way to install Books.app.  Just be sure to get the "Community Sources" package; Books.app's package is maintained by Ste.

Of course, even though this is a lot easier now, all these third-party apps are not supported by Apple, so proceed with caution.

# Old, crusty instructions #

Installing an application on the iPhone  is not a simple process.  If you don't know what "jailbreak" or "iPHUC" means, you should google those terms.  iFuntastic may also be helpful.

These instructions are for Mac OS X.

# Jailbreaking your Phone #

The bestest instructions can be found on the iPhone Dev Wiki.

# Installing SSH #

You need to install SSH on your iPhone so you can make your applications executable.  [TUAW](http://www.tuaw.com/2007/07/23/ssh-on-iphone/) has a series of links to tutorials and so forth.  You should also install scp (secure copy) to allow you to copy files while maintaining execute permissions.

**IMPORTANT: CHANGE YOUR IPHONE'S DEFAULT PASSWORD!**  The default password is documented all over the 'net, and if you do not change it, you are leaving your phone wide open to unscrupulous crackers!  Details are in the tutorial on installing SSH.

# Copying Books.app to your iPhone #

  1. Build Books.app from source, or just [download](http://code.google.com/p/iphoneebooks/downloads/list) the current release (recommended).  For this tutorial I'll assume it was downloaded to your Desktop.
  1. With Wi-Fi operational, find out the IP address of your phone.  Go to Settings -> Wi-Fi, then click on the blue disclosure triangle next to your current network.  The IP address will be listed on the subsequent page: for this tutorial we'll assume it's 192.168.1.1.
  1. If Books.app has not been completely uncompressed (it's named Books.app.tar or Books.app.tar.gz), double-click it to uncompress it.
  1. Open a Terminal window and type: `scp -rp ~/Desktop/Books.app root@192.168.1.1:/Applications/`, using your iPhone's actual IP address, of course.
  1. Enter your password (and you changed it from the default, right?) and Books.app will be copied over.  Reboot your iPhone, and it will appear in the SpringBoard.

# Using Installer.app #
Books.app is now included in the beta Installer.app package manager for the iPhone.  Thanks, guys!  You can now install the Installer with the procedures above, and install Books.app directly from there.  You should still download the copybookdir.sh script for installing books, however.