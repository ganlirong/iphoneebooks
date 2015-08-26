# Introduction #

Ideally, 1.1.4 will be bug free, at least for basic startup/reading functionality.  Below is a list of known issues that need to be fixed before a final release.

# Pending (Critical): #



  * Need to modify style sheets to cleanse problematic elements without destroying all styles.

# Pending (Important, but not show stopping): #

  * When the view is rotated the snapshot should be computed rotated

  * When opening book, the toolbar transitions before the book view transitions into place

  * Imageview dealloc - image view leaks.  Possibly chapter changes leak as well.  GSLog on all object alloc/dealloc and plug it up!

  * Scroll point isn't restored after book is reloaded after encoding change.

  * ~~Prefs button doesn't work when phone is rotated to the right. - Can no longer reproduce~~

# Installer stuff: #

  * ~~Fix up old symlinks in installer - Remove the old Default.png symlink before installing - Nevermind: Uninstall followed by reinstall fixes this~~

# Fixed: #
  * Font settings view doesn't fill screen in landscape mode. -BCC 24 March 2008

  * Text encoding settings view doesn't fill screen in landscape mode. -BCC 24 March 2008

  * New rotate/lock icon - overlay a lock icon to show rotation lock -BCC 23 March 2008 12:22

  * gif image don't show as cover - BCC 23 March 2008 2:30

  * Settings window does not behave correctly when app is rotated- BCC 22-March-2008 23:10

  * Might also want to re-evaluate swipe direction for next/prev chapter.- BCC 22-March-2008 17:10


  * View sliding directions - Particularly when changing chapters, the view transitions don't always go the correct directions. - BCC 22-March-2008 17:10

  * Flash of white bg on invert  -BCC 22-March-2008 16:21

  * Screenshot nav bars - screenshot doesn't include the navigation bars -ZSB 18-Mar-2008 23:30EDT

  * Smaller default.PNG - remove the oversized old book and replace with something much smaller (filesize)  -ZSB 18-Mar-2008 23:30EDT

  * Store rotate orientation - the current rotation isn't saved/restored, only lock status  -ZSB 18-Mar-2008 23:30EDT

  * File browser read indicator - File read indicator doesn't refresh until file browser repaints the row -ZSB 18-Mar-2008 23:30EDT

  * Status bar color change for invert -ZSB 18-Mar-2008 23:30EDT

  * Fix handling of swipe and touch sensitive zone in rotated EBookView -BCC 20-Mar-2008 23:50EDT

  * Don't transition on snapshot startup - If the startup image isn't a book cover, don't transition after load -ZSB 20-Mar-2008 21:55EDT

  * Invert goes black on black for many books - some (many??) books don't redraw text color properly -ZSB 20-Mar-2008 22:51EDT

  * When an image is displayed, cannot get the navbar and toolbar to slide in. Very important as there is no way to get out of this display short of leaving the app and deleting preference -ZSB 20-Mar-2008 23:25EDT

  * Still some text cut-off at bottom - some documents lose the bottom text -ZSB 22-Mar-2008 14:40EDT

  * Fix rotate reflow - text doesn't reflow when changing from landscape to portrait -ZSB 22-Mar-2008 21:05EDT

  * ~~Changing chapters with swipe doesn't update the filename in in the nav bar's back button. - Nevermind: It's not supposed to.  Back is the parent directory.~~

  * Images in html files don't work as they used to in 1.3.7 -ZSB 23-Mar-2008 14:00EDT

  * Fix for image display caused new threading bug - filebrowser remains responsive to clicks while document is loading making it possible to load multiple documents at once. -ZSB 23-Mar-2008 13:55EDT

  * Show HUD sooner - might be possible to pop the HUD in applicationDidFinishLaunching -ZSB 23-Mar-2008 13:55EDT

  * Hide slider before showing file browser - When transitioning from book to browser, the scroll slider doesn't disappear before the transition -ZSB 23-Mar-2008 14:07EDT

  * Fix wacky sorting logic in FileBrowser-numberCompare(id, id, void) -  I think it's the cause of [issue #89](https://code.google.com/p/iphoneebooks/issues/detail?id=#89). -ZSB 23-Mar-2008 15:53EDT

  * Clock is off center at portrait startup until app is rotated. -ZSB 24-Mar-2008 18:48EDT

  * Fix up old book paths in installer - Create a separate installer package which will migrate books over - ideally without needing BSD -ZSB 24-Mar-2008 17:30EDT

  * When rotating while viewing a book, the scroll point isn't restored to the same point in the text. -ZSB 24-Mar-2008 19:10EDT

  * Text encoding preference don't show when clicking the disclosure in prefs window. -ZSB 24-Mar-2008 19:21EDT

  * File isn't reloaded after encoding prefs change. -ZSB 24-Mar-2008 19:51EDT