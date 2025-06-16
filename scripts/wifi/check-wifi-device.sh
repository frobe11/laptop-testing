WIFI_DEVS=$(nmcli dev | grep wifi)

if [ -z "$WIFI_DEVS" ]; then
    echo "1"  # если не видит wifi устройства - выводим любую строчку
else
    exit 0  # если видит - возвращаем код 0 
fi

