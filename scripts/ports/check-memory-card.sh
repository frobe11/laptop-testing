red()    { echo -e "\e[31m$*\e[0m"; }
green()  { echo -e "\e[32m$*\e[0m"; }

MEMORY_CARDS=$(lsblk -ndo NAME,TYPE,TRAN | grep mmc)

if [ -z "$MEMORY_CARDS" ]; then
    echo 1
else
    exit 0
fi
