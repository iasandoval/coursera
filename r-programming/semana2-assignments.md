## Semana 2 Assignments
[Regresar a Notas](notes.md#semana-2-assignments)

1. Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors. The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data from the directory specified in the 'directory' argument and returns the mean of the pollutant across all of the monitors, ignoring any missing values coded as NA. A prototype of the function is as follows

	- Ver Función [pollutantmean.R](semana2/pollutantmean.R)

    ### Example outputs
    ```Rscript
    source("pollutantmean.R")
    pollutantmean("specdata", "sulfate", 1:10)
    ## [1] 4.064
    ```
    ```Rscript
    pollutantmean("specdata", "nitrate", 70:72)
    ## [1] 1.706
    ```
    ```Rscript
    pollutantmean("specdata", "nitrate", 23)
    ## [1] 1.281
    ```

2. Write a function that reads a directory full of files and reports the number of completely observed cases in each data file. The function should return a data frame where the first column is the name of the file and the second column is the number of complete cases. A prototype of this function follows

	- Ver Función [complete.R](semana2/complete.R)

	### Example outputs
	```Rscript
	source("complete.R")
	complete("specdata", 1)
	##   id nobs
	## 1  1  117
	```
	```Rscript
	complete("specdata", c(2, 4, 8, 10, 12))
	##   id nobs
	## 1  2 1041
	## 2  4  474
	## 3  8  192
	## 4 10  148
	## 5 12   96
	```
	```Rscript
	complete("specdata", 30:25)
	##   id nobs
	## 1 30  932
	## 2 29  711
	## 3 28  475
	## 4 27  338
	## 5 26  586
	## 6 25  463
	```
	```Rscript
	complete("specdata", 3)
	##   id nobs
	## 1  3  243
	```

3. Write a function that takes a directory of data files and a threshold for complete cases and calculates the correlation between sulfate and nitrate for monitor locations where the number of completely observed cases (on all variables) is greater than the threshold. The function should return a vector of correlations for the monitors that meet the threshold requirement. If no monitors meet the threshold requirement, then the function should return a numeric vector of length 0. A prototype of this function follows

	- Ver Función [corr.R](semana2/corr.R)

	### Example outputs
	```Rscript
	source("corr.R")
	source("complete.R")
	cr <- corr("specdata", 150)
	head(cr)
	## [1] -0.01896 -0.14051 -0.04390 -0.06816 -0.12351 -0.07589
	```
	```Rscript
	summary(cr)
	##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
	## -0.2110 -0.0500  0.0946  0.1250  0.2680  0.7630
	```
	```Rscript
	cr <- corr("specdata", 400)
	head(cr)
	## [1] -0.01896 -0.04390 -0.06816 -0.07589  0.76313 -0.15783
	```
	```Rscript
	summary(cr)
	##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
	## -0.1760 -0.0311  0.1000  0.1400  0.2680  0.7630
	```
	```Rscript
	cr <- corr("specdata", 5000)
	summary(cr)
	##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
	##
	```
	```Rscript
	length(cr)
	## [1] 0
	```
	```Rscript
	cr <- corr("specdata")
	summary(cr)
	##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
	## -1.0000 -0.0528  0.1070  0.1370  0.2780  1.0000
	```
	```Rscript
	length(cr)
	## [1] 323
	```

[Regresar a Notas](notes.md#semana-2-assignments)