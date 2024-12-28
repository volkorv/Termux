#!/data/data/com.termux/files/usr/bin/bash

function log_message {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1"
}

log_message "Пакеты Termux обновляются.."
pkg update -y -qq
pkg upgrade -y -qq
clear
log_message "Пакеты Termux обновляются.."

log_message "Начинаю установку OpenSSH.."
pkg install openssh -y -qq
clear
log_message "Пакеты Termux обновляются.."
log_message "Начинаю установку OpenSSH.."

if [ $? -eq 0 ]; then
    log_message "Установка OpenSSH завершена успешно."
else
    log_message "Ошибка при установке OpenSSH."
    exit 1
fi
