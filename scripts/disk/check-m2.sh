
M2_DISKS=$(lsblk -N | tail -n+2)
if [ -z "$M2_DISKS" ]; then
    echo 0
else
    exit 0
fi