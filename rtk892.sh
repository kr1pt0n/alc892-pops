#!/bin/bash
#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

if  [ "$(cat /sys/module/snd_hda_intel/parameters/power_save)" == "0" ]; then

echo -e "\n${redColour}[*]El modo de ahorro de energia del controlador realtek esta deshabilitado\n"

else

echo -e "\n${grayColour}[*]El modo de ahorro de energia aun habilitado\n"

sleep 3

clear

echo -e "\n${blueColour}[*]El modo de ahorro de energia sera deshabilitado\n"

sleep 3

clear

sed -i 's/1/0/g' /home/kr1pt0n/solucion/power_save

echo "options snd-hda-intel probe_mask=1 model=auto power_save=0 power_save_controller=N" >> /etc/modprobe.d/alsa-base.conf

echo -e "\n${turquoiseColour}[*]El modo de ahorro de energia y los pops en los sonidos fueron retirados de su sistema.\n"

fi
