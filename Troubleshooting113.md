# Changes in 1.1.3 #

The change in Apple's user and rights strategy from 1.1.2 to 1.1.3 has caused all manners of problems for many applications, and Books is no exception.  The following steps will help fix permissions problems and get Books working after an upgrade.

# Fixing File Location #

With 1.1.2 and earlier, all user data was stored under /var/root/Media/.  Starting with 1.1.3, all data files were moved to /var/mobile/Media/.  This move occurred because the applications on the phone are now running as the mortal user mobile instead of as root.

Several Books users have reported that upgrading from 1.1.2 to 1.1.3 with iTunes, then jailbreaking with one of the unsigned ramdisk based tools (ZiPhone or Independence) resulted in all Books files being automatically moved as part of the upgrade.  Users who upgraded using the soft upgrade methods may or may not have had the files migrated as part of that process.

If after upgrading to 1.1.3+ Books can no longer find any of your books, you'll need to manually move the files using Terminal or SSH.  Get a shell prompt on your phone through one of those methods, then run the following commands to move over the books:

```
mkdir -p /var/mobile/Media/EBooks
mv /var/root/Media/EBooks/* /var/mobile/Media/EBooks/
rmdir /var/root/Media/EBooks
```


# Fixing Permissions #

Books need to be able to read and write its preferences file as well as all the book files you want to read.  The following commands should ensure Books has the necessary rights:

```
chown -R mobile:mobile /var/mobile/Media/EBooks /var/mobile/Library/Preferences/com.zacharybrewstergeisz.books.plist
chmod -R ug+rwX /var/mobile/Media/EBooks /var/mobile/Library/Preferences/com.zacharybrewstergeisz.books.plist
```

The above commands force ownership of Books related files to the mobile user and ensure that directories can be traversed and that all book files are readable and writable by the mobile user which runs iPhone applications.

# Test Books Again #

At this point, Books should hopefully work.  Please give it a quick test.  If it works, you can stop here.  If not, please post a message to the support mailing list with as much information about your setup as you can.

# Delete Preferences File #

Especially after upgrading from Books 1.3.7, it may be necessary to delete Books' preferences file.  If you see a strange, mostly off-screen blue dialog when Books starts, deleting the preferences file should fix the problem.

To remove Books' preferences file, login to your device using SSH or Terminal and run the following:

```
rm /var/mobile/Library/Preferences/com.zacharybrewstergeisz.books.plist
rm /var/root/Library/Preferences/com.zacharybrewstergeisz.books.plist
```

Log out, then start Books again.