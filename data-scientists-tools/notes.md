## Instalación

- Install [R](https://cran.r-project.org/)
- Install [RStudio](https://www.rstudio.com/products/rstudio/download/)
- Install [RTools](https://cran.r-project.org/bin/windows/Rtools/) - Windows Only
	* **Don't forget to select the checkbox for Windows PATH!!**

After RTools installations, **install devtools R package** in RStudio.

## Semana 1

- Ver [Funciones Semana 1](semana1.md).

## Semana 2

## Funciones utilizadas
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
### Loop functions
* lapply
* apply
* mapply
* tapply
* split

### Debugging Tools

## Semana 3 Quiz / Assignments
Take a look at the 'iris' dataset that comes with R. The data can be loaded with the code:
```Rscript
library(datasets)
data(iris)
```

There will be an object called 'iris' in your workspace. In this dataset, what is the mean of 'Sepal.Length' for the species virginica?
```Rscript
sapply(split(iris$Sepal.Length, iris$Species), mean)
## setosa versicolor  virginica
##  5.006      5.936      6.588

round(mean(iris[which(iris$Species == "virginica"),]$Sepal.Length))
## [1] 7
```

Continuing with the 'iris' dataset from the previous Question, what R code returns a vector of the means of the variables 'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'?
```Rscript
apply(iris[, 1:4], 2, mean)
## Sepal.Length  Sepal.Width Petal.Length  Petal.Width
##     5.843333     3.057333     3.758000     1.199333
```

Load the 'mtcars' dataset in R with the following code
```Rscript
library(datasets)
data(mtcars)
```

How can one calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)? Select all that apply.
```Rscript
sapply(split(mtcars$mpg, mtcars$cyl), mean)
with(mtcars, tapply(mpg, cyl, mean))
tapply(mtcars$mpg, mtcars$cyl, mean)
## 4        6        8
## 26.66364 19.74286 15.10000
```

Continuing with the 'mtcars' dataset from the previous Question, what is the absolute difference between the average horsepower of 4-cylinder cars and the average horsepower of 8-cylinder cars?
```Rscript
new <- tapply(mtcars$hp, mtcars$cyl, mean)
round(abs(new[3]-new[1]))
##   8
## 127
```

If you run
```Rscript
debug(ls)
```
What happens when you next call the ‘ls’ function?

Execution of ‘ls’ will suspend at the beginning of the function and you will be in the browser.

## Semana 4

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
