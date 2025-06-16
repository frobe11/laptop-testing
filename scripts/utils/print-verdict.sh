LABEL=$1        # название теста
VERDICT=$2      # результат выполнения теста
DESCRIPTION=$3  # описание, если тест провалился
echo "----------------------------------------"
echo $LABEL
echo - Вердикт: $VERDICT
if [ -n "$DESCRIPTION" ]; then
    echo $DESCRIPTION
fi
echo