## Contenido - Semana 3
[Regresar a Notas](../README.md#semana-3)

### Lesson 1: Hierarchical Clustering

````Rscript
# Compute the distances between all pairs of these points
# By default dist uses Euclidean distance as its metric
dist(dataFrame)

# Crea un dendograma
distxy = dist(dataFrame)
hc <- hclust(distxy)
plot(hc)

# No Labels
plot(as.dendrogram(hc))

# Horizontal blue line at 1.5
abline(h=1.5, col="blue")

# Horizontal red line at 0.4
abline(h=0.4, col="red")

# Horizontal green line at 0.05
abline(h=0.05, col="green")
````

The number of clusters in your data depends on where you draw the line! (We said there's a lot of flexibility here.)
Now that we've seen the practice, let's go back to some "theory". Notice that the two original groupings, 5 through 8, 
and 9 through 12, are connected with a horizontal line near the top of the display. You're probably wondering how 
distances between clusters of points are measured.

Tutorial para crear [Heat Maps](http://sebastianraschka.com/Articles/heatmaps_in_r.html#clustering).

````Rscript
# Crear un heatmap
heatmap(dataMatrix, col = cm.colors(25))
````

**What is the purpose of hierarchical clustering?**
1. Present a finished picture
2. **Give an idea of the relationships between variables or observations**
3. Inspire other researchers
4. None of the others

**When you're doing hierarchical clustering there are strict rules that you MUST follow.**
1. **False**
2. True

**There's only one way to measure distance.**
1. True
2. **False**

**Complete linkage is a method of computing distances between clusters.**
1. **True**
2. False

**Average linkage uses the maximum distance between points of two clusters as the distance between those clusters.**
1. True
2. **False**

**The number of clusters you derive from your data depends on the distance at which you choose to cut it.**
1. **True**
2. False

**Once you decide basics, such as defining a distance metric and linkage method, hierarchical clustering is deterministic.**
1. **True**
2. False


### Lesson 2: K Means Clustering

As we said, k-means is a partioning approach which requires that you first guess how many clusters you have (or want).
Once you fix this number, you randomly create a "centroid" (a phantom point) for each cluster and assign each point or
observation in your dataset to the centroid to which it is closest. Once each point is assigned a centroid, you readjust
the centroid's position by making it the average of the points assigned to it.

Once you have repositioned the centroids, you must recalculate the distance of the observations to the centroids and
reassign any, if necessary, to the centroid closest to them. Again, once the reassignments are done, readjust the
positions of the centroids based on the new cluster membership. The process stops once you reach an iteration in which no
adjustments are made or when you've reached some predetermined maximum number of iterations.

**As described, what does this process require?**
1. A number of clusters
2. An initial guess as to cluster centroids
3. **All of the others**
4. A defined distance metric

**So k-means clustering requires some distance metric (say Euclidean), a hypothesized fixed number of clusters, and an initial guess as to cluster centroids. As described, what does this process produce?**
1. An assignment of each point to a cluster
2. **All of the others**
3. A final estimate of cluster centroids

````Rscript
# Agregar centroides a gráfica
# pch es el simbolo +
# cex Expansion of characters
# lwd line width
points(cx, cy, col = c("red","orange","purple"), pch = 3, cex=2, lwd=2)
````

**There are 12 data points and 3 centroids. How many distances do we have to calculate?**
1. 15
2. 108
3. **36**
4. 9

````Rscript
# KMeans
kmObj = kmeans(dataFrame, centers = 3)

# Número de iteraciones
kmObj$iter

# Graficar
plot(x, y, col = kmObj$cluster, pch =19, cex = 2)

# Agregar centroides
points(kmObj$centers, col=c("black","red","green"), pch = 3, cex = 3, lwd = 3)

# Graficar con 6 clusters
plot(x, y, col = kmeans(dataFrame,6)$cluster, pch =19, cex = 2)
````

**K-means clustering requires you to specify a number of clusters before you begin.**
1. False
2. **True**

**K-means clustering requires you to specify a number of iterations before you begin.**
1. **False**
2. True

**Every data set has a single fixed number of clusters.**
1. True
2. **False**

**K-means clustering will always stop in 3 iterations**
1. **False**
2. True

**When starting kmeans with random centroids, you'll always end up with the same final clustering.**
1. True
2. **False**

### Lesson 3: Dimension Reduction

**Which of the following would be an example of variables correlated to one another?**
1. **Heights and weights of members of a family**
2. The depth of the Atlantic Ocean and what you eat for breakfast
3. Today's weather and a butterfly's wing position

````Rscript
# singular value decomposition
svd(mat)

# Multiplicar matrices
matu %*% diag %*% t(matv)
````

Principal Component Analysis, "a simple, non-parametric method for extracting relevant
information from confusing data sets." We're quoting here from a very nice concise paper on this subject which can be
found [here](http://arxiv.org/pdf/1404.1100.pdf). The paper by Jonathon Shlens of Google Research is called, A Tutorial on
Principal Component Analysis.

PCA is a method to reduce a high-dimensional data set to its essential elements (not lose information) and explain the variability in the data.

**Which of the following cliches LEAST captures the essence of dimension reduction?**
1. find the needle in the haystack
2. **a face that could launch a 1000 ships**
3. see the forest through the trees
4. separate the wheat from the chaff

**A matrix X has the singular value decomposition UDV^t. The principal components of X are ?**
1. the rows of U
2. the rows of V
3. the columns of U
4. **the columns of V**

**A matrix X has the singular value decomposition UDV^t. The singular values of X are found where?**
1. the columns of D
2. the columns of V
3. the columns of U
4. **the diagonal elements of D**

**PCA and SVD are totally unrelated.**
1. True
2. False

**D gives the singular values of a matrix in decreasing order of weight.**
1. **True**
2. False

### Lesson 4: Clustering Example

````Rscript

````


[Regresar a Notas](../README.md#semana-3)
