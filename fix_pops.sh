#!/bin/bash

green="\e[0;32m\033[1m"
red="\e[0;31m\033[1m"
yellow="\e[0;33m\033[1m"
reset="\033[0m\e[0m"

if [[ $EUID -ne 0 ]]; then
   echo -e "${red}[!] Error: Este script debe ejecutarse como root (sudo).${reset}"
   exit 1
fi

bar() {
  echo -ne "\r$1 ["
  for ((i=0;i<=$2;i++)); do echo -ne "▓"; done
  for ((i=$2;i<20;i++)); do echo -ne " "; done
  echo -ne "] $(( $2 * 5 ))%"
}

clear
echo -e "${yellow}[+] Analizando el sistema...${reset}\n"
sleep 1

CONFIG_FILE="/etc/modprobe.d/alsa-base.conf"
FIX_LINE="options snd-hda-intel power_save=0 power_save_controller=N"

if [ -f "$CONFIG_FILE" ] && grep -Fq "$FIX_LINE" "$CONFIG_FILE"; then
    echo -e "${green}[i] El fix ya está aplicado en $CONFIG_FILE. No se requiere acción.${reset}\n"
    exit 0
fi

for i in {0..20}; do
  bar "   Aplicando corrección" $i
  sleep 0.05
done
echo -e "\n"

echo "$FIX_LINE" >> "$CONFIG_FILE"

echo -e "${green}[✓] Configuración aplicada con éxito en $CONFIG_FILE${reset}"
echo -e "${yellow}[!] Reinicia para aplicar los cambios o ejecuta: sudo alsa force-reload${reset}\n"
