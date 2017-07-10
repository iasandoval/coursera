# Quiz Semana 2: Variability, Distribution, & Asymptotics

What is the variance of the distribution of the average an IID draw of n observations from a population with mean μ and variance σ2.

1. 2σ/√n
2. ```σ2/n```
3. σ/n
4. σ2

Suppose that diastolic blood pressures (DBPs) for men aged 35-44 are normally distributed with a mean of 80 (mm Hg) and a standard deviation of 10. About what is the probability that a random 35-44 year old has a DBP less than 70?

```RScript
targetDBP = 70
μ = 80
σ = 10
round(pnorm(targetDBP, mean = μ, sd = σ) * 100)

## [1] 16
```

1. 8%
2. 32%
3. ```16%```
4. 22%

Brain volume for adult women is normally distributed with a mean of about 1,100 cc for women with a standard deviation of 75 cc. What brain volume represents the 95th percentile?

```RScript
quantile = 0.95
μ = 1100
σ = 75
round(qnorm(quantile, mean = μ, sd = σ))

## [1] 1223
```

1. approximately 977
2. ```approximately 1223```
3. approximately 1175
4. approximately 1247

Refer to the previous question. Brain volume for adult women is about 1,100 cc for women with a standard deviation of 75 cc. Consider the sample mean of 100 random adult women from this population. What is the 95th percentile of the distribution of that sample mean?

```RScript
quantile = 0.95
μ = 1100
σ = 75
n = 100
SE = σ/sqrt(n)
round(qnorm(quantile, mean = μ, sd = SE))

## [1] 1112
```

1. approximately 1088 cc
2. approximately 1115 cc
3. approximately 1110 cc
4. ```approximately 1112 cc```

You flip a fair coin 5 times, about what's the probability of getting 4 or 5 heads?

```RScript
p = 0.5
n = 5
quantile = 3 # 4 or 5 out of 5, with lower
round(pbinom(quantile, size=n, prob=p, lower.tail = FALSE) * 100)

## [1] 19
```

1. 6%
2. ```19%```
3. 12%
4. 3%

The respiratory disturbance index (RDI), a measure of sleep disturbance, for a specific population has a mean of 15 (sleep events per hour) and a standard deviation of 10. They are not normally distributed. Give your best estimate of the probability that a sample mean RDI of 100 people is between 14 and 16 events per hour?

```RScript
μ = 15
σ = 10
n = 100
SE = σ/sqrt(n)

left = 14
right = 16

percentageLeft = pnorm(left, mean = μ, sd = SE) * 100
percentageRight = pnorm(right, mean = μ, sd = SE) * 100

round(percentageRight - percentageLeft)

## [1] 68
```

1. 47.5%
2. 95%
3. 34%
4. ```68%```

Consider a standard uniform density. The mean for this density is .5 and the variance is 1 / 12. You sample 1,000 observations from this distribution and take the sample mean, what value would you expect it to be near?

```RScript
quantile = 0.5
μ = 0.5
σ = 1/12
n = 1000
SE = σ/sqrt(n)

qnorm(quantile, mean = μ, sd = SE)

## [1] 0.5
```

1. 0.10
2. 0.75
3. ```0.5```
4. 0.25

The number of people showing up at a bus stop is assumed to be Poisson with a mean of 5 people per hour. You watch the bus stop for 3 hours. About what's the probability of viewing 10 or fewer people?

```RScript
t = 3
lambda= 5
quantile = 10

round(ppois(quantile, lambda = t * lambda), digits=2)

## [1] 0.12
```

1. 0.08
2. ```0.12```
3. 0.06
4. 0.03
