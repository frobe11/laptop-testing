amixer -c 0 set 'Internal Mic Boost' 0 >/dev/null 2>/dev/null # important settings for microphone
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BENCHMARK_DURATION=600 # duration of cpu benchmark in seconds
echo $SCRIPT_DIR
bash $SCRIPT_DIR/disk/disk-test.sh "$SCRIPT_DIR"
bash $SCRIPT_DIR/ports/ports-test.sh "$SCRIPT_DIR"
bash $SCRIPT_DIR/wifi/wifi-test.sh "$SCRIPT_DIR"
bash $SCRIPT_DIR/camera/camera-test.sh "$SCRIPT_DIR" 
bash $SCRIPT_DIR/bluetooth/bluetooth-test.sh "$SCRIPT_DIR" 
bash $SCRIPT_DIR/cpu/cpu-stress-test-bench.sh "$BENCHMARK_DURATION"

vlc --intf dummy --loop $SCRIPT_DIR/../artifacts/video.mp4 2>/dev/null # запуск видео после завершения теста