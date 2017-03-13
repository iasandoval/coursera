## INSTALLATION PROCESS

- Install [R](https://cran.r-project.org/)
- Install [RStudio](https://www.rstudio.com/products/rstudio/download/)
- Install [RTools](https://cran.r-project.org/bin/windows/Rtools/) - Windows Only 
	* **Don't forget to select the checkbox for Windows PATH!!**

After RTools installations, **install devtools R package** in RStudio.

Find a package:
```
find.package("devtools")
```

Install packages:
```
install.packages("devtools")
```

Verify RTools installation:
```
library(devtools) // Load devtools
find_rtools() // Should return TRUE
```

## SETTING WORKING DIRECTORY

Current Work Directory:
```
getWD()
```

