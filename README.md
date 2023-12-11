# batocera-cookbook
Some simple tooling for batocera to make multi disk/high dpi setups easier

Tested on batocera 38

# flatpack ports
These .sh files can be used to run some flatpak apps \(must already be installed via flatpak in F1 > applications > flatpak.....\) from the emulation station menu when they normally wouldn't work \(i.e. electron apps\)

To use move these into /userdata/roms/ports

Chrome and freetube are included, but any other electron flatpak app could in theory be run using an almost identical file.

This is usually not a super safe thing to do, so use at own risk etc. and for the love of all that is holy do not do this with discord or other apps which you would want to log into.

# ports
Other files to add emulation station launch options, currently just the terminal \(launching via this script can help with terminal readability on 4k screens due to using different font scaling, this will not affect the terminal launched via the file browser\)

Adjust the "-fs 10" portion of the terminal.sh file to change the font size, or any other xterm option

Again move into /userdata/roms/ports to use

# settings.ini
Move this file to /userdata/system/.config/gtk-2.0/settings.ini to boost font size in the file browser, this can help if the default batocera solution of changing the dpi in batocera.conf is not working. This does nothing to the actual dpi scaling, so some words may be cut off. Adjust the number in the file if you prefer larger or smaller text.

# update_rom_folders.sh
Takes one argument: the path of a non boot disk you want to put roms on

Result: creates folders for each emulator type in the locaton you specify, and symlinks them from their associated roms folder so that batocera can see them. 

Any rom placed on the extra drive \(i.e. in the new folders created by this script under /userdata/roms/CONSOLE_NAME/portal/\) will show up in emulationstation as normal, but be loaded from your second drive

Typical use:

Open terminal \(F1 then go to applications on the left sidebar and then open "xterm"\)

get drive name:
```
ls -al /media
```

output:
```
drwxr-xr-x 1 root 197609 0 Dec 11 12:53 DRIVE_NAME
```
If you don't see any drives listed here you may need to format the drive, or reboot batocera. For non usb media the drive name might be something obtuse, such as NO_LABEL, SAB004, or the name of a controller if you are using an external ssd adapter. This is fine and will not cause any problems for batocera.

Run script:
```
./update_rom_folders.sh /media/DRIVE_NAME
```

No output expected, but a folder called portal will be created for every emulator which is where you should put any roms that are meant to go on the second drive.
