# Use with caution! #

Due to several changes between the 1.1.2 and 1.1.3 iPhone firmware (see [Troubleshooting113](Troubleshooting113.md)), EBook files may end up in the wrong place after upgrading the iPhone firmware or to the new version of Books.

The Location Fix installer will attempt to move books over to the new location, but may overwrite books if you have files in both the old and the new location.  Please use with caution and ensure that you have backup copies of all of the books on your device before applying this fix.

Note that this installer will always FAIL after it runs.  There's nothing actually installed, so it doesn't make sense to let Installer think that there's something there to be uninstalled.

Books developers take no responsibility for what this might do to your phone.  We'll try to help if we can, but if it breaks, you get to keep the pieces.  Please use with caution.

# Doing it the hard way #

If you prefer a more hands-on approach, [Troubleshooting113](Troubleshooting113.md) describes how to make the changes this installer makes manually using the Terminal or SSH.  Moving books manually is probably the safest way to go.