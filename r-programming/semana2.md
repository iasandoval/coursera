## Funciones - Semana 2
[Regresar a Notas](notes.md#semana-2)

Evaluar si es TRUE
```Rscript
isTRUE(6 > 4)
```

Comparar dos objetos identicos
```Rscript
identical('twins', 'twins')
```

Exclusive OR
```Rscript
xor(5 == 6, !FALSE)
## [1] TRUE

xor(4 >= 9, 8 != 8.0)
## [1] FALSE
```

Random sampling of integers from 1 to 10 without replacement
```Rscript
ints <- sample(10)
## [1]  5  2 10  3  7  1  8  4  6  9
```

Find the indices of ints that are greater than 7.
```Rscript
which(ints > 7)
## [1]  3  7 10
```

The any() function will return TRUE if one or more of the elements in the logical vector is TRUE.
```Rscript
any(ints < 0)
## [1] FALSE
```

The all() function will return TRUE if every element in the logical vector is TRUE.
```Rscript
all(ints > 0)
[1] TRUE
```

Tiempo y Fecha
```Rscript
Sys.Date()
## [1] "2017-04-05"

Sys.time()
## [1] "2017-04-05 17:24:11 EDT"
```

Obtener los argumentos de una función
```Rscript
args(remainder)
## function (num, divisor = 2)
## NULL
```

Pasar una función como parámetro
```Rscript
evaluate <- function(func, dat){  
  func(dat)
}

# SD: standard Deviation
evaluate(sd, c(1.4,3.6, 7.9, 8.8)))
```

Crear operadores binarios personalizados
```Rscript
"%p%" <- function(p1, p2){
  paste(p1, p2)
}

'I' %p% 'love' %p% 'R!'
## [1] "I love R!"
```


[Regresar a Notas](notes.md#semana-2)
