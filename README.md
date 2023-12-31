# batocera-cookbook
Some simple tooling for batocera to make multi disk/high dpi setups easier for people who dont want to spend extra time digging

Tested on batocera 38

# update_rom_folders.sh
Takes one argument: the path of a non boot disk you want to put roms on

Result: creates folders for each emulator type in the locaton you specify, and symlinks them from their associated roms folder \(/batocera-roms/\<romfolders\>\)at the root of the non-boot disk so that batocera can see them. 

Any rom placed on the extra drive \(i.e. in the new folders created by this script under /userdata/roms/CONSOLE_NAME/drives/DRIVE_NAME\) will show up in emulationstation as normal, but be loaded from your second/third/etc. drive

Typical use after physically connecting a formatted drive to the system:

Open terminal on the batocera pc\(F1 then go to applications on the left sidebar and then open "xterm"\)

get drive name:
```
ls -al /media
```

output:
```
drwxr-xr-x 1 root 197609 0 Dec 11 12:53 DRIVE_NAME
```
If you don't see any drives listed here you may need to reboot batocera or re-partition/re-format the drive \(especially if you are using a brand new drive\). For non usb media the drive name might be something obtuse, such as NO_LABEL, SAB004, or the name of a controller if you are using an external ssd adapter. This is fine and will not cause any problems for batocera as long as you don't have multiple drives that show up under the same name. 

If you do have multiple drives that show up under the same name \(multiple flash drives of the same type is a good example\) you may want to recreate the partition/filesystem on the drive with a different name. Alternatively just make sure to run the script again every time you switch drives \(i.e. ensure that there are folders on the drives for each roms subfolder so that the symlinks resolve\).

Run script:
```
#Make sure to replace drive name here with your actual drivename from the above command
./update_rom_folders.sh /media/DRIVE_NAME
```

No output expected, but folder/s called drives/DRIVE_NAME will be created for each folder in /userdata/roms. Putting roms in the /userdata/roms/CONSOLE_NAME/drives/DRIVE_NAME folder/s will make them show up as normal in emulationStation, but be loaded and stored on the associated drive

The folder /media/DRIVE_NAME/batocera-roms will be created and have subfolders for every subfolder in the existing /userdata/roms folder

If this script is run for multiple drives additional folders will be created for each that match the DRIVE_NAME e.g 
```
...
/userdata/roms/snes/drives/sbrntUSB
                          /HardDrive01
                          /NVMEDISK
                          /NO_LABEL
/userdata/roms/gamecube/drives/sbrntUSB
                              /HardDrive01
                              /NVMEDISK
                              /NO_LABEL
...
```


Optional:
```
#Create a link from /userdata/ to the new roms folder so it shows up in file manager
#ln -s /media/DRIVE_NAME/batocera-roms /userdata/roms_DRIVE_NAME
#Make sure to replace drive name before running
```

# evmicro.sh
This file is my controller config for playing with dual flight sticks, it merges two VKB EVO \(L and R\)sticks into one "xinput compatible" evdev controller, I use this when playing armored core 6.

Possible changes to this file for other games: add a namespace directive to the input lines, and block hats that are not used. This will cause them to reset to 0 more correctly if the game you are playing doesn't handle that well or you get ghost inputs. 

This should be applicable to any dinput flightstick/throttle, just change the names of the input devices \(ls /dev/input/by-id/ for your device names\) and swap the first item in the map directives for whatever it is on your stick. You can check what buttons are registering by swapping the output statement with a --print and pressing controller buttons


# flatpack ports
These .sh files can be used to run some flatpak apps \(must already be installed via flatpak in F1 > applications > flatpak.....\) from the emulation station menu when they normally wouldn't work \(i.e. electron apps\)

To use move these into /userdata/roms/ports

Chrome and freetube are included, but any other electron flatpak app could in theory be run using an almost identical file.

This is usually not a super safe thing to do, so use at own risk etc. and for the love of all that is holy do not do this with discord or other apps which you would want to log into.

# ports
Other files to add emulation station launch options, currently just the terminal \(launching via this script can help with terminal readability on 4k screens due to using different font scaling, this will not affect the terminal launched via the file browser\)

Adjust the "-fs 10" portion of the terminal.sh file to change the font size

Again move into /userdata/roms/ports to use

# es_systems_romhacks.cfg

This file adds an emulation station menu item for snes romhacks, mostly as an example for how to do this since the batocera wiki is outdated at time of writing.

Place this file in /userdata/system/config/emulationstation/ to install. (You may also need to create the folder /userdata/roms/supermarioworld)



# settings.ini
Move this file to /userdata/system/.config/gtk-2.0/settings.ini to boost font size in the file browser, this can help if the default batocera solution of changing the dpi in batocera.conf is not working. This does nothing to the actual dpi scaling, so some words may be cut off. Adjust the number in the file if you prefer larger or smaller text.


