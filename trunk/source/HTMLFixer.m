// HTMLFixer.m, for Books.app by Zachary Brewster-Geisz
/* Most of this file is now obsolete.  Don't get excited if warnings
 from some of the methods appear on compile.  They're probably unused.
 */

#include "HTMLFixer.h"
#import "AGRegex/AGRegex.h"

/*
 * All of these regex's are thread safe, etc.  Regex patterns should be immutable always.
 * We'll alloc a boat load of them here once and use them whenever they're needed below.
 */

// Image tag fixers
AGRegex *SRC_REGEX;
AGRegex *IMGTAG_REGEX;

// Open table elements
AGRegex *TABLE_REGEX;
AGRegex *TR_REGEX;
AGRegex *TD_REGEX;
AGRegex *TH_REGEX;

// Close table elements
AGRegex *TABLECL_REGEX;
AGRegex *TRCL_REGEX;
AGRegex *TDCL_REGEX;
AGRegex *THCL_REGEX;

// Assorted problematic block elements
AGRegex *STYLE_REGEX;

@implementation HTMLFixer

/**
 * Setup all the regex's we need.
 */
+ (void)initialize {
  // Image tag fixers
  SRC_REGEX = [[AGRegex alloc] initWithPattern:@"src=[\"']([^\\\"]+)[\"']" options:AGRegexCaseInsensitive];
  IMGTAG_REGEX = [[AGRegex alloc] initWithPattern:@"<img[^>]+>" options:AGRegexCaseInsensitive];
  
  // Open table elements
  TABLE_REGEX = [[AGRegex alloc] initWithPattern:@"<table[^>]+>" options:AGRegexCaseInsensitive];
  TR_REGEX = [[AGRegex alloc] initWithPattern:@"<tr[^>]+>" options:AGRegexCaseInsensitive];
  TD_REGEX = [[AGRegex alloc] initWithPattern:@"<td[^>]+>" options:AGRegexCaseInsensitive];
  TH_REGEX = [[AGRegex alloc] initWithPattern:@"<th[^>]+>" options:AGRegexCaseInsensitive];
  
  // Close table elements
  TABLECL_REGEX = [[AGRegex alloc] initWithPattern:@"</table[^>]+>" options:AGRegexCaseInsensitive];
  TRCL_REGEX = [[AGRegex alloc] initWithPattern:@"</tr[^>]+>" options:AGRegexCaseInsensitive];
  TDCL_REGEX = [[AGRegex alloc] initWithPattern:@"</td[^>]+>" options:AGRegexCaseInsensitive];
  THCL_REGEX = [[AGRegex alloc] initWithPattern:@"</th[^>]+>" options:AGRegexCaseInsensitive];
  
  // Assorted problematic block elements
  STYLE_REGEX = [[AGRegex alloc] initWithPattern:@"<(?:style|script|object|embed)[^<]+</(?:style|script|object|embed)>" 
                                                  options:AGRegexCaseInsensitive]; 
}

/**
 * Returns an image tag for which the image has been shrunk to 300 pixels wide.
 * Changes the local file URL to an absolute URL since that's what the UITextView seems to like.
 * Does nothing if the image is already under 300 px wide.
 * Assumes a local URL as the "src" element.
 */
+(NSString *)fixedImageTagForString:(NSString *)aStr basePath:(NSString *)path returnImageHeight:(int *)returnHeight {
  // Build the final image tag from these:
  NSString *srcString = nil;
  unsigned int width = 300;
  unsigned int height = 0;
  
  // Use a regex to find the src attribute.
  AGRegexMatch *srcMatch = [SRC_REGEX findInString:aStr];
  if(srcMatch == nil || [srcMatch count] != 2) {
    // We didn't find a match, or we found MULTIPLE matches.  Just bail...
    return @"";
  } else {
    srcString = [srcMatch groupAtIndex:1];
    if([srcString length] == 0) {
      return @"";
    }
  }
  
  // Clean up the URL a bunch.
  //FIXME:  Should I worry about encodings?
  NSString *noPercentString = [srcString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]; 
  NSString *imgPath = [[path stringByAppendingPathComponent:noPercentString] stringByStandardizingPath];
  NSURL *pathURL = [NSURL fileURLWithPath:imgPath];
  NSString *absoluteURLString = [pathURL absoluteString];
  
  //GSLog(@"absoluteURLString: %@", absoluteURLString);
  
  NSString *finalImgTag;
  
  // Try to read the URL off the filesystem to get its height and width.
  UIImage *img = [UIImage imageAtPath:imgPath];
  if (nil != img) {
    CGImageRef imgRef = [img imageRef];
    height = CGImageGetHeight(imgRef);
    width = CGImageGetWidth(imgRef);
    //GSLog(@"image's width: %d height: %d", width, height);
    if (width <= 300) {
      *returnHeight = (int)height;
    } else {
      float aspectRatio = (float)height / (float)width;
      width = 300;
      height = (unsigned int)(300.0 * aspectRatio);
      *returnHeight = (int)height;
    }
    
    NSString *finalImgTag = [NSString stringWithFormat:@"<img src=\"%@\" height=\"%d\" width=\"%d\"/>", absoluteURLString, height, width];
  } else {
    // If we can't open the image, leave the tag as-is
    // It might be better to expunge the tag -- maybe it's an HTTP URL or something?  Not sure about this....
    finalImgTag = @"";
    *returnHeight = 0;
  }
  
  //GSLog(@"returning str: %@", finalImgTag);
  return finalImgTag;
}

/**
 * Fixes all img tags within a given string.
 *
 * @param theHTML NSMutableString containing HTML to be fixed.  HTML is fixed in place (param is modified)
 * @param thePath path of file (used for calculating base URL for images)
 * @param p_imgOnly YES skips most of the block-level fixing code.  Useful for Plucker or other formats which
 *    were synthesized using simplified HTML which only need image height/width fixing.
 */
+(void)fixHTMLString:(NSMutableString *)theHTML filePath:(NSString *)thePath imageOnly:(BOOL)p_imgOnly {
  int thisImageHeight = 0;
  int height = 0;
  int i;

  NSString *basePath = [thePath stringByDeletingLastPathComponent];
  
  // Regex to find all img tags
  NSArray *imgTagMatches = [IMGTAG_REGEX findAllInString:theHTML];
  int imgCount = [imgTagMatches count];  

  // Loop over all the matches, and replace with the fixed version.
  for(i=0; i<imgCount; i++) {
    thisImageHeight = 0;
    AGRegexMatch *tagMatch = [imgTagMatches objectAtIndex:i];
    NSString *imgTag = [tagMatch group];
    NSString *fixedImgTag = [HTMLFixer fixedImageTagForString:imgTag basePath:basePath returnImageHeight:&thisImageHeight];

    NSRange origRange = [theHTML rangeOfString:imgTag];
    [theHTML replaceCharactersInRange:origRange withString:fixedImgTag];
    height += thisImageHeight;
  }

  //
  // There...  Image tags dealt with...
  //
  
  // If we came from a simplified HTML format (Plucker), we don't need to do most of this stuff.
  if(!p_imgOnly) {
    // Kill any styles or other difficult block elements (do this instead of just the @imports)
    i = [HTMLFixer replaceRegex:STYLE_REGEX withString:@"" inMutableString:theHTML];
    // GSLog(@"Done-Replacing block tags (%d tags)", i);

    // Adjust tables if desired.
    if(![HTMLFixer isRenderTables]) {
      // Use regex's to replace all table related tags with reasonably small-screen equivalents.
      // (Tip o' the hat to the Plucker folks for showing how to do it!)
      i=0;
      i += [HTMLFixer replaceRegex:TABLE_REGEX withString:[HTMLFixer tableStartReplacement] inMutableString:theHTML];
      i += [HTMLFixer replaceRegex:TR_REGEX withString:[HTMLFixer trStartReplacement] inMutableString:theHTML];
      i += [HTMLFixer replaceRegex:TD_REGEX withString:[HTMLFixer tdStartReplacement] inMutableString:theHTML];
      i += [HTMLFixer replaceRegex:TH_REGEX withString:[HTMLFixer thStartReplacement] inMutableString:theHTML];
      
      i += [HTMLFixer replaceRegex:TABLECL_REGEX withString:[HTMLFixer tableEndReplacement] inMutableString:theHTML];
      i += [HTMLFixer replaceRegex:TRCL_REGEX withString:[HTMLFixer trEndReplacement] inMutableString:theHTML];
      i += [HTMLFixer replaceRegex:TDCL_REGEX withString:[HTMLFixer tdEndReplacement] inMutableString:theHTML];
      i += [HTMLFixer replaceRegex:THCL_REGEX withString:[HTMLFixer thEndReplacement] inMutableString:theHTML];
      // GSLog(@"Done-Replacing table tags. (%d tags)", i);
    }
  }  
  
  // Add a DIV object with a set height to make up for the images' height.
  // Is this still necessary under the newer firmwares, or does UIWebView have a clue now?
  if(height > 0) {
    // GSLog(@"Inserting %d of filler height for images.", height);
    [theHTML appendFormat:@"<div style=\"height: %dpx;\">&nbsp;<br/>&nbsp;<br/>&nbsp;<br/><br/>", height];
  }
  
  // Fix for truncated files (usually caused by invalid HTML).
  [theHTML appendString:@"<p>&nbsp;</p><p>&nbsp;</p>"];
}

/**
 * Replace all occurences of a regex with a static string in a mutable string.
 */
+ (int)replaceRegex:(AGRegex*)p_regex withString:(NSString*)p_repl inMutableString:(NSMutableString*)p_mut {
  // Do this in its own pool as the regex will likely alloc a lot of temporary memory.
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
  int i;
  
  // Regex to find everything
  NSArray *matches = [p_regex findAllInString:p_mut];
  int matchCount = [matches count];  
  
  // Loop over all the matches, and replace
  for(i=0; i<matchCount; i++) {
    AGRegexMatch *tagMatch = [matches objectAtIndex:i];
    NSString *sMatch = [tagMatch group];
    NSRange origRange = [p_mut rangeOfString:sMatch];
    [p_mut replaceCharactersInRange:origRange withString:p_repl];
  }
  
  [pool release];
  
  return matchCount;
}

/**
 * Return NO if we need special table handling.
 */
+ (BOOL)isRenderTables {
  return [[BooksDefaultsController sharedBooksDefaultsController] renderTables];
}

+ (NSString*)tableStartReplacement {
  return @"<hr style=\"height: 3px;\"/>";
}

+ (NSString*)tdStartReplacement {
  return @"";
}

+ (NSString*)trStartReplacement {
  return @"";
}

+ (NSString*)thStartReplacement {
  return @"<b>";
}

+ (NSString*)tableEndReplacement {
  return @"<hr style=\"height: 3px;\"/>";
}

+ (NSString*)tdEndReplacement {
  return @"<br/>";
}

+ (NSString*)trEndReplacement {
  return @"<hr style=\"height: 1px;\"/>";
}

+ (NSString*)thEndReplacement {
  return @"</b><br/><br/>";
}

@end