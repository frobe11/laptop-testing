#!/bin/bash
blue()  { echo -e "\e[34m$*\e[0m"; }


MAIN_SCRIPT_DIR=$1
mkdir -p $MAIN_SCRIPT_DIR/tmp
sox -n -t wav $MAIN_SCRIPT_DIR/tmp/beep.wav synth 1 sine 440                        # Создать короткий бип (1 секунда, 440 Гц)

aplay $MAIN_SCRIPT_DIR/tmp/beep.wav > /dev/null 2>&1 &                              # Воспроизвести бип через динамики

mkdir -p $MAIN_SCRIPT_DIR/../artifacts

arecord -d 2 -f S16_LE $MAIN_SCRIPT_DIR/../artifacts/recording.wav > /dev/null 2>&1 # Записать звук с микрофона (1 секунды)

LABEL="SPEAKER-MICROPHONE-01"
VERDICT=$(blue "ТРЕБУЕТСЯ ПРОВЕРКА")
DESCRIPTION="проверьте файл $MAIN_SCRIPT_DIR/../artifacts/recording.wav"
bash $MAIN_SCRIPT_DIR/utils/print-verdict.sh "$LABEL" "$VERDICT" "$DESCRIPTION"