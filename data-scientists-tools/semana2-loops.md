## Semana 2 - Estructuras de control

If-Else
```
if(<condition1>) {
	## If condition1
} else if(<condition2>) {
	# else if condition2
} else {
	## else
}
```

Valid if-else estructure
```
if(x > 3) {
	y <- 10
} else {
	y <- 0
}
```
```
y <- if(x > 3) {
	10
} else {
	0
}
```

For Loops
```
for(i in 1:10) {
	print(i)
}
```
Ejemplos de For Loops
```
x <- c("a","b", "c","d")
for(i in 1:4) {
	print(x[i])
}

for(i in seq_along(x)) {
	print(x[i])
}

for(letter in x) {
	print(letter)
}

for(i in 1:4) print(x[i])
```

While Loops
```
count <- 0
while(count < 10) {
	print(count)
	count <- count + 1
}
```

Repeat, Next, Break

```
x0 <- 1
tol <- 1e-8

repeat {
	x1 <- computeEstimate()

	if(abs(x1 - x0) < tol) {
		break
	} else {
		x0 <- x1
	}
}
```
```
for(i in 1:100) {
	if(i<=20){
		## Skip the first 20 interatios
		next
	}
	## Do something here
}
```
