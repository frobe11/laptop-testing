blue()  { echo -e "\e[34m$*\e[0m"; }

MAIN_SCRIPT_DIR=$1
mkdir -p "$MAIN_SCRIPT_DIR/../artifacts" 
rm "$MAIN_SCRIPT_DIR/../artifacts/video.mp4" 2>/dev/null

# sox -n -t wav $MAIN_SCRIPT_DIR/tmp/beep.wav synth 1 sine 440                        # Создать короткий бип (1 секунда, 440 Гц)

# aplay $MAIN_SCRIPT_DIR/tmp/beep.wav > /dev/null 2>&1 &                              # Воспроизвести бип через динамики

ffmpeg -f v4l2 -input_format mjpeg -framerate 60 -video_size 1920x1080 -i /dev/video0 -f alsa -i hw:0 -t 10 -c:v libx264 -preset fast -pix_fmt yuv420p -c:a aac -b:a 128k "$MAIN_SCRIPT_DIR/../artifacts/video.mp4" 2>/dev/null

LABEL="CAMERA-MIC-SPEAKER-01"
VERDICT=$(blue "ТРЕБУЕТСЯ ПРОВЕРКА")
DESCRIPTION="проверьте файл $MAIN_SCRIPT_DIR/../artifacts/video.mp4"
bash "$MAIN_SCRIPT_DIR/utils/print-verdict.sh" "$LABEL" "$VERDICT" "$DESCRIPTION"

