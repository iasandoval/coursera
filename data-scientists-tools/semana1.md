## Comandos Básicos - Semana 1

Find a package:
```
find.package("devtools")
```

Install packages:
```
install.packages("devtools")
```

Verify RTools installation:
```
library(devtools) // Load devtools
find_rtools() // Should return TRUE
```

Get Current Work Directory:
```
getWD()
```

Set Current Work Directory:
```
setWD("dir")
```

Leer un archivo CSV
```
x <- read.csv("hw1_data.csv")
```

Obtener el nombre de las columnas
```
colnames(x)
```

Obtener las primeras 2 filas
```
head(x,2)
```

Obtener las últimas 2 filas
```
tail(x,2)
```

Obtener la fila 47
```
x[47,]
```

Obtener el valor de Ozone de la fila 47
```
x$Ozone[47]
```

Suma de valores vacíos en la columna Ozone
```
sum(is.na(x$Ozone))
```

La media de la columna Ozone, excluyendo los NA
```
mean(x$Ozone, na.rm = TRUE)
```

Subset donde Ozone > 31 y Temp > 90 y Obtener la Media de Solar.R
```
sub <- subset(x, Ozone > 31 & Temp > 90)
mean(sub$Solar.R, na.rm = TRUE)
```

La media de la columna Temp, cuando Month es igual a 6
```
mean(subset(x, Month == 6)$Temp)
```

Valor máximo de la columna Ozone en el mes de Mayo
```
max(subset(q, Month == 5)$Ozone, na.rm = TRUE)
```

Secuencia de Números
```
## Vector del 1 al 10
1:10
## Vector del 1 al 20
seq(1,20)
## Incrementa de 2 en 2
seq(1,10, by=2)
## Secuencia de 30 números entre 5 y 10
my_seq <- seq(5, 10, length=30)
## Confirmar la longitud de la secuencia
length(my_seq)
## Repetir 0, 40 veces
rep(0, times=40)
## Repetir el vector (0,1,2), 10 veces
rep(c(0,1,2), times=10)
## Repetir el vector (0,1,2), 10 veces cada uno
rep(c(0,1,2), each=10)
```

Vectores
```
## Crea un vector
num_vect <- c(0.5, 55, -10, 6)
## Determina cuales numeros son menor a 1
tf <- num_vect < 1
## [1]  TRUE FALSE  TRUE FALSE
## Concatenar
my_char <- c("My", "name", "is")
paste(my_char, collapse = " ")
## [1] "My name is"
## Juntar 2 palabras
paste("Hello", "world!", sep = " ")
```

Missing Values
```
## Identifica cuales elementos son NA (TRUE o FALSE)
my_na <- is.na(my_data)
## Regresa los valores NA
my_data == NA
## Cuenta los valores NA
sum(my_na)
```

Subsetting Vectors
```
## Primeros 10 elementos de un vector
x[1:10]

## What do you think x[is.na(x)] will give you? 
## A vector of all NAs

## Crear vector sin NA
y <- x[!is.na(x)]

## What do you think y[y > 0] will give you?
## A vector of all the positive elements of y

## Crear vector sin NA y donde los valores sean mayor a 0
x[!is.na(x) & x > 0]

## En R el index inicia en 1

## Crea vector con los valores en el indice 3, 5 y 7
x[c(3, 5, 7)]

## En R no existe el IndexOutOfBound

## Todos los elementos excepto por el 2 y 10
x[c(-2, -10)]
x[-c(2, 10)]
## Crear vector con Named values
vect <- c(foo = 11, bar = 2, norf = NA)
## Muestra los nombres del vector
names(vect)
## Agregar los nombres a un vector existente
vect2 <- c(11, 2, NA)
names(vect2) <- c("foo", "bar", "norf")
## Comparar vectores identicos
identical(vect, vect2)
## Second element of vect
vect["bar"]
## Obtener los elementos de foo y bar
vect[c("foo", "bar")]
```

Matrices y Data Frames
```
## Dimensiones de un vector
my_vector <- 1:20
dim(my_vector)
## NULL
## Un Vector no tiene dimensiones

## The dim() function allows you to get OR set the `dim` attribute for an R object
dim(my_vector) <- c(4,5)

dim(my_vector) 
## [1] 4 5
## Ver los atributos de una matriz
attributes(my_vector)
## Confirmar el tipo de objeto
class(my_vector)
## [1] "matrix"
## Crear una matriz con los valores del 1 al 20, de 4 filas y 5 columnas
my_matrix2 <- matrix( data = 1:20, nrow=4, ncol=5)
## Combinar columnas
patients <- c("Bill", "Gina", "Kelly", "Sean")
cbind(patients, my_matrix)
## Crea un data frame
my_data <- data.frame(patients, my_matrix)
## Crea los nombres de las columnas
cnames <- c("patient", "age", "weight", "bp", "rating", "test")
colnames(my_data) <- cnames
```