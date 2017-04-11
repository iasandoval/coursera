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

Leer data
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

[Regresar a Notas](notes.md#semana-2)
