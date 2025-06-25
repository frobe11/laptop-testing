#!/bin/bash

# Время теста в секундах
DURATION=$1

# Имя файла для логов температур
LOGFILE="/tmp/cpu_temp.log"

# Очистка лога
> "$LOGFILE"

CORE_COUNT=$(nproc)
# Запуск нагрузки в фоне
stress-ng --cpu $CORE_COUNT --timeout ${DURATION}s >/dev/null &

# Получаем PID процесса stress-ng
STRESS_PID=$!

# Мониторим температуру пока работает stress-ng
while kill -0 $STRESS_PID 2>/dev/null; do
    TEMP=$(sensors | grep -i "Core" | awk '{sum += $3} END {print sum/1}' | tr -d '+°C') # TEMP=$(sensors | grep -i "Tctl" | awk '{sum += $2} END {print sum/1}' | tr -d '+°C') 
    # Если валидно распарсили температуры - записываем в лог
    if [[ $TEMP =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
        echo "$TEMP" >> "$LOGFILE"
    fi
    sleep 1
done

# Вычисляем среднюю температуру
TOTAL_TEMP=0
COUNT=0
MAX_TEMP=0
while read -r line; do
    TEMP=$(echo "$line")
    if [[ $TEMP -gt $MAX_TEMP ]]; then
        MAX_TEMP=$TEMP
    fi
    TOTAL_TEMP=$(echo "$TOTAL_TEMP + $TEMP" | bc -l)
    COUNT=$((COUNT + 1))
done < "$LOGFILE"

AVERAGE_TEMP=$(echo "scale=0; $TOTAL_TEMP / $COUNT" | bc -l)
AVERAGE_TEMP=$(echo "scale=0; $AVERAGE_TEMP / $CORE_COUNT" | bc -l)
MAX_TEMP=$(echo "scale=0; $MAX_TEMP / $CORE_COUNT" | bc -l)
# Вывод результата (запишивать в общий лог. подумать над оформлением )
echo "----------------------------------------"
echo "Средняя температура CPU за $DURATION секунд: $AVERAGE_TEMP°C"
echo "Максимальная температура CPU за $DURATION секунд: $MAX_TEMP°C"
echo "----------------------------------------"
