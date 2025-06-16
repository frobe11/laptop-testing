red()    { echo -e "\e[31m$*\e[0m"; }
green()  { echo -e "\e[32m$*\e[0m"; }

MAIN_SCRIPT_DIR=$1
RESULT=$(bash $MAIN_SCRIPT_DIR/disk/check-m2.sh)                                              # запускаем первую проверку
LABEL="DISK-O1 проверка наличия m2 SSD"
if [ -z "$RESULT" ]; then
    VERDICT=$(green "ТЕСТ ПРОЙДЕН")
    bash $MAIN_SCRIPT_DIR/utils/print-verdict.sh "$LABEL" "$VERDICT"                  # если 0 - проверка прошла успешно
else
    VERDICT=$(red "ТЕСТ НЕ ПРОЙДЕН")
    DESCRIPTION="не удалось найти диск"
    bash $MAIN_SCRIPT_DIR/utils/print-verdict.sh "$LABEL" "$VERDICT" "$DESCRIPTION"   # иначе выводим сообщение об ошибке
fi