![http://www.iphonebookshelf.com/Icon96.png](http://www.iphonebookshelf.com/Icon96.png)

## Availabile Now on the AppStore: ##

BookShelf v1.0 - In order to reduce confusion with the OpenSource version, my rewrite of Books has been renamed to BookShelf, and it's available now for $9.99 on the AppStore.  I hope you'll agree that the small fee is a worthy price for the improvements in BookShelf.  The full list of features and improvements is available on http://www.iphonebookshelf.com, but to name a few:

  * BookShelf loads huge files in seconds.  I've tested up to 7.6MB with no problems.
  * Support for FB2 (FictionBook) files, including images.  Also, images in Plucker files.
  * Much improved performance - opening a multi-megabyte file for the first time takes 5-6 seconds.  Subsequent opens are faster once the file is indexed.

BookShelf has taken several months of hard development work.  I hope you'll give it a try!

-Zachary Bedell

(_Not to be confused with Zach Brewster-Geisz, the original author of Books.app who has my sincere thanks for creating Books, and also for tolerating my shameless plug of BookShelf here._)

(_And for the record, having two guys named Zachary on one project?  Yeah, that's confusing...._)


---


# What is Books? #

Books.app is a simple eBook reader for the iPhone.  It reads HTML and text files stored in your ~/Media/EBooks folder, and is smart enough to enter subdirectories, if for instance, you've broken a book down by chapters.

# First time using Books.app? #
You'll want to learn:
  * How to [install it](Installation.md) (grab it from Installer!)
  * How to [get eBooks onto your phone](InstallingEBooks.md) (SCP or iPhuck)
  * Visit KnownIssues or [Books Tech Support](http://groups.google.com/group/iphone-ebooks-support) if you have a problem
  * Visit [TODO](TODO.md) to find out what's coming next

# Getting Help #

If you have problems using Books, **especially** after upgrading your iPhone or iPod firmware version, please visit the [Books Tech Support](http://groups.google.com/group/iphone-ebooks-support) Google group.  Please only post issues in the Issue tab if you have a genuine reproducible bug.

## Screenshots ##

| **Reading** | **File browser** |
|:------------|:-----------------|
| ![http://iphoneebooks.googlecode.com/svn/www/images/reading_sm.png](http://iphoneebooks.googlecode.com/svn/www/images/reading_sm.png) | ![http://iphoneebooks.googlecode.com/svn/www/images/fileList_sm.png](http://iphoneebooks.googlecode.com/svn/www/images/fileList_sm.png) |

(More shots below)

## Future ##

Eventually, this project will include a simple method of syncing eBooks to your iPhone.  At the moment, that's handled by iPHUC and a shell script called **copybookdir.sh**.  As of v. 0.4.2, this script is a separate [download](http://code.google.com/p/iphoneebooks/downloads/list).

## Getting Content ##

Books.app is recommended for use with [Project Gutenberg](http://www.gutenberg.org/) texts, in conjunction with [GutenMark](http://www.sandroid.org/GutenMark/index.html), a fantastic PG markup tool by Ronald Burkey, which makes pretty HTML out of Gutenberg .txt files, and splits them by chapter using a second tool.  I have, for the hell of it, included a copy of _Tarzan of the Apes_ by Edgar Rice Burroughs, which you can download [here](http://iphoneebooks.googlecode.com/files/TarzanOfTheApes.zip) and expand into your Media/EBooks directory on your iPhone, so you can easily judge the reading experience.  Unlike the earlier copy of _The Adventures of Sherlock Holmes_ (which is still available in the Downloads section), this directory and its files will work with copybookdir.sh.

Another option is [manybooks.net](http://manybooks.net), where you can download HTML-ized Gutenberg and other Creative-Commons licensed texts.  The site's maintainer has created a preset for download that will work well with Books.app (thanks, Matt!).  Select a book and choose the "iPhone Books.app" option.

## Thanks! ##

Books.app stands on the shoulders of giants, most notably [iphonenes](http://iphonenes.googlecode.com), [mobileterminal](http://mobileterminal.googlecode.com), and [Erica Sadun's first "word processor."](http://www.tuaw.com/2007/08/03/journeys-inside-the-iphones-sdk/)

Books.app was created by Zach Brewster-Geisz who can be reached at zach AT brewstergeisz (dot) cjb DOT net.  Primary coders include Zach Brewster-Geisz, Chris Born, Zachary Bedell, and BCC, with contributions from Stephan White and suggestions from all over the Webernets.  If you have patches or feature suggestions, please send them to the [Books Tech Support](http://groups.google.com/group/iphone-ebooks-support) Google group.  Bug fixes are quite welcome and will be committed to SVN with our sincere thanks!

Books.app is not at all related to the [book organization software of the same name](http://books.aetherial.net/wordpress/), which I didn't even know existed until recently!

## More Screen Shots ##

| **Preferences** | ![http://iphoneebooks.googlecode.com/svn/www/images/prefs1_sm.png](http://iphoneebooks.googlecode.com/svn/www/images/prefs1_sm.png) | ![http://iphoneebooks.googlecode.com/svn/www/images/prefs2_sm.png](http://iphoneebooks.googlecode.com/svn/www/images/prefs2_sm.png) | ![http://iphoneebooks.googlecode.com/svn/www/images/prefs3_sm.png](http://iphoneebooks.googlecode.com/svn/www/images/prefs3_sm.png) |
|:----------------|:------------------------------------------------------------------------------------------------------------------------------------|:------------------------------------------------------------------------------------------------------------------------------------|:------------------------------------------------------------------------------------------------------------------------------------|
| **Toolbar**     | ![http://iphoneebooks.googlecode.com/svn/www/images/toolbar_sm.png](http://iphoneebooks.googlecode.com/svn/www/images/toolbar_sm.png) |                                                                                                                                     |                                                                                                                                     |
| **Dark view**   | ![http://iphoneebooks.googlecode.com/svn/www/images/dark_sm.png](http://iphoneebooks.googlecode.com/svn/www/images/dark_sm.png)     |                                                                                                                                     |                                                                                                                                     |