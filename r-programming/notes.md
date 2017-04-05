# Notas del Curso de "R Programming"

## Instalación

- Install [R](https://cran.r-project.org/)
- Install [RStudio](https://www.rstudio.com/products/rstudio/download/)
- Install [RTools](https://cran.r-project.org/bin/windows/Rtools/) - Windows Only
	* **Don't forget to select the checkbox for Windows PATH!!**

After RTools installations, **install devtools R package** in RStudio.

## Semana 1

- Ver [Funciones Semana 1](semana1.md).

## Semana 2

### Funciones utilizadas
- Ver [Funciones Semana 2](semana2.md).

### Estructuras de Control
- Ver [Estructuras de control](semana2-loops.md).

### Funciones

1. Crear Archivo .R
2. Escribir la función
3. Cargar la función

```Rscript
# Carga una función
source("funcion.R")
```

### Dates and Times
* Las fechas son represendatas por la clase Date
* La hora es representado por las clases POSIXct o POSIXlt
* El formato de fecha es YYYY-MM-DD

```Rscript
x <- as.Date("2017-01-01")

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
```Rscript
?strptime
```

## Semana 2 Assignments
- Ver [Assignments de la Semana 2](semana2-assignments.md).


## Semana 3

### Funciones utilizadas
- Ver [Funciones Semana 3](semana3.md).

### Loop functions
* lapply
* apply
* mapply
* tapply
* split

### Semana 3 Quiz
- Ver [Quiz de la Semana 3](semana3-quiz.md).

### Programming Assignment
- Ver [Assignment Semana 3](https://github.com/iasandoval/ProgrammingAssignment2).

## Semana 4

### Funciones utilizadas
- Ver [Funciones Semana 4](semana4.md).

La función "srt" despliega de forma compacta el contenido de un objeto
```Rscript
str(x)
```

### Generating Random Numbers
rnorm: Generate random Normal variables with a given mean and standard deviation.
dnorm: Evaluate the normal probability density (with a given mean/SD) at a point (or vector or points).
pnorm: Evaluate the cumulative distribution function for a Normal distribution.
rpois: Generate random Poisson variates with a given rate.

Clear console RStudio ctrl + L

Alwast set random number the seed
```Rscript
set.seed(1)
```

### Simulating Linear Model

### Random sampling
```Rscript
set.seed(1)
sample(1:10, 4)

# Sample letters
sample(letters, 5)

# Permutation
sample(1:10)

# Sample with replacement
sample(1:10, replace = TRUE)
```

### Programming Assignment
- Ver [best.R](semana4/best.R).
- Ver [rankall.R](semana4/rankall.R).
- Ver [rankhospital.R](semana4/rankhospital.R).