#!/data/data/com.termux/files/usr/bin/bash

function log_message {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1"
}

read -p "Вы уверены, что хотите обновить пакеты Termux? (y/n): " confirm_update

if [[ $confirm_update == [yY] ]]; then
    log_message "Пакеты Termux обновляются.."
    pkg update -y -qq
    pkg upgrade -y -qq
    clear
    log_message "Пакеты Termux обновлены."
else
    log_message "Обновление пакетов отменено, но OpenSSH может работать не совсем правильно."
fi

log_message "Начинаю установку OpenSSH.."
read -p "Вы уверены, что хотите установить OpenSSH? (y/n): " confirm_install

if [[ $confirm_install == [yY] ]]; then
    pkg install openssh -y -qq
    clear

    if [ $? -eq 0 ]; then
        log_message "Установка OpenSSH завершена успешно."
    else
        log_message "Ошибка при установке OpenSSH."
    fi
else
    log_message "Установка OpenSSH отменена."
fi
