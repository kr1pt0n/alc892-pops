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
orangeColour="\e[38;5;166m"

bold=$(tput bold)
normal=$(tput sgr0)


clear

#se retira el cursor del mouse y se analiza si se localiza el
#archivo necesario en el directorio de alsa-base.conf.

tput civis

if  [ "$(cat /sys/module/snd_hda_intel/parameters/power_save)" == "0" ]; then



echo -e "\n${redColour}✓ [*] El modo de ahorro de energia del controlador realtek esta deshabilitado\n"

#titulo y version del pequeño script en bash

else
echo -e "${redColour}::::::::::::::::::::::::::::::::::::::::"
echo -e "${redColour}::				      ::"
echo -e "${redColour}::	"Ubuntu Sound Repair v1.1"      ::"	
echo -e "${redColour}::		by kr1pt0n	      ::"	
echo -e "${redColour}::				      ::"	
echo -e "${redColour}::::::::::::::::::::::::::::::::::::::::"



sleep 2

echo -e "\n${blueColour}✘ [*] El modo de ahorro de energia aun se encuentra habilitado\n"

#Detectar el kernel y verificar archivo .config.

echo -e "${turquoiseColour}	*Kernel Detected*\n"
echo "	>> $(uname -r)"
echo ""

sleep 3

echo -e "\n${yellowColour}	✓ [*] El modo de ahorro de energia sera deshabilitado"

sleep 3

echo "options snd-hda-intel probe_mask=1 model=auto power_save=0 power_save_controller=N" >> /etc/modprobe.d/alsa-base.conf

echo -e "\n${purpleColour}	✓ [*] El modo de ahorro de energia y los pops en los sonidos fueron retirados de su sistema."

sleep 3

echo -e "\n${orangeColour}	✓ [*] Reinicie el sistema para establecer las configuraciones de forma permanente.\n\n\n"

sleep 3

echo "		Gracias por usar ®USR"

echo "		by kr1pt0n"

echo -e "		2021\n\n\n\n"

tput cnorm

fi
