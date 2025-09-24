# ALC892-POPS (UBUNTU 20.04-21.04-24.04)
[![N|Solid](https://www.solvetic.com/uploads/tutorials/monthly_04_2020/0e09654e6e73e9d8fffae22c88d99877.png)](https://www.youtube.com/channel/UC78GA53wBavEM5bCq-ddOVA/videos)
Solucion al problema de pops de Ubuntu 20.04 en tarjetas realtek ALC892.En este caso he logrado rastrear al culpable de los "saltos" y "pops",se trata de la rutina de ahorro de energía del controlador de sonido snd_hda_intel, el cual parecería intentar apagar y reencender las salidas de audio, con el molesto resultado que se describio anteriormente.
Si no has tocado ninguna configuracion de los archivos de alsa-base.conf y power_save, obvia esto y ejecuta el script sin problemas.

*Asegurate de ejecutarlo como usuario root

     ./rtk892.sh

*Troubleshooting*

Si estuviste manoseando el código antes de lanzar el script, sigue estos pasos:

PASO #1
Comprueba si el ahorro de energía del controlador está activado (culpable de los molestos POPs):

     cat /sys/module/snd_hda_intel/parameters/power_save


Si devuelve 1 → está activado (malo).

Si devuelve 0 → ya está desactivado (bien).

Si está en 1, puedes apagarlo temporalmente con:

     echo 0 | sudo tee /sys/module/snd_hda_intel/parameters/power_save


PASO #2
Verifica si ya existe la configuración en el archivo alsa-base.conf:

     grep -c 'options snd-hda-intel power_save=0 power_save_controller=N' /etc/modprobe.d/alsa-base.conf


Si devuelve 1 → ya está aplicado.

Si devuelve 0 → no está, ejecuta el script para parchearlo.
