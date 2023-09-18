# Hello World en arm64

Este pequeño programa imprime por pantalla __Hello World__ usando ensamblador para __arm64__.

## Compilar
Usando el archivo __Makefile__, el siguiente comando creará el ejecutable con nombre __main.elf__.
```Terminal
make
```
Se compila y enlaza con la herramienta `make` usando GNU Assembler (`as`) y GNU Linker (`ld`), respectivamente. 
El __Makefile__ esta preparado para ejecutarse en una máquina __arm64__, en mi caso lo he hecho todo en una _Raspberry PI 3 B_. 

## Compilación Cruzada
No obstante, si se desea realizar una compilación cruzada ( desde `Linux x86_64`, por ejemplo ) se debe modificar el Makefile de manera que ahora se use una Toolchain adecuada. Particularmente he escogido la `aarch64-linux-gnu-*`. Las sección de constantes deben pasar de esto:
```Makefile
AS = as
LD = ld
#AS = aarch64-linux-gnu-as
#LD = aarch64-linux-gnu-ld
ASFLAGS = -mlittle-endian
```
a esto:
```Makefile
#AS = as
#LD = ld
AS = aarch64-linux-gnu-as
LD = aarch64-linux-gnu-ld
ASFLAGS = -mlittle-endian
```
Entonces podremos usar `make` para compilar y enlazar el programa. Por supuesto no se puede usar la Toolchain si no la tenemos instalada. Para eso ejecutamos:
```bash
sudo apt install gcc make gcc-aarch64-linux-gnu binutils-aarch64-linux-gnu
```

## Ejecutar
Para ejecutar el programa puede usar la regla __run__ incluida en el __Makefile__ de esta forma:
```Terminal
make run
```
o ejectutarlo directamente con:
```Terminal
./main.elf
```
__NOTA__: El programa ha sido diseñado para ejecutarse en un procesador arm64 o aarch64, por lo que no se podrá ejecutar en ninguna otra arquitectura.
A pesar de eso si es posible compilar y crear el ejectuable en otra arquitectura que no sea ARM, pero en ese caso se deberá usar una Toolchain apropiada.

## Entorno usado para la ejecución
Como he dicho antes, este proyecto estaba pensado para hacerlo en una _Raspberry PI 3 B_. En consecuencia he adaptado el código ensamblador al tipo de procesador usado por la placa.
Concretamente he puesto dos directivas relacionadas con la CPU: `.cpu cortex-a53` y `.arch armv8-a`. Estas directivas pueden causar conflictos segun el procesador ARM donde se ejecute.
***
