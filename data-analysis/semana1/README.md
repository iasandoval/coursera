## Contenido - Semana 1
[Regresar a Notas](../README.md#semana-1)

### Lesson 1 - Principles of Analytics Graphs

**Which of the following would NOT be a good use of analytic graphing?**
1. To show multivariate data
2. **To decide which horse to bet on at the track**
3. To show causality, mechanism, explanation
4. To show comparisons

**This picture tries to explain how the air cleaner increases the number of symptom-free days for asthmatic children. What mechanism does the graph imply?**
1. That the children in the control group are healthier
2. That the air in the control group is cleaner than the air in the other group
3. That the air cleaner increases pollution
4. **That the air cleaner reduces pollution**

#### The principles of analytic graphing

**The first principle:** To show a comparison.

**The second principle:** To show causality or a mechanism of how your theory of the data works. 

**The third principle:** Multivariate data!

**What is multivariate data?**
In technical (scientific) literature this term means more than 2 variables. Two-variable plots are what you saw in high school algebra.  Remember those x,y plots when you were learning about slopes and intercepts and equations of lines? They're valuable, but usually questions are more complicated and require more variables.

**The fourth principle** involves integrating evidence. 
- This means not limiting yourself to one form of expression. 
- You can use words, numbers, images as well as diagrams. 
- Graphics should make use of many modes of data presentation. 
- Remember, "Don't let the tool drive the analysis!"

**The fifth principle** involves describing and documenting the evidence with sources and appropriate labels and scales. 
- Credibility is important so the data graphics should tell a complete story. 
- Also, using R, you want to preserve any code you use to generate your data and graphics so that the research can be replicated if necessary. 
- This allows for easy verification or finding bugs in your analysis.

**The sixth and final principle** is maybe the most important. 
- Content is king! If you don't have something interesting to report, your graphs won't save you. 
- Analytical presentations ultimately stand or fall depending on the quality, relevance, and integrity of their content.


**Which of the following is NOT a good principle of graphing?**
1. Content is king
2. **Having unreadable labels**
3. To describe and document evidence
4. To integrate multiple modes of evidence

**Which of the following is NOT a good principle of graphing?**
1. To demonstrate a causative mechanism underlying a correlation
2. **To prove you're always right**
3. Content is king
4. To show two competing hypotheses

**Which of the following is NOT a good principle of graphing?**
1. Content is king
2. **To show that some fonts are better than others**
3. To integrate different types of evidence
4. To show good labels and scales

**True or False? Color is king.**
1. True
2. **False**

### Lesson 2 - Exploratory Graphs

**Which of the following would NOT be a good reason to use graphics in data science?**
1. To understand data properties
2. To suggest modeling strategies
3. To find patterns in data
4. **To find a color that best matches the shirt you're wearing**

**Which of the following cliches captures the essence of graphics?**
1. **A picture is worth a 1000 words**
2. The apple doesn't fall far from the tree
3. To err is human, to forgive divine
4. A rose by any other name smells as sweet

Box plot
````Rscript
# Genera un boxplot
boxplot(ppm)

# Genera un boxplot azúl
boxplot(ppm, col="blue")

# Abline "adds one or more straight lines through the current plot."
# Add horizontal line at 12
abline(h=12)

# Plot multiple variables
# y (in this case pm25) depends on x (region)
boxplot(pm25~region, data = pollution, col="red")
````

Histograma
````Rscript
# Genera un histograma verde
hist(ppm, col = "green")

# This one-dimensional plot, with its grayscale representation, 
# gives you a little more detailed information about how many
# data points are in each bucket and where they lie within the bucket. 
# It shows (through density of tick marks) that the
# greatest concentration of counties has between 9 and 12 micrograms 
# per cubic meter just as the histogram did.
rug(ppm)

# Breaks: number of buckets to split the data into
hist(ppm, col = "green", breaks = 100)

# Vertical line in 12, width of 2
abline(v=12, lwd=2)

# Vertical line in median of PPM, color magenta, width of 4
abline(v=median(ppm), col="magenta", lwd=4)

# Subset de pollution donde la region es "east"
east <- subset(pollution, region == "east")

# Histograma para la región East
hist(east$pm25, col = "green") 

# Histograma para la región West
hist(subset(pollution, region == "west")$pm25, col = "green")
````

Bar plot
````Rscript
# Tabla de regiones
reg <- table(pollution$region)
## east west 
## 442  134 

# Genera un barplot, color wheat, con leyenda
barplot(reg, col="wheat", main="Number of Counties in Each Region")

# set up the plot window for two rows and one column with the mfrow argument
# The mar argument set up the margins.
par(mfrow=c(2,1),mar=c(4,4,2,1))
````

Scatter plot
````Rscript
# Scatter plot de polluttion "con" latitude y pm25 como etiquetas
with(pollution, plot(latitude, pm25))

# Plot de latitude y region en 2 colores 
plot(pollution$latitude, ppm, col=pollution$region)

# Agrega linea horizontal en 12, dashed
abline(h=12, lwd = 2, lty = 2)

# subset de west
west <- subset(pollution, region == "west")

# Dividir la zona de gráficas en 2
# Esto se hace para comparar gráficas
par(mfrow=c(2,1),mar=c(4,4,2,1))

# Plot de west latitude vs pm25
plot(west$latitude, west$pm25, main = "West")

# Plot de east atitude vs pm25
plot(east$latitude, east$pm25, main = "East")
````

**Which of the following characterizes exploratory plots?**
1. **quick and dirty**
2. slow and clean
3. slow and steady
4. quick and dead

**True or false? Plots let you summarize the data (usually graphically) and highlight any broad features**
1. **True**
2. False

**Which of the following do plots NOT do?**
1. Suggest modeling strategies for the "next step"
2. Summarize the data (usually graphically) and highlight any broad features
3. **Conclude that you are ALWAYS right**
4. Explore basic questions and hypotheses (and perhaps rule them out)

### Lesson 3 - Graphics Devices in R

````Rscript
# Plot de faithful, eruptions vs waiting
with(faithful, plot(eruptions, waiting))

# Especificar el título de la gráfica
title(main = "Old Faithful Geyser data")

# Current device
dev.cur()
## RStudioGD 
##        2 

# Exporta a PDF
pdf(file="semana1/myplot.pdf")

# Current device
dev.cur()
## pdf 
##  4

# Importante! Current device off
dev.off()

# Exporta a PNG
dev.copy(png, file = "geyserplot.png")
# Apagar device
dev.off()
````

### Lesson 4 - Plotting Systems

**What do you think is a disadvantage of the Base Plotting System?**
1. It mirrors how we think of building plots and analyzing data
2. A complicated plot is a series of simple R commands
3. **You can't go back once a plot has started**
4. It's intuitive and exploratory

````Rscript
# Plot de cars, speed vs dist
with(cars, plot(speed, dist))

# Coloca el texto al plot
text(mean(cars$speed), max(cars$dist), "SWIRL rules!")

# Plot de 4 regiones (4 columnas)
xyplot(Life.Exp ~ Income | region, data = state, layout = c(4,1))

# Plot de 4 regiones (2 filas, 2 columnas)
xyplot(Life.Exp ~ Income | region, data = state, layout = c(2,2))

# QPlot de mpg, displ vs hwy
qplot(displ, hwy, data = mpg)
````

**Which R plotting system is based on an artist's palette?**
1. **base**
2. Winsor&Newton
3. ggplot2
4. lattice

**Which R plotting system does NOT allow you to annotate plots with separate calls?**
1. base
2. Winsor&Newton
3. **lattice**
4. ggplot2

**Which R plotting system combines the best features of the other two?**
1. **ggplot2**
2. lattice
3. Winsor&Newton
4. base

**Which R plotting system uses a graphics grammar?**
1. **ggplot2**
2. Winsor&Newton
3. lattice
4. base

**Which R plotting system forces you to make your entire plot with one call?**
1. ggplot2
2. **lattice**
3. base
4. Winsor&Newton

**Which of the following sells high quality artists' brushes?**
1. lattice
2. ggplot2
3. **Winsor&Newton**
4. base

### Lesson 5 - Base Plotting System

**What do you think is a disadvantage of the Base Plotting System?**
1. It mirrors how we think of building plots and analyzing data
2. It's intuitive and exploratory
3. A complicated plot is a series of simple R commands
4. **You can't go back once a plot has started**

````Rscript
# Rango
range(airquality$Ozone, na.rm = TRUE)
## [1]   1 168

# Histograma
hist(airquality$Ozone)
````

**What is the most frequent count?**
1. **Under 25**
2. Over 100
3. Between 60 and 75
4. Over 150

````Rscript
# Boxplot de Ozono a Month
boxplot(Ozone~Month, airquality)

# Leyendas con colores
boxplot(Ozone~Month, airquality, xlab = "Month", ylab = "Ozone (ppb)", col.axis = "blue", col.lab = "red")

# Agrega título
title("Ozone and Wind in New York City")

# Plot de airquality, wind vs ozone
with(airquality, plot(Wind, Ozone))
````

There are 72 parameters
````Rscript
length(par())
## [1] 72

# Nombre de los parámetros
names(par())

par()$pin
## [1] 4.218333 2.701667
````

**Alternatively, you could have gotten the same result by running par("pin") or par('pin')).**

**What do you think these two numbers represent?**
1. Coordinates of the center of the plot window
2. A confidence interval
3. **Plot dimensions in inches**
4. Random numbers

Now, run the command par("fg") or or par('fg') or par()$fg and see what you get.
````Rscript
par("fg")
## [1] "black"
````

**It gave you a color, right? Since par()$fg specifies foreground color, what do you think par()$bg specifies?**
1. Better color
2. Beautiful color
3. blue-green
4. **Background color**

**What do you think the graphical parameter pch controls?**
1. point control height
2. pc help
3. **plot character**
4. picture characteristics

**What do you think the graphical parameters lty and lwd control respectively?**
1. **line type and width**
2. line length and width
3. line slope and intercept
4. line width and type

**What do you think the graphical parameters xlab and ylab control respectively?**
1. labels for the y- and x- axes
2. **labels for the x- and y- axes**

**As we've seen, R provides several annotating functions. Which of the following is NOT one of them?**
1. title
2. points
3. **hist**
4. lines
5. text

````Rscript
# Plot wind bs ozone
plot(airquality$Wind, airquality$Ozone, type = "n", main = "Wind and Ozone in NYC")

# Subset del mes de Mayo
may <- subset(airquality, Month == 5)

# Agrega los puntos al gráfico
# color azul, y figuras triángulos (pch = 17)
points(may$Wind, may$Ozone, col = "blue", pch = 17)

# Subset de los meses diferentes a Mayo
notmay <- subset(airquality, Month != 5)

# Agrega los puntos al gráfico
# Color rojo, figuras snowflakes (pch = 8)
points(notmay$Wind, notmay$Ozone, col = "red", pch = 8)

# Agregar leyendas
# En la parte superior derecha
legend("topright", pch = c(17,8), col = c("blue", "red"), legend= c("May","Other Months"))

# Linea en la media
abline(v=median(airquality$Wind), lty = 2,  lwd=2)
````

Crear 3 gráficas
````Rscript
# 3 Gráficas
par(mfrow = c(1,3), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

# Primer Plot
plot(airquality$Wind, airquality$Ozone, main = "Ozone and Wind")

# Segundo plot
plot(airquality$Solar.R, airquality$Ozone, main = "Ozone and Solar Radiation")

# Tercer plot
plot(airquality$Temp, airquality$Ozone, main = "Ozone and Temperature")

# Título
mtext("Ozone and Weather in New York City", outer = TRUE)
````

[Regresar a Notas](../README.md#semana-1)