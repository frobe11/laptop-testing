MEMORY_CARDS=$(lsblk -ndo NAME,TYPE,TRAN | grep mmc)

if [ -z "$MEMORY_CARDS" ]; then
    echo 1
else
    exit 0
fi
