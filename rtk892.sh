#!/bin/bash
# ALC892 POPS FIXER - chill edition by kr1pt0n

green="\e[0;32m\033[1m"
red="\e[0;31m\033[1m"
reset="\033[0m\e[0m"

bar() {
  echo -ne "\r$1 ["
  for ((i=0;i<=$2;i++)); do echo -ne "▓"; done
  for ((i=$2;i<20;i++)); do echo -ne " "; done
  echo -ne "] $(( $2 * 5 ))%"
}

clear
echo -e "${red}\n[+] Eliminando los POPS del ALC892...${reset}\n"
sleep 1

for i in {0..20}; do
  bar "   Instalando fix" $i
  sleep 0.1
done
echo -e "\n"

# fix real
echo "options snd-hda-intel power_save=0 power_save_controller=N" \
  >> /etc/modprobe.d/alsa-base.conf

echo -e "\n${green}[✓] Configuración aplicada con éxito${reset}"
echo -e "${green}[!] Reinicia tu sistema para que los cambios tengan efecto.${reset}\n"
