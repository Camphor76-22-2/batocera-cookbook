romfolders=$(ls -al /userdata/roms | grep -v "\." | grep -v "total" | awk '{print $9}')
mkdir -p $1/batocera_roms
for f in $romfolders; do
 echo $f
 mkdir -p $1/batocera_roms/$f
 medianame=$(echo "$1" | sed 's/.*\///')
 mkdir -p /userdata/roms/$f/portal/
 ln -s $1/batocera_roms/$f /userdata/roms/$f/portal/$medianame
 echo "Linked /userdata/roms/$f/portal/$medianame to $1/batocera_roms/$f"
done
