function log_message {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1"
}
log_message "Пакеты Termux обновляются.."
pkg update -y -qq;pkg upgrade -y -qq
log_message "Начинаю установку OpenSSH.."
pkg install openssh -y -qq

if [ $? -eq 0 ]; then
    log_message "Установка OpenSSH завершена успешно."
else
    log_message "Ошибка при установке OpenSSH."
    exit 1
fi
