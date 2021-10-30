# ALC892-POPS
Solucion al problema de pops de Ubuntu 20.04 en tarjetas realtek ALC892.
Si no has tocado ninguna configuracion de los archivos de alsa-base.conf y power_save, obvia esto y ejecuta el script sin problemas.
Pero si estuviste toqueteando el codigo;antes de ejecutar el script  sigue estos pasos.


PASO #1


*Asegurate de que al realizar la sgt consulta , recibas como resultado el valor de 1 de lo contrario el script te dira que ya esta deshabilitado el modo de ahorro de energia del controlador (lo que provocan los molestos POPs en bocinas y auriculares)

  cat /sys/module/snd_hda_intel/parameters/power_save
 

*Si te devuelve el valor de 0, puedes cambiarlo ejecutando este comando

  sed -i 's/0/1/g' /sys/module/snd_hda_intel/parameters/power_save

PASO #2


*Ejecutar el sgt comando que buscara en el archivo de alsa-base, alguna coincidencia con el texto buscado, de modo que si encuentra alguna coincidencia te devolvera el valor = 1 , si no encuentra ninguna coincidencia devolvera el valor = 0

grep -c 'options snd-hda-intel probe_mask=1 model=auto power_save=0 power_save_controller=N' /etc/modprobe.d/alsa-base.conf



