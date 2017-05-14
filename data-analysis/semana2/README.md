## Contenido - Semana 2
[Regresar a Notas](README.md#semana-2)


### Lattice Plotting System

````Rscript
# Crea plot
xyplot(Ozone~Wind, airquality)

# Crea Plot con snowflakes rojos y con título
xyplot(Ozone~Wind, data = airquality,  pch = 8, col= "red", main = "Big Apple Data")

# Crea 5 Plots (1 por cada mes=)
xyplot(Ozone~Wind | as.factor(Month), data = airquality, layout=c(5,1))

# Obtener propiedades de xyplot
p = xyplot(Ozone~Wind, airquality)
names(p)

# Mostrar la fórmula
p[["formula"]]

# Mostrar los límites
p[["x.limits"]]
````

**Lattice plots are constructed by a series of calls to core functions.**
1. False
2. **True**

**Lattice plots are constructed with a single function call to a core lattice function (e.g. xyplot)**
1. False
2. **True**

**Aspects like margins and spacing are automatically handled and defaults are usually sufficient.**
1. False
2. **True**

**The lattice system is ideal for creating conditioning plots where you examine the same kind of plot under many different conditions.**
1. False
2. **True**

**The lattice system, like the base plotting system, returns a trellis plot object.**
1. True
2. **False**

This is the key difference between the two systems. Lattice DOES return a plot object but base doesn't.

**Panel functions can NEVER be customized to modify what is plotted in each of the plot panels.**
1. **False**
2. True

**Lattice plots can display at most 20 panels in a single plot.**
1. **False**
2. True

### Working with Colors

````Rscript
# Ver colores disponibles
sample(colors(), 10)

# Obtener el RGB del color
pal <- colorRamp(c("red", "blue"))

pal(0)
##      [,1] [,2] [,3]
## [1,]  255    0    0

pal(1)
##     [,1] [,2] [,3]
## [1,]    0    0  255


# Obtener color en Hexadecimal
p1 <- colorRampPalette(c("red", "blue"))

p1(2)
## [1] "#FF0000" "#0000FF"

# Plot with color alpha
plot(x, y, pch = 19, col = rgb(0,.5,.5, .3))

````

**Careful use of colors in plots/maps/etc. can make it easier for the reader to understand what points you're trying to convey.**
1. False
2. **True**

**Which of the following is an R package that provides color palettes for sequential, categorical, and diverging data?**
1. **RColorBrewer**
2. RColorStewer
3. RColorVintner
4. RColorBluer

**The colorRamp and colorRampPalette functions can be used in conjunction with color palettes to connect data to colors.**
1. **True**
2. False

**Transparency can NEVER be used to clarify plots with many points**
1. True
2. **False**

**The call p7 <- colorRamp("red","blue") would work (i.e., not generate an error).**
1. **False**
2. True

**The function colors returns only 10 colors.**
1. True
2. **False**

**Transparency is determined by which parameter of the rgb function?**
1. beta
2. **alpha**
3. gamma
4. delta
5. it's all Greek to me

### GGPlot2 Part1

**Recall what you know about R's base plotting system. Which of the following does NOT apply to it?**
1. It is convenient and mirrors how we think of building plots and analyzing data
2. Use annotation functions to add/modify (text, lines, points, axis)
3. Start with plot (or similar) function
4. **Can easily go back once the plot has started (e.g., to adjust margins or correct a typo)**

**Recall what you know about R's lattice plotting system. Which of the following does NOT apply to it?**
1. Plots are created with a single function call (xyplot, bwplot, etc.)
2. Most useful for conditioning types of plots and putting many panels on one plot
3. **Can always add to the plot once it is created**
4. Margins and spacing are set automatically because entire plot is specified at once

**If we told you that ggplot2 combines the best of base and lattice, that would mean it ...?**
1. **All of the others***
2. Like lattice it allows for multipanels but more easily and intuitively
3. Its default mode makes many choices for you (but you can customize!)
4. Automatically deals with spacings, text, titles but also allows you to annotate

````Rscript
# Correlation between engine displacement (displ) and highway miles per gallon (hwy)
qplot(displ, hwy, data=mpg)

# With color by drv variable
qplot(displ, hwy, data=mpg, color = drv)

# smoothing function to produce trend lines
qplot(displ, hwy, data=mpg, color = drv, geom=c("point", "smooth"))

# Boxploy
qplot(drv, hwy, data = mpg, geom = "boxplot")

# Qplot by manufacturer
qplot(drv, hwy, data = mpg, geom = "boxplot", color = manufacturer)

# Histograma by drv
qplot(hwy, data = mpg, fill = drv)

# 1 by 3 array of plots
qplot(displ, hwy, data = mpg, facets = .~drv)

# 3 by 1 array of plots
qplot(hwy, data = mpg, facets = drv~., binwidth = 2)
````

**Which of the following is a basic workhorse function of ggplot2?**
1. **qplot**
2. hist
3. xyplot
4. gplot
5. scatterplot

**Which types of plot does qplot plot?**
1. scatterplots
2. box and whisker plots
3. histograms
4. **all of the others**

**What does the gg in ggplot2 stand for?**
1. **grammar of graphics**
2. good grief
3. good graphics
4. goto graphics

**The geom argument takes a string for a value.**
1. False
2. **True**

**The data argument takes a string for a value.**
1. **False**
2. True

**The binwidth argument takes a string for a value.**
1. **False**
2. True

**The user must specify x- and y-axis labels when using qplot.**
1. **False**
2. True

### GGPlot2 Part2

````Rscript
# ggplot
g <- ggplot(mpg, aes(displ, hwy))
# appending geom_point()
g+geom_point()
# appending smooth
g+geom_point()+geom_smooth()

# Smooth Linear Model (lm)
g+geom_point()+geom_smooth(method = "lm")

# Add grid
g+geom_point()+geom_smooth(method = "lm")+facet_grid(.~drv)

# Add title
g+geom_point()+geom_smooth(method = "lm")+facet_grid(.~drv)+ggtitle("Swirl Rules!")

# Modificando la estética
g+geom_point(color="pink",size=4,alpha=1/2)
 
# Separado por colores en drv
g+geom_point(size=4,alpha=1/2, aes(color = drv))
 
# Agregando labels (labs)
g+geom_point(aes(color = drv)) + labs(title = "Swirl Rules!") + labs(x = "Displacement", y = "Hwy Mileage")
 
# Estilo de smooth
g+geom_point(aes(color = drv), size = 2, alpha = 1/2) + geom_smooth(size = 4, linetype = 3, method ="lm", se = FALSE)

# Theme Black and White
g+geom_point(aes(color = drv)) + theme_bw(base_family = "Times")

# Grafica testdat
g <- ggplot(testdat, aes(x = myx, y = myy))

# Muestra ouliers
g+geom_line()

# Muestra solo en el rango -3, 3
g+geom_line()+ ylim(-3,3)

# The outlier y value at x=50 is not shown, but the plot indicates that it is larger than 3.
g+geom_line()+ coord_cartesian(ylim = c(-3,3))

````

### GGPlot2 Extras

````Rscript
# Histograma del precio de los diamantes (Warning fuera de rango)
qplot(price, data = diamonds)

# Mostrar el rango de precios
range(diamonds$price)

# Histograma dentro del rango
qplot(price, data = diamonds, binwidth = 18497/30)

# Histograma de colores separado por variable cut
qplot(price, data = diamonds, binwidth = 18497/30, fill = cut)

# Grafica de lineas
qplot(price, data = diamonds, geom = "density")

# Grafica de lineas de colores por variable cut
qplot(price, data = diamonds, geom = "density", color = cut)

# Scatterplot
qplot(carat, price, data = diamonds)

# Scatterplot de formas por variable cut
qplot(carat, price, data = diamonds, shape = cut)

# Scatterplot de colores por variable cut
qplot(carat, price, data = diamonds, shape = cut)

# Igual que el anterior + smooth Linear Model
qplot(carat, price, data = diamonds, color = cut) + geom_smooth(method = "lm")

# facets (multi panel plot)
qplot(carat, price, data = diamonds, color = cut, facet = .~cut) + geom_smooth(method = "lm")
````

**Which types of plot does qplot plot?**
1. box and whisker plots
2. scatterplots
3. **all of the others**
4. histograms

**Any and all of the above choices work; qplot is just that good. What does the gg in ggplot2 stand for?**
1. **grammar of graphics**
2. good grief
3. goto graphics
4. good graphics

**The geom argument takes a string for a value.**
1. False
2. **True**

**The method argument takes a string for a value.**
1. **True**
2. False

**The binwidth argument takes a string for a value.**
1. **False**
2. True

**The user must specify x- and y-axis labels when using qplot.**
1. **False**
2. True

````Rscript
# Grafica usando ggplot
g <- ggplot(diamonds, aes(depth, price))

# Scatterplot
g+geom_point(alpha = 1/3)

# Let's divide the data into 3 pockets
# First arg is data to cut
cutpoints <- quantile(diamonds$carat, seq(0,1, length = 4), na.rm = TRUE)

# Crear nueva variable con los cortes
diamonds$car2 <- cut(diamonds$carat,cutpoints)

# multi-facet plot with 5 rows, each corresponding to a cut factor
g <- ggplot(diamonds, aes(depth, price))
g + geom_point(alpha = 1/3) + facet_grid(cut ~ car2)

# Igual que el anterior pero con regression lines
g + geom_point(alpha = 1/3) + facet_grid(cut ~ car2)+ geom_smooth(method = "lm", size = 3, color = "pink")

# Crea un boxplot
ggplot(diamonds, aes(carat, price)) + geom_boxplot() + facet_grid(.~cut)
````

[Regresar a Notas](README.md#semana-2)
