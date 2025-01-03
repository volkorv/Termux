#!/bin/bash

function log_message {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1"
}

log_message "Проверка.."

# Проверка на Termux
if [ -z "$TERMUX_VERSION" ]; then
    clear
    log_message "Этот скрипт только на Termux."
    exit 1
fi

clear
log_message "Termux $TERMUX_VERSION"

read -p "Вы хотите обновить пакеты Termux? (y/n): " confirm_update
if [[ $confirm_update =~ ^[yY]$ ]]; then
    clear
    log_message "Пакеты Termux обновляются.."
    pkg update -y -q && pkg upgrade -y -q
    clear
    log_message "Пакеты Termux обновлены."
else
    clear
    log_message "Обновление пакетов отменено, но OpenSSH может работать не совсем правильно."
fi

log_message "Начинаю установку OpenSSH.."
read -p "Вы уверены, что хотите установить OpenSSH? (y/n): " confirm_install
if [[ $confirm_install =~ ^[yY]$ ]]; then
    clear
    pkg install openssh -y -q
    if [ $? -eq 0 ]; then
        log_message "Установка OpenSSH завершена успешно."
    else
        log_message "Ошибка при установке OpenSSH."
    fi
else
    log_message "Установка OpenSSH отменена."
    exit 1
fi
