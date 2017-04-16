## Funciones - Semana 2
[Regresar a Notas](notes.md#semana-2)

### Leer de MySQL
Instalar libreria MySQL

Conectar a MySQL y obtener todas las bases de datos
```Rscript
library(mysql)

# Conectar a la BD
uscsDB = dbConnect(MySQL(), user="gnome", host="genome-mysql.cse.ucsc.edu")

# Ejecutar un Query
result = dbGetQuery(uscsDB, "show databases;")

# Desconectar de la BD
dbDisconnect(uscsDB)
```

Conectar a la BD HG19
```Rscript
# Conectar a la BD HG19
hg19 = dbConnect(MySQL(), user="gnome", db="hg19" host="genome-mysql.cse.ucsc.edu")
allTables = dbListTables(hg19)
lenght(allTable)
## [1] 10949
```

Leer una tabla
```Rscript
# Conocer las columnas de una tabla
dbListFields(hg19, "affyU133Pllus2")

# Leer una tabla
affyData = dbReadTable(hg19, "affyU133Pllus2")
```

Obtener un subset de la tabla
```Rscript
# Subset de una tabla
quey = dbSendQuery(hg19, "select * form affyU133Pllus2 where misMatches between 1 and 3")
affMis = fetch(query)
quantile(affMis$misMatches)

# Obtener los primeros 10 registros
affMisSmall = fetch(query, n=10)

# Limpiar el query
dbClearResults(query)
```

### Leer HDF5

Paquete HDF5
```Rscript
source("http://bioconductor.org/biocLite.R")
biocLite("rhdf5")

library(rhdf5)
created = h5createFile("example.h5")
created
## [1] TRUE
```

Crear Grupos
```Rscript
created = h5createGroup("example.h5", "foo")
created = h5createGroup("example.h5", "baa")
created = h5createGroup("example.h5", "foo/foobaa")
h5ls("example.h5")
```

Escribir en grupos
```Rscript
A = matrix(1:10, nr=5, nc=2)
h5write(A, "example.h5", "foo/A")

B = array(seq(0.1,2.0, by = 0.1), dim=c(5,2,2))
attr(B, "scale") <- "litter"
h5write(B, "example.h5", "foo/foobaa/B")
h5ls("example.h5")
```

Escribir un data set
```Rscript
df = data.frame(1L:5L, seq(0,1, lenght.out=5)),
     c("ab", "cde", "fghi", "a", "s"), stringsAsFactors=FALSE)
h5write(df, "example.h5", "df")
h5ls("example.h5")
```

Leer datos
```Rscript
readA = h5read("example.h5", "foo/A")
readB = h5read("example.h5", "foo/foo/baa/B")
readdf = h5read("example.h5", "df")
```

Escribir y leer en chunks
```Rscript
h5write(c(12,13,14), "example.h5", "foo/A", index=list(1:3, 1))
h5read("example.h5", "foo/A")
```

### Leer datos desde la Web

Webscraping: Obtener datos del código HTML de páginas Web de forma programática.

Obtener datos de Páginas Web usando Readline()
```Rscript
con = url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")
htmlCode = readlines(con)
# Cerrar la conexión
close(con)
# Mostrar el código HTML
htmlCode
```

Parsing to XML
```Rscript
library(XML)
url = url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")
html = htmlTreeParse(url, useInternalNodes=T)

xpathSApply(html, "//title", xmlValue)
```

GET from httr package
```Rscript
library(httr)
html2 = GET(url)
content2 = content(html2, as="text")
parsedHtml = htmlParse(content2, asText=TRUE)
xpathSApply(parsedHtml, "//title", xmlValue)
```

Accesing Websites with password
```Rscript
pg2 = GET("http://httpbin.org/basic-auth/user/passwd", authenticate("user", "password"))

pg2
## Response [http://httpbin.org/basic-auth/user/passwd]
##  Date: 2017-04-16 15:42
##  Status: 401
##  Content-Type: <unknown>
## <EMPTY BODY>

names(pg2)
## [1] "url"    "status_code" "headers" "all_headers" "cookies" "content"   "date"  "times" "request"   "handle"
```

Using handles
```Rscript
google = handle("http:google.com")
pg1 = GET(handle = google, path = "/")
pg2 = GET(handle = google, path = "search")
```

### Leer datos de API

API: Application Programming Interfaces

1. Usar tu cuenta de twitter
2. Crear una aplicación

Acceder a Twitter desde R
```Rscript
myApp = oauth_app("twitter", key="cutomerKey", secret="customerSecret")
sig = sign_oauth1.0(myapp, token = "tokenHere", token_secret = "tokenSecret")

homeTL = GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)
```

Convertir el objeto JSON
```Rscript
json1 = content(homeTL)
json2 = jsonlite::fromJSON(toJSON(json1))
json2[1, 1:4]
```

### Leer datos de otros orígenes

**Interactuando con archivos**
- file: Abre una conexión a un archivo
- url: Abre una conexión a una URL
- gzfile: Abre una conexión a un archivo .gz
- bzfile: Abre una conexión a un archivo .bz2
- ?connections para más información
- Recuerda cerrar las conexiones

**Foreign packages**
- Carga datos desde Minitab, S, SAS, SPSS, Stata, Systat
- Funciones básicas
    - read.arff(weka)
    - read.dta(stata)
    - read.mtp(Minitab)
    - read.octave(Octave)
    - read.spss(SPSS)
    - read.xport(SAS)

**Otros paquetes de Bases de Datos**
- RPostgresSQL: Conexión a BD PostgresSQL
- ROBDC: Conexión a BD POstgresSQL, MySQL, MS Access, SQLite
- RMongo: Conexión a documentos mongoDB

**Leyendo imágenes**
- jpeg
- readbitmap
- png
- EBimage

**Leyengo GIS data**
- rdgal
- rgeos
- raster

**Leyendo data de música**
- tuneR
- seewave


[Regresar a Notas](notes.md#semana-2)
