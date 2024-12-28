#!/data/data/com.termux/files/usr/bin/bash

function log_message {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1"
}
read -p "Вы уверены, что хотите запустить скрипт? (y/n): " confirm

log_message "Пакеты Termux обновляются.."
pkg update -y -qq
pkg upgrade -y -qq
clear

log_message "Пакеты Termux обновлены."

log_message "Начинаю установку OpenSSH.."
read -p "Вы уверены, что хотите установить OpenSSH? (y/n): " confirm

if [[ $confirm == [yY] ]]; then
    pkg install openssh -y -qq
    clear

    if [ $? -eq 0 ]; then
        log_message "Установка OpenSSH завершена успешно."
    else
        log_message "Ошибка при установке OpenSSH."
        exit 1
    fi
else
    log_message "Установка OpenSSH отменена."
    exit 0
fi
