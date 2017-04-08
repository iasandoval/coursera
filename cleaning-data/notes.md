# Notas del Curso "Getting and Cleaning Data"

## Semana 1

- Ver [Funciones Semana 1](semana1.md).

### Descarga de archivos

1. Know the work directory
````Rscript
# Directorio actual
getwd()

# Set the directory
setwd([path])
````

2. Checking and creating directories
````Rscript
# Verifica si el archivo/directory existe
file.exist()

# Crea un nuevo directory
dir.create()
````

3. Descarga de archivos
````Rscript
# Descarga un archivo de internet
# Method curl para HTTPS en MAC
download.file(url, destfile="data/file.csv", method="curl")
# Para windows usar
download.file(url, destfile="data/file.csv", method="wininet", mode = "wb")

dateDownloaded <- Date()

# Lista archivos del Directorio data
list.files("data")
````

### Leer Archivos

Archivos CSV
```Rscript
read.csv("directory/file.csv")
```

Archivos de Excel
```Rscript
library(xlsx)
# Si hay problemas de Java usar:
library(openxlsx)
read.xlsx("directory/file.xlsx", sheetIndex=1, header=TRUE)

# Leer filas y columnas especificas
read.xlsx("directory/file.xlsx", sheetIndex=1, colIndex=2:3, rowIndex=1:4)
```

Archivos XML
```Rscript
library(XML)
fileUrl <- "http://www.w3school.com/xml/simple.xml"
doc <- xmlTreeParse(fileUrl, useInternal=TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)

# Direct access
rootNode[[1]]
rootNode[[1]][[1]]

# Loop and get XML values
xmlSApply(rootNode, xmlValue)

# Todos los nodos que tengan como nombre "name"
xpathSApply(rootNode, "//name", xmlValue)

# Todos los nodos que tengan como nombre "price"
xpathSApply(rootNode, "//price", xmlValue)
```

Archivos JSON
```Rscript
# Leer JSON
library(jsonlite)
jsonData <- fromJSON(url)

# Nombre de los atributos
names(jsonData)

# Nombre de los atributos bajo "owner"
names(jsonData$owner)

# Nombre de los atributos bajo "owner" y "login"
names(jsonData$owner$login)

# Convertir a JSON
myjson <=toJSON(jsonSet, prettu=TRUE)
cat(myjson)
```

### data.table
- Más rápido que data.frame
- Se puede hacer aggregation
- Se puede hace Joins
- Utiliza keys

```Rscript
library(data.table)
data.frame(x=rnorm(9), y=rep(c("a","b","c"), each=3), z=rnorm(9))

# Ver tables en memoria
tables()
```

### Quiz Semana 1
- Ver [function quiz semana 1](semana1/semana1-quiz.R).


## Semana 2

### Funciones utilizadas
- Ver [Funciones Semana 2](semana2.md).

## Semana 3

### Funciones utilizadas
- Ver [Funciones Semana 3](semana3.md).

## Semana 4

### Funciones utilizadas
- Ver [Funciones Semana 4](semana4.md).
