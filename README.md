# batocera-cookbook
Some simple tooling for batocera to make multi disk/high dpi setups easier

Tested on batocera 38

# update_rom_folders.sh
Takes one argument: the path of a non boot disk you want to put roms on

Result: creates folders for each emulator type in the locaton you specify, and symlinks them from their associated roms folder so that batocera can see them. 

Any rom placed on the extra drive (i.e. in the new folders created by this script under /userdata/roms/CONSOLE_NAME/portal/) will show up in emulationstation as normal, but be loaded from your second drive

Typical use:

Open terminal (F1 then go to applications on the left sidebar and then open "xterm")

get drive name:
```
ls -al /media
```

output:
```
drwxr-xr-x 1 root 197609 0 Dec 11 12:53 DRIVE_NAME
```

Run script:
```
./update_rom_folders.sh /media/DRIVE_NAME
```

No output expected, but a folder called portal will be created for every emulator which is where you should put any roms that are meant to go on the second drive.
