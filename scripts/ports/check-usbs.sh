red()    { echo -e "\e[31m$*\e[0m"; }
green()  { echo -e "\e[32m$*\e[0m"; }

USB_PORTS=3
USB_COUNT=$(lsblk -S | tail -n+2 | wc -l)

if [ "$USB_COUNT" -ne $USB_PORTS ]; then
    echo 1
else
    exit 0
fi
