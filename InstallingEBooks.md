# Important! #
Books.app looks for files in an EBooks directory, within the mobile user's Media directory.  If you don't put the books there (whether they're individual files, or chapters within a directory), Books.app will not see them.  Whatever tool you're using to copy books over (and there are many, apparently), be sure you've created the EBooks folder before you begin.

Also, make sure your extensions are correct.  Books.app can only read .txt, .htm, or .html files.

## Easiest way: use copybookdir.sh ##

There is now available, [in the downloads section](http://iphoneebooks.googlecode.com/files/copybookdir.sh), a bash shell-script which will copy a directory containing an eBook to your iPhone.  It has some major limitations:
  * _**It only copies one level of directories**_; it does not drill down into subdirectories.
  * _**It copies everything it sees**_ (except invisible files), even if it's not a text or HTML file.

Download the script (from the svn trunk/scripts directory, or the Featured link on the front page) and place it somewhere in your path. Do _not_ install it to your iPhone.  You still need iPHUC installed, but after you've done that, just do the following:
  1. Plug in your iPhone.
  1. Open a Terminal window (/Applications/Utilities/Terminal.app on your Mac).
  1. Change to the directory where you saved copybookdir.sh.  (Type, for instance, `cd Desktop` if it was saved to the Desktop.)
  1. Type ` ./copybookdir.sh /path/to/directory ` where /path/to/directory is the directory where your chapter files are stored.  Copybookdir.sh will create the EBooks directory (if needed) as well as the directory for the book, and then copy the files in the directory to the iPhone.

Versions prior to Books.app 0.3 required you to type in the full pathname when invoking the script.  This has been fixed.  Versions prior to Books.app 0.9 did not allow folders or files with spaces in the name.  This was fixed by Aaron Davies.

## Another easy way: use Cyberduck ##
Happy Books.app user Stephen writes:

"Love it! I used to read books on my Handspring Visor Edge, then a Palm, but when I got a Palm Treo the screen was just too small, so I really like this. I had no luck installing books with the first two choices above, then after looking at the third my brother and I came up with the easiest way yet! Some steps will be the same, and you don't need to jailbreak the phone!  _Not **entirely** true--if you have the Installer.app installed, your phone is already jailbreaked (jailbroken?) even if the Installer did it itself. -- Zach_

  1. Use the Installer to install SSH
  1. Find out your iPhone's IP address: Settings -> Wi-Fi, then click the blue arrow to the right of your checked network. The IP address will be listed on the next screen. Mine is 10.0.1.4 and my wife's is 10.0.1.5 .
  1. Go to [MacUpdate.com](http://www.macupdate.com/info.php/id/8392/cyberduck) and download the latest version of CyberDuck. Install as directed and launch.
  1. Click "Open Connection," the top right button in the window.
  1. In the "Protocol" drop-down select "SFTP." Leave the port field as 22.
  1. In the "Server" field enter your iPhone's IP address.
  1. In the "Username" field enter "mobile" and "alpine" in the password field (unless you changed the password of course). _WHICH YOU SHOULD! -- Zach_
  1. Bookmark the connection: Click the "Bookmarks" button, then the "+" sign at the bottom of the bookmarks tab that just slid out.

This logs you into the mobile user folder. Now you you can make the "EBooks" folder in the Media folder and simply drag books and book folders from the Finder! You can also drag things out for a quick back up before upgrading to the next firmware."

## Less easy way: copy books using iPHUC ##

  1. Get and install [iPHUC](http://iphuc.googlecode.com/).
  1. Plug in your iPhone to your computer.  If iTunes opens, let your phone sync and then quit iTunes.
  1. Run iPHUC from the command-line (Terminal.app on a Mac).
  1. Type: ` ls ` to see your Media directory.  If you haven't already created an EBooks folder, type ` mkdir EBooks `.
  1. Type: ` cd EBooks  ` to put yourself into the EBooks directory.
  1. Assuming you have a text file in your home directory, you can copy it to the EBooks folder by typing ` putfile /Users/yourusername/some_book.txt some_book.txt ` where "yourusername" is your user name.  Note that, at least at this point, iPHUC requires the full path to the file you're copying.
  1. If you want a prettier name on the Books.app file browser, you could type ` putfile /Users/yourusername/some_book.txt Some\ Book,\ by\ Jane\ Author `.  Note you need to escape all spaces with backslashes.
  1. If you have a directory which contains a book broken up into chapters, you need to create a new directory and copy over each file separately.  Alternately, you can use copybookdir.sh, above, or scp, below.

## Copy books using scp ##

To do this, you must first have enabled SSH on your phone, or it won't work at all, and you must be connected to a Wi-Fi network.

  1. Find out your iPhone's IP address: Settings -> WiFi, then click the blue arrow to the right of your checked network.  The IP address will be listed on the next screen.  For the example we'll call it 192.168.1.1.
  1. Make sure you don't let your iPhone sleep in the next few steps!
  1. If you have one file, you can type: ` scp /path/to/file.html mobile@192.168.1.1:/var/mobile/Media/EBooks ` (assuming you've already created the EBooks directory)
  1. If you have more than one file in a local directory, for instance a book broken into chapters, you can type ` scp -r /path/to/directory mobile@192.168.1.1:/var/mobile/Media/EBooks `
  1. Enter your password and the book will be copied over!

# Making your eBooks look nicer #

Text files straight from [Project Gutenberg](http://www.gutenberg.org) have a couple of problems for our purposes.  First of all, they're very long, which makes it difficult to jump to a certain chapter, and second of all, they kinda look really ugly on the iPhone's screen.

Fortunately, there are several ways to fix this.  One of the easiest is to simply download the HTML version of a given text, if it's available.  For instance, [Wuthering Heights](http://www.gutenberg.org/etext/768) has a fine HTML version.  This does not solve the problem of long files, though.

Instead, I strongly recommend grabbing a copy of [GutenMark](http://www.sandroid.org/GutenMark) and compiling it on your machine.  You can use GutenMark on a plain text Gutenberg file, and then use the associated utility GutenSplit to split the HTML file into chapters.  It works very well (usually).  See [GutenMark's documentation](http://sandroid.org/GutenMark/usage.html) for details.

I intend to create a customized version of GutenSplit that will create HTML files tailored for the iPhone, and some time after that I will create a Mac OS X application that will both provide a front-end for GutenMark and also install eBooks on the iPhone automatically.

