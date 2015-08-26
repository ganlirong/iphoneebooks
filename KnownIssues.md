# Introduction #

I am aware of the following problems with Books.app.  If you have a new issue, **please do not leave it in the comments to this page--submit it via the Issues tab above!**  Or, even better, [check out the source code](http://code.google.com/p/iphoneebooks/source) and try working on it yourself--that's what open source is all about!


# Known Issues #

  * HTML links do not work.  This is due to the undelying UITextView functionality, and I cannot do anything about it yet.
  * Avoid periods in your folder names, for instance _[Grantville Gazette, Vol. 1](http://www.webscription.net/p-180-grantville-gazette-volume-i.aspx)._  The built-in Mac OS methods for recognizing file extensions will think the file extension in this case is ". 1", and the folder will not display in the file browser.  I'm working on a workaround.
  * Certain text encodings do not display non-ASCII character ranges properly.  If you find special characters are garbled, or not showing up at all, you'll need to override the default text encoding via the Preferences pane.
  * HTML files with "width" within their <div> tags may display incorrectly.  Sometimes changing the text size helps.<br>
<ul><li>Opening large files, especially plain text, takes a long time.  Sometimes, in fact, it takes so long that if you're launching from the SpringBoard (the main iPhone view, with all the apps, etc.), the iPhone thinks Books.app has crashed, and automatically goes back to the SpringBoard.  If this happens, you will need to remove the Books.app preferences file, so that the program does not automatically open the file on launch.  See RemovingPreferencesFile.  It is strongly recommended that you break up long books into individual chapters.<br>
</li><li>Text file conversion to HTML is currently very primitive, with double newlines converted to paragraphs but no attempts to infer non-standard paragraphs, such as verse, tables, etc.  This is actually by design, as it is recommended that you do your txt->HTML conversion on your computer rather than letting Books.app do it.  Future versions may have an option to do "smart" conversion, but this will still be only "smarter" in the sense that a cow is "smarter" than a housefly.<br>
</li><li>Changing text size when in the middle of a chapter/file may screw up your scroll point.  I am working on a solution to this problem, but I don't know whether it will truly solve it, or even if this problem is solvable given the state of the iPhone SDK.