romfolders=$(ls -al /userdata/roms | grep -v "\." | grep -v "total" | awk '{print $9}')
for f in $romfolders; do
 echo $f
 mkdir -p "$1/$f"
 ln -s $1/$f /userdata/roms/$f/portal
done
