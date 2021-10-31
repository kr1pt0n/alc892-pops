# ALC892-POPS (UBUNTU 20.04)
[![N|Solid](https://www.solvetic.com/uploads/tutorials/monthly_04_2020/0e09654e6e73e9d8fffae22c88d99877.png)](https://www.youtube.com/channel/UC78GA53wBavEM5bCq-ddOVA/videos)
Solucion al problema de pops de Ubuntu 20.04 en tarjetas realtek ALC892.En este caso he logrado rastrear al culpable de los "saltos" y "pops",se trata de la rutina de ahorro de energía del controlador de sonido snd_hda_intel, el cual parecería intentar apagar y reencender las salidas de audio, con el molesto resultado que se describio anteriormente.
Si no has tocado ninguna configuracion de los archivos de alsa-base.conf y power_save, obvia esto y ejecuta el script sin problemas.

*Asegurate de ejecutarlo como usuario root

     ./rtk892.sh

NOTA:

Si estuviste toqueteando el codigo ,antes de ejecutar el script  sigue estos pasos.

PASO #1


*Asegurate de que al realizar la sgt consulta , recibas como resultado el valor de 1 de lo contrario el script te dira que ya esta deshabilitado el modo de ahorro de energia del controlador (lo que provocan los molestos POPs en bocinas y auriculares)

     cat /sys/module/snd_hda_intel/parameters/power_save
 

*Si te devuelve el valor de 0, puedes cambiarlo ejecutando este comando

     sed -i 's/0/1/g' /sys/module/snd_hda_intel/parameters/power_save

PASO #2


*Ejecutar el sgt comando que buscara en el archivo de alsa-base, alguna coincidencia con el texto buscado, de modo que si encuentra alguna coincidencia te devolvera el valor = 1 , si no encuentra ninguna coincidencia devolvera el valor = 0

     grep -c 'options snd-hda-intel probe_mask=1 model=auto power_save=0 power_save_controller=N' /etc/modprobe.d/alsa-base.conf



