## Semana 3 Quiz / Assignments
[Regresar a Notas](notes.md#semana-3-quiz--assignments)

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

[Regresar a Notas](notes.md#semana-3-quiz--assignments)