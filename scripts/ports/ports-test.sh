red()    { echo -e "\e[31m$*\e[0m"; }
green()  { echo -e "\e[32m$*\e[0m"; }

MAIN_SCRIPT_DIR=$1
RESULT=$(bash $MAIN_SCRIPT_DIR/ports/check-ports.sh)                                  # запускаем первую проверку
LABEL="PORTS-O1 проверка всех портов устройств"
if [ -z "$RESULT" ]; then
    VERDICT=$(green "ТЕСТ ПРОЙДЕН")
    bash $MAIN_SCRIPT_DIR/utils/print-verdict.sh "$LABEL" "$VERDICT"                  # если 0 - проверка прошла успешно
else
    VERDICT=$(red "ТЕСТ НЕ ПРОЙДЕН")
    bash $MAIN_SCRIPT_DIR/utils/print-verdict.sh "$LABEL" "$VERDICT"                  # иначе выводим сообщение об ошибке
fi

RESULT=$(bash $MAIN_SCRIPT_DIR/ports/check-usbs.sh)                                   # запускаем вторую проверку
LABEL="PORTS-O2-USB проверка доступности usb устройств"
if [ -z "$RESULT" ]; then
    VERDICT=$(green "ТЕСТ ПРОЙДЕН")
    bash $MAIN_SCRIPT_DIR/utils/print-verdict.sh "$LABEL" "$VERDICT"                  # если 0 - проверка прошла успешно
else
    VERDICT=$(red "ТЕСТ НЕ ПРОЙДЕН")
    DESCRIPTION="проверьте вставлены ли все флешки?"
    bash $MAIN_SCRIPT_DIR/utils/print-verdict.sh "$LABEL" "$VERDICT" "$DESCRIPTION"   # иначе выводим сообщение об ошибке
fi


RESULT=$(bash $MAIN_SCRIPT_DIR/ports/check-memory-card.sh)                            # запускаем третью проверку
LABEL="PORTS-O3-MemCard проверка доступности карты памяти"
if [ -z "$RESULT" ]; then
    VERDICT=$(green "ТЕСТ ПРОЙДЕН")
    bash $MAIN_SCRIPT_DIR/utils/print-verdict.sh "$LABEL" "$VERDICT"                  # если 0 - проверка прошла успешно
else
    VERDICT=$(red "ТЕСТ НЕ ПРОЙДЕН")
    DESCRIPTION="проверьте вставлена ли карта памяти?"
    bash $MAIN_SCRIPT_DIR/utils/print-verdict.sh "$LABEL" "$VERDICT" "$DESCRIPTION"   # иначе выводим сообщение об ошибке
fi
