## INSTALLATION PROCESS

- Install [R](https://cran.r-project.org/)
- Install [RStudio](https://www.rstudio.com/products/rstudio/download/)
- Install [RTools](https://cran.r-project.org/bin/windows/Rtools/) - Windows Only 
	* **Don't forget to select the checkbox for Windows PATH!!**

After RTools installations, **install devtools R package** in RStudio.

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













