# Access Denied! #

Due to several changes between the 1.1.2 and 1.1.3 iPhone firmware (see [Troubleshooting113](Troubleshooting113.md)), EBook files may end up with incorrect access permissions after upgrading the iPhone firmware.

The Permissions Fix installer will attempt to correct ownership and access permissions on all files under /var/mobile/Media/EBooks/.  If you have just upgraded to 1.1.3 or newer, you may need to run [LocationsFix](LocationsFix.md) BEFORE running this fix.

This fix should be safe in all cases.  It sets ownership of all book files to mobile:mobile and sets rights to ug+rwX.  You may need to re-run this fix if (for example) you SCP files to your phone as the root user which may leave files inaccessible to the mobile user.  Running this fix repeatedly will not cause problems.

Note that this installer will always FAIL after it runs.  There's nothing actually installed, so it doesn't make sense to let Installer think that there's something there to be uninstalled.  Just install the package a second time if you need to.

Books' developers cannot conceive of any way this could hurt your phone or delete your books.  That said, Books' developers take no responsibility for what this might do to your phone.  We'll try to help if we can, but if it breaks, you get to keep the pieces.  Please use with caution.

# Doing it the hard way #

If you prefer a more hands-on approach, [Troubleshooting113](Troubleshooting113.md) describes how to make the changes this installer makes manually using the Terminal or SSH.