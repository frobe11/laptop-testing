red()    { echo -e "\e[31m$*\e[0m"; }
green()  { echo -e "\e[32m$*\e[0m"; }

MAIN_SCRIPT_DIR=$1

RESULT=$(bash $MAIN_SCRIPT_DIR/wifi/check-wifi-device.sh)                             # запускаем первую проверку
LABEL="WIFI-O1 проверка наличия wifi устройств"``
if [ -z "$RESULT" ]; then
    VERDICT=$(green "ТЕСТ ПРОЙДЕН")
    bash $MAIN_SCRIPT_DIR/utils/print-verdict.sh "$LABEL" "$VERDICT"                  # если 0 - проверка прошла успешно
else
    VERDICT=$(red "ТЕСТ НЕ ПРОЙДЕН")
    DESCRIPTION="Не удалось найти ни одного wifi устройства"  
    bash $MAIN_SCRIPT_DIR/utils/print-verdict.sh "$LABEL" "$VERDICT" "$DESCRIPTION"   # иначе выводим сообщение об ошибке
fi

RESULT=$(bash $MAIN_SCRIPT_DIR/wifi/check-available-wlans.sh)                         # запускаем вторую проверку
LABEL="WIFI-O2 проверка наличия доступных сетей"
if [ -z "$RESULT" ]; then
    VERDICT=$(green "ТЕСТ ПРОЙДЕН")
    bash $MAIN_SCRIPT_DIR/utils/print-verdict.sh "$LABEL" "$VERDICT"                  # если 0 - проверка прошла успешно
else
    VERDICT=$(red "ТЕСТ НЕ ПРОЙДЕН")
    DESCRIPTION="Не удалось найти ни одной доступной wifi сети"  
    bash $MAIN_SCRIPT_DIR/utils/print-verdict.sh "$LABEL" "$VERDICT" "$DESCRIPTION"   # иначе выводим сообщение об ошибке
fi

