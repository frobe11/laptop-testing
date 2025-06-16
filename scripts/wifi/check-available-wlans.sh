AVAILABLE_WLANS=$(nmcli dev wifi | tail -n+2)

if [ -z "$AVAILABLE_WLANS" ]; then
    echo "1"  # если не видит сети - выводим любую строчку
else
    exit 0  # если видит - возвращаем код 0 
fi
