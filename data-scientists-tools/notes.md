## Instalación

- Install [R](https://cran.r-project.org/)
- Install [RStudio](https://www.rstudio.com/products/rstudio/download/)
- Install [RTools](https://cran.r-project.org/bin/windows/Rtools/) - Windows Only
	* **Don't forget to select the checkbox for Windows PATH!!**

After RTools installations, **install devtools R package** in RStudio.

## Comandos Básicos - Semana 1

- Ver [Comandos Básicos](semana1.md).

## Semana 2

### Estructuras de Control
- ver [Estructuras de control](semana2-loops.md).

### Funciones

1. Crear Archivo .R
2. Escribir la función
3. Cargar la función
	```
	source("funcion.R")
	```
### Dates and Times
* Las fechas son represendatas por la clase Date
* La hora es representado por las clases POSIXct o POSIXlt
* El formato de fecha es YYYY-MM-DD
```
x <- as.Date("2017-01-01")
```
```
x <- Sys.time()
x
## [1] "2017-03-23 16:26:22 EDT"

p <- as.POSIXlt(x)
names(unclass(p))
## [1] "sec"    "min"    "hour"   "mday"   "mon"   
## [6] "year"   "wday"   "yday"   "isdst"  "zone"  
## [11] "gmtoff"

p$sec
## [1] 22.82708
```
Ayuda sobre Formato de fechas y hora
```
?strptime
```

## Semana 2 Assignments
- Ver las [Actividades de la Semana 2](semana2-assignments.md).
