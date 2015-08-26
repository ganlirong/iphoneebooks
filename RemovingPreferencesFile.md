# Introduction #

In certain circumstances, you may want to reset Books.app--if, for instance, it does not open properly from the main iPhone menu.

# WARNING! #

Be extremely careful when typing!  You are accessing your iPhone as the superuser and deleting things in places where you shouldn't usually be!  Don't come to me if you accidentally break it!

## Using mobileterminal ##

If you have installed [MobileTerminal](http://mobileterminal.googlecode.com/) on your iPhone, you can remove the preferences file directly without a Wi-Fi or USB connection.

  1. Open Terminal on your iPhone.
  1. Type: `cd Library/Preferences`.
  1. Type: `ls` to list the conents of the Preferences directory.  You should see a file called `com.zacharybrewstergeisz.books.plist`.
  1. To remove this file, type `rm com.zacharybrewstergeisz.books.plist`.
  1. Quit Terminal and you're done.

## Using ssh ##

If you don't have mobileterminal installed, you should log into your phone from your computer using SSH.  You must be connected to Wi-Fi.  These instructions apply to Mac OS X.

  1. Open Terminal.app on your Mac.
  1. On your iPhone, go to Settings -> Wi-Fi, then click on the blue disclosure triangle next to your selected network.
  1. In the subsequent screen, note your **IP Address**.  For this tutorial, we'll call it 192.168.1.1.
  1. In Terminal.app, type `ssh root@192.168.1.1`, substituting your iPhone's actual IP address.
  1. Enter your root password when prompted.
  1. Once logged in, type: `cd Library/Preferences`.
  1. Type: `ls` to list the conents of the Preferences directory.  You should see a file called `com.zacharybrewstergeisz.books.plist`.
  1. To remove this file, type `rm com.zacharybrewstergeisz.books.plist`.
  1. Type: `logout`.  You're done.

## Using iPHUC ##

If you're not connected to a Wi-Fi network, you'll need to access your phone via the USB cable and iPHUC.  This tutorial assumes you've jailbroken your phone in the proper way, following the instructions on the iPhone Dev Wiki.

  1. Connect your iPhone to your computer via USB.  iTunes will start and then sync your phone.  Let it do so, then quit iTunes.
  1. Open Terminal.app on your computer, then launch iPHUC.
  1. In iPHUC, type: `setafc com.apple.afc2`.  If you get an error message here, your phone was probably not jailbroken properly, and this tutorial won't help you.
  1. Type: `ls`.  If you see "Applications," "Library," etc. then you're in the right place and can continue.
  1. Type: `cd /var/root/Library/Preferences`.
  1. Type `ls` again to make sure you're in the right place; you should see `com.zacharybrewstergeisz.books.plist` toward the bottom of the list.
  1. Type: `rmdir com.zacharybrewstergeisz.books.plist`.  You will see what looks like an error message,  but in fact the file was deleted successfully.
  1. Type `exit` to quit iPHUC and you're done.