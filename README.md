# ALC892 Pops Fixer 🎧
![N|Solid](https://www.solvetic.com/uploads/tutorials/monthly_04_2020/0e09654e6e73e9d8fffae22c88d99877.png)


Este script de Bash soluciona el molesto problema de los chasquidos o "pops" de audio en chipsets **Realtek ALC892** (y otros controladores `snd-hda-intel`) en sistemas Linux.

El problema ocurre generalmente debido a las funciones de ahorro de energía del driver, que apagan el controlador de sonido tras unos segundos de inactividad, generando un ruido eléctrico al reactivarse.

## Características
- **Validación de Root:** Verifica que tengas permisos de administrador.
- **Prevención de Duplicados:** Comprueba si el fix ya existe para no ensuciar tus archivos de configuración.
- **Instalación Segura:** Crea el archivo de configuración si no existe o añade la línea al final si ya hay otros parámetros.
- **Feedback Visual:** Incluye una barra de progreso y mensajes claros con colores.

## Instalación y Uso

1. **Clona o descarga el script:**
   Guarda el código en un archivo llamado `fix_pops.sh`.

2. **Dale permisos de ejecución:**
   ```bash
   chmod +x fix_pops.sh
   ```

3. **Ejecuta el script con sudo:**
   ```bash
   sudo ./fix_pops.sh
   ```

## ¿Qué es lo que hace exactamente?
El script añade la siguiente configuración a `/etc/modprobe.d/alsa-base.conf`:

```conf
options snd-hda-intel power_save=0 power_save_controller=N
```

- `power_save=0`: Desactiva el tiempo de espera para el apagado del códec.
- `power_save_controller=N`: Desactiva el ahorro de energía del controlador por completo.

## Cómo aplicar los cambios
Para que los cambios surtan efecto, puedes:
*   Reiniciar tu computadora (recomendado).
*   O forzar la recarga de ALSA: `sudo alsa force-reload`.

---
**Nota:** En laptops, esto podría aumentar ligeramente el consumo de batería, aunque la diferencia suele ser imperceptible.
