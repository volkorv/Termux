function log_message {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1"
}
log_message "Обновляю пакеты Termux.."
log_message "Начинаю установку OpenSSH..."

if apt-get update -qq && apt-get install -y openssh-server -qq; then
    log_message "Установка OpenSSH завершена успешно."
else
    log_message "Ошибка при установке OpenSSH."
    exit 1
fi
