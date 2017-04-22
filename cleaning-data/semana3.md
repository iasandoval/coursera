## Contenido - Semana 3
[Regresar a Notas](notes.md#semana-3)

### Subsetting and Sorting

Subsettting by specific column
```Rscript
x[,1]

x[,"var1"]
```

Subsettting row and columns
```Rscript
# First 2 rows and second column
x[1:2, "var2"]
```

Operadores lógicos and y or
```Rscript
# Rows where var1 <=3 and var3 > 11
x[(X$var1 <=3 & x$var3 > 11),]

# Rows where var1 <=3 or var3 > 15
x[(X$var1 <=3 | x$var3 > 15),]
```

Dealing with missing values
```Rscript
# Where var2 > 8 withouts NA
x[which(x$var2 > 8),]
```

Sorting
```Rscript
# Order asc
sort(x$var1)

# Order desc
sort(x$var1, decreasing=TRUE)

# Order asc, colocando los NA al final
sort(x$var2, na.last=TRUE)
```

Ordering
```Rscript
# Order by column
x[order(x$var1),]

# order by multiple variables
x[order(x$var1, x$var3),]
```

Ordering with plyr package
```Rscript
library(plyr)

# Order by column
arrange(x, var1)

# Decreasing order
arrange(x, desc(var1))
```

Adding rowd and columns
```Rscript
x$var4 <- rnorm(5)

# Bind to the last column on the right
Y <- cbind(X, rnom(5))

# Bind rows at the end of the data frame
Y <- rbind(X, rnom(5))

# Bind rows at the top of the data frame
Y <- rbind(rnom(5), X)
```


### Summarizing Data

Descargar archivo
```Rscript
fileUrl = "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
dest = "semana3/restauranst.csv"
download.file(fileUrl, destfile=dest, method="wininet", mode = "wb")
restData = read.csv(dest)
```

Look at a bit of the data
```Rscript
# Ver los primeros 6 registros
head(restData)

# Ver los primeros 3 registros
head(restData, n=3)

# Ver los últimos 6 registros
tail(restData)

# Ver los últimos 3 registros
tail(restData, n=3)
```

Summary
```Rscript
# Cuenta los valores repetidos (texto), mínimo, máximo, mean...
summary(restData)
```

Saber los tipos de datos
```Rscript
# Muestra por una columna por linea
str(restData)
```

Quantiles of quantitative variables
```Rscript
# Para que es esto???
quantile(restData$councilDistrict, na.rm=TRUE)

quantile(restData$councilDistrict, probs=c(0.5, 0.75, 0.9))
```

Hacer una tabla
```Rscript
# Hace una tabla de la columna zipcode
table(restData$zipCode, useNA ="ifany")

# Hace una tabla de las columnas councilDistrict y ZipCode
table(restData$councilDistrict, restData$zipCode)
```

Check for missing values
```Rscript
# Cuenta los valores NA en la columna councilDistrict
sum(is.na(restData$councilDistrict))

# TRUE si encuentra NA, FALSE si no
any(is.na(restData$councilDistrict))

# Valida si todos los valores cumplen con la condición
all(restData$zipCode > 0)
```

Row and Column sums
```Rscript
# Cuenta todos los valores NA
colSums(is.na(restData))

# TRUE si no hay NA en todas las columnas
all(colSums(is.na(restData)) == 0)
```

Values with specific characteristics
```Rscript
# Cuenta los zipCodes que se encuentren en zipCodes
table(restData$zipCode %in% c("21212", "21213"))

# Subset de los restaurantes en los zipCodes
restData[restData$zipCode %in% c("21212", "21213")]
```

Cross tabs
```Rscript
# Load Data fro R datasets
data(UCBAdmissions)
DF = as.data.frame(UCBAdmissions)
summary(DF)

# Identificar la relación que existe en el dataset
xt = xtabs(Freq ~ Fender + Admit, data=DF)

# Muestra la frecuencia de los admitted y los rejected por Gender
xt
```

Flat tables
```Rscript
warpbreaks$replicate = rep(1:9, len = 54)
xt = xtabs(breaks ~., data=warpbreaks)
xt

# Este esta mejor
ftable(xt)
```

Size of a data set
```Rscript
# Da el tamaño en bytes
object.size(restData)

# Da el tamaño en la medida que quieras (MB)
print(object.size(restData), units="Mb")
```


### Creating New Variables

Common variables to create
- Missingness indicators
- "Cutting up" quantitative variables
- Applying transforms


Creating sequences, para indexar
```Rscript
# Baltimore restaurants Data set
restData

# Tres formas de crear secuencias
s1 = seq(1, 10, by = 2)

s2 = seq(1,10, length = 3)

x = c(1,3,8,25,100)
seq(along = x)
```

Subsetting variables
```Rscript
# Subset de restaurantes en Roland Park o Homeland
restData$nearME = restData$neighborhod %in% c("Roland Park", "Homeland")
table(restData$nearME)
```

Creating binary variables
```Rscript
# Si el zipCode es menor que zero, TRUE
restData$zipWrong = ifelse(restData$zipCode < 0, TRUE, FALSE)

# Cuenta cuales zipCodesWrong son TRUE y FALSE
table(restData$zipCodeWrong, restData$zipCode < 0)
```

Creating categorical variables
```Rscript
# Crea un grupo de zipCodes por el quantile
restData$zipGroups = cut(restData$zipCode, breaks=quantile(restData$zipCode))

table(restData$zipGroups)

table(restData$zipGroups, restData$zipCode)
```

Easier cutting
```Rscript
library(Hmisc)
# Este esá mejor
restData$zipGroups = cut2(restData$zipCode, g=4)

table(restData$zipGroups)
```

Creating factor variables
```Rscript

restData$zcf = factor(restData$zipCode)
restData$zcf[1:10]

class(restData$zcf)
```

Using the mutate function
```Rscript
library(Hmisc)
library(plyr)

# Create new data frame with the old data frame and the new variable
resData2 = mutate(restData, zipGroups = cut2(zipCode, g=4))

table(restData2$zipGroups)
```

Commons tranforms
- abs(x) absolute value
- sqrt(x) square root
- ceiling(x)
```Rscript
ceiling(3.475)
## 4
```
- floor(x)
```Rscript
floor(3.475)
## 3
```
- round(x, digits=n)
```Rscript
round(3.475, digits=2)
## 3.48
```
- signif(x, digits=n)
```Rscript
signif(3.475, digits=2)
## 3.5
```
- cos(x), sin(x), etc.
- log(x) natural logarithm
- log2(x), log10(x) otrher common logs
- exp(x) exponentiating x


### Resharping Data

The goal of tidy data
- Each variable forms a column
- Each observation forms a row
- Each table/file stores data about one kind of observation (Ex. Pelole/Hospitals)

Melting data frames
```Rscript
library(reshape2)
head(mtcars)

mtcars$carname = rownames(mtcars)
carMelt = melt(mtcars, id=c("carname", "gear", "cyl"), measure.vars=c("mpg", "hp))

head(carMelt, n=3)

tail(carMelt, n=3)

```

```Rscript
```

### Managing Data FRames with dplyr - Introduction



### Managing Data FRames with dplyr - Basic Tools



### Merging Data





[Regresar a Notas](notes.md#semana-3)
