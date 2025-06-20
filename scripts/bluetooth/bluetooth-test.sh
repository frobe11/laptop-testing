red()    { echo -e "\e[31m$*\e[0m"; }
green()  { echo -e "\e[32m$*\e[0m"; }

MAIN_SCRIPT_DIR=$1
RESULT=$(bash $MAIN_SCRIPT_DIR/bluetooth/check-bluetooth-devices.sh)                                  # запускаем первую проверку
LABEL="BT-O1 проверка доступных Bluetooth устройств"
if [ -z "$RESULT" ]; then
    VERDICT=$(green "ТЕСТ ПРОЙДЕН")
    bash $MAIN_SCRIPT_DIR/utils/print-verdict.sh "$LABEL" "$VERDICT"                  # если 0 - проверка прошла успешно
else
    VERDICT=$(red "ТЕСТ НЕ ПРОЙДЕН")
    bash $MAIN_SCRIPT_DIR/utils/print-verdict.sh "$LABEL" "$VERDICT"                  # иначе выводим сообщение об ошибке
fi