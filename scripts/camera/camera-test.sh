blue()  { echo -e "\e[34m$*\e[0m"; }

MAIN_SCRIPT_DIR=$1
fswebcam -r 1280x720 --no-banner $MAIN_SCRIPT_DIR/../artifacts/camera.jpg > /dev/null 2>&1

LABEL="CAMERA-01"
VERDICT=$(blue "ТРЕБУЕТСЯ ПРОВЕРКА")
DESCRIPTION="проверьте файл $MAIN_SCRIPT_DIR/../artifacts/camera.jpg"
bash $MAIN_SCRIPT_DIR/utils/print-verdict.sh "$LABEL" "$VERDICT" "$DESCRIPTION"