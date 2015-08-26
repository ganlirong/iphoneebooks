# Introduction #

This section is where I'm posting my thought process.  It may or may not be of interest to anyone.

### how to figure out how many characters/page? ###

The following formula gives a decent approximation of how many characters are rendered on the portrait screen:

265000 / (font size<sup>2</sup>)

For instance, with 20 point text this yields 662 characters.  How can I use this to determine which page we're on?

Well, if via the scroll-point (determined by pixels, not text) I discover we've scrolled three pages down, then I only have to render (3 `*` 662) = 1986 characters when the user loads the page, and do the rest in the "background."  Loading in the background is still a synchronous process, but at least the user would be able to read the page they're on.

Of course, if a user wants to come back to a page which is mostly read, it would still take a long time to render the text regardless.

OK, this is implemented.

### On viewing and displaying images ###

UITextView doesn't seem to display images.  Bastards!  At the moment, in the current SVN, we can display image files from the browser view (still no zooming or scrolling).  What I'd really like is to display a small thumbnail of an in-line image, and if one taps it, that will open the image in a new view.

But there is no way to accurately determine where the image button should be placed!  You can't currently determine the size of the rendered text--all the NSString-DrawingAdditions cause segfaults.  Bad Apple!

So the best we can hope for might be a button for each image at the top of the screen, with the word "Image" appearing where the in-line images lie.  Maybe use the alt text, if it exists?

There are libraries for parsing HTML, of course.  Perhaps I need to invest in learning them.

### More! ###

UITextView DOES display images!  It just needs full image tags (i.e. ![file:///localhost/path/to/image/goes/here.jpg](file:///localhost/path/to/image/goes/here.jpg)) to make it work.

### On the internal UIWebView found in the UITextView ###

Access it like so: `[textView _webView]`.

This allows some neat tricks, like:

  * `[[textView _webView] setUserStyleSheetLocation:path]` to implement a style sheet for the text
  * `[[textView _webView] frame]` to get the full bounds of the rendered text

We can hope that this method won't disappear if Apple opens up the API.