SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo $SCRIPT_DIR
bash $SCRIPT_DIR/disk/disk-test.sh "$SCRIPT_DIR"
bash $SCRIPT_DIR/ports/ports-test.sh "$SCRIPT_DIR"
bash $SCRIPT_DIR/wifi/wifi-test.sh "$SCRIPT_DIR"
bash $SCRIPT_DIR/camera/camera-test.sh "$SCRIPT_DIR" 
bash $SCRIPT_DIR/bluetooth/bluetooth-test.sh "$SCRIPT_DIR" 
bash $SCRIPT_DIR/cpu/cpu-stress-test-bench.sh "$SCRIPT_DIR"

vlc --intf dummy --loop /home/ubuntu/laptop-testing/artifacts/video.mp4 # запуск видео после завершения теста