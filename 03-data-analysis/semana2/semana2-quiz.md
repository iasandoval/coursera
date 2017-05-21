## Quiz - Semana 2
[Regresar a Notas](README.md#semana-2)

1. Under the lattice graphics system, what do the primary plotting functions like xyplot() and bwplot() return?

````Rscript
library(lattice)
library(datasets)
data(airquality)
plot = xyplot(Ozone~Wind, airquality)
class(plot)
## [1] "trellis"
````

2. What is produced by the following code?

````Rscript
library(nlme)
library(lattice)
xyplot(weight ~ Time | Diet, BodyWeight)
````

A set of 3 panels showing the relationship between weight and time for each diet.

3. Annotation of plots in any plotting system involves adding points, lines, or text to the plot, in addition to customizing axis labels or adding titles. Different plotting systems have different sets of functions for annotating plots in this way.

Which of the following functions can be used to annotate the panels in a multi-panel lattice plot?

````Rscript
panel.lmline()
````

4. The following code does NOT result in a plot appearing on the screen device.

````Rscript
library(lattice)
library(datasets)
data(airquality)
p <- xyplot(Ozone ~ Wind | factor(Month), data = airquality)
````

Which of the following is an explanation for why no plot appears?
- The object 'p' has not yet been printed with the appropriate print method.

5. In the lattice system, which of the following functions can be used to finely control the appearance of all lattice plots?

````Rscript
trellis.par.set()
````

6. What is ggplot2 an implementation of?

the Grammar of Graphics developed by Leland Wilkinson

7. Load the `airquality' dataset form the datasets package in R

````Rscript
library(datasets)
data(airquality)
````

I am interested in examining how the relationship between ozone and wind speed varies across each month. What would be the appropriate code to visualize that using ggplot2?

````Rscript
airquality = transform(airquality, Month = factor(Month))
qplot(Wind, Ozone, data = airquality, facets = . ~ Month)
````

8. What is a geom in the ggplot2 system?

a plotting object like point, line, or other shape

9. When I run the following code I get an error:

````Rscript
library(ggplot2)
library(ggplot2movies)
g <- ggplot(movies, aes(votes, rating))
print(g)
````

ggplot does not yet know what type of layer to add to the plot.

10. The following code creates a scatterplot of 'votes' and 'rating' from the movies dataset in the ggplot2 package. After loading the ggplot2 package with the library() function, I can run

````Rscript
qplot(votes, rating, data = movies)
````

How can I modify the the code above to add a smoother to the scatterplot?

````Rscript
qplot(votes, rating, data = movies) + geom_smooth()
````

[Regresar a Notas](README.md#semana-2)