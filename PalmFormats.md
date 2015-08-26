# Introduction #

As of Books 1.1, support for some PalmOS .pdb files is present.  Unfortunately numerous incompatible formats all share the same .pdb file extension used by ALL Palm data files, even non-ebooks.  This page contains information about the known formats, and data about the encoding used, and support status in Books.app.

This list started from formats listed here: http://www.handebooks.com/formats/palmformats.html

Books.app attempts to open all .pdb files, but then checks for a signature string in the file which indicates the file's type.  If an unsupported format is detected, an error message mentioning "unknown PDB magic" will be displayed when the book is opened.  If any magic strings are found that aren't listed below, please add them to this page along with as much information as possible about the program that created the file.

## Known Palm PDB Document Formats ##

  * TEXtREAd - Standard PalmDOC -- supported in 1.1
  * TEXtTlDc - Tealdoc - Same encoding as PalmDoc, with some extra HTML-like tags for bookmarks and such
  * (Note that anything starting with TEXt is currently treated as PalmDOC)
  * DataPlkr - Plucker (http://www.plkr.org/) -- partial support in 1.1 - no links or graphics yet
  * ToGoToGo  & SDocSilX- iSilo (http://www.isilo.com/) -- closed source format, no docs available
  * PNRdPPrs - PalmReader/PeanutPress/eReader (http://www.ereader.com/) -- closed source format, usually with DRM, no docs available
  * MobiPock - Mobi Pocker
  * ToRaTRPW - Tome Rader

I don't currently have any documents encoded in Mobi, Teal, or TomeRader format, but if anyone does and could send them to my pendorbound ~at~ gmail, I'd appreciate it.  I think at least one of those is really PalmDOC with minor if any modifications.  If that's the case, a small change to the format detection code would allow them to be opened.

## Known Palm PDB Magic for NON-Document Formats ##

Any signatures known to not be documents will be moved here.  Remember all Palm data files share the same .pdb file extension, so the vast majority of PDB files in the wild probably aren't book files at all but data for other Palm applications.