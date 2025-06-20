BT_DEVS=$(hcitool dev | tail -n+2)
if [ -z "$BT_DEVS" ]; then
    echo 0
else
    exit 0
fi