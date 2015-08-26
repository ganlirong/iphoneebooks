## 1.5-[r523](https://code.google.com/p/iphoneebooks/source/detail?r=523) 13-May-2008 ##
  * Massive increase in leaving and re-entering Books.  App appears to stay resident now.  Not sure if this is good in the long run, but it's a LOT faster.
  * Book view was displayed mostly off screen on initial load ([Issue #138](https://code.google.com/p/iphoneebooks/issues/detail?id=#138))
  * Status bar was displayed in wrong place after resume in portrait mode.
  * Book loading progress bar wasn't visible if current book was scrolled past the first page.

## 1.5-[r518](https://code.google.com/p/iphoneebooks/source/detail?r=518) 11-May-2008 ##
  * Fixed remaining rotation issues for dialogs
  * Fixed rotate-lock setting not being restored on start ([Issue #136](https://code.google.com/p/iphoneebooks/issues/detail?id=#136))
  * Optimized shutdown routines to speed shutdown

## 1.5-[r513](https://code.google.com/p/iphoneebooks/source/detail?r=513) 10-May-2008 ##
  * Fix issue with off-screen error dialog on initial launch if file permissions were wrong. ([Issue #128](https://code.google.com/p/iphoneebooks/issues/detail?id=#128))
  * Removed most HTMLFixer hacks - it's faster and works with larger books, but you need to fix your own HTML. ([Issue #133](https://code.google.com/p/iphoneebooks/issues/detail?id=#133))
  * Simplified crash recovery procedure to only discard last read book setting without dialog.

## 1.4-[r469](https://code.google.com/p/iphoneebooks/source/detail?r=469) ##
  * First official 1.1.2+ release through Ste's repository

## 1.4-pre02 17-Feb-2008 ##
  * Add missing image files for toolbars
  * Package as TBZ instead of ZIP - more likely to keep +x bit in place.

## 1.4-pre01 16-Feb-2008 ##
  * Several changes contributed by benoitcerrina, including:
  * Landscape mode with view rotate (#81)
  * Double-display of preferences window fixed (#77)
  * Support for 1.1.3 firmware improved (#92, #94, #96)

## 1.3.7 15-Oct-2007 ##
  * Moved encoding system over to txt2pdbdoc.  Palm DOC files now respond to encoding preferences.  Plucker unknown.

## Older revisions archived to CHANGELOG.old ##