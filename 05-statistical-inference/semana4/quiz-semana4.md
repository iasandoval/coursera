# Quiz Semana 4: Power, Bootstrapping, & Permutation Tests

A pharmaceutical company is interested in testing a potential blood pressure lowering medication. Their first examination considers only subjects that received the medication at baseline then two weeks later. The data are as follows (SBP in mmHg)

| Subject     | Baseline	  | Week 2    |
|-------------|:-----------:|----------:|
| 1	          | 140	        | 132       |
| 2	          | 138	        | 135       |
| 3	          | 150	        | 151       |
| 4	          | 148	        | 146       |
| 5	          |135	        | 130       |

Consider testing the hypothesis that there was a mean reduction in blood pressure? Give the P-value for the associated two sided T test.

(Hint, consider that the observations are paired.)

```RScript
subject <- c(1,2,3,4,5)
baseline <- c(140,138,150,148,135)
week2 <- c(132,135,151,146,130)
data.frame(subject, baseline, week2)

##   subject baseline week2
## 1       1      140   132
## 2       2      138   135
## 3       3      150   151
## 4       4      148   146
## 5       5      135   130

test <- t.test(x = examinations$baseline, y = examinations$week2, alt = "two.sided", paired = TRUE)
pval <- test$p.value
round(pval,3)

## [1] 0.087
```

1. 0.043
2. 0.05
3. ```0.087```
4. 0.10

A sample of 9 men yielded a sample average brain volume of 1,100cc and a standard deviation of 30cc. What is the complete set of values of μ0 that a test of H0:μ=μ0 would fail to reject the null hypothesis in a two sided 5% Students t-test?

```RScript
n <- 9
μ <- 1100
σ <- 30
quantile = 0.975 # is 95% with 2.5% on both sides of the range
μ + c(-1, 1) * qt(quantile, df=n-1) * σ / sqrt(n)

## [1] 1077 1123
```

1. 1081 to 1119
2. 1031 to 1169
3. ```1077 to 1123```
4. 1080 to 1120

Researchers conducted a blind taste test of Coke versus Pepsi. Each of four people was asked which of two blinded drinks given in random order that they preferred. The data was such that 3 of the 4 people chose Coke. Assuming that this sample is representative, report a P-value for a test of the hypothesis that Coke is preferred to Pepsi using a one sided exact test.

```RScript
n <- 4
x <- 3
test <- binom.test(x=x, n=n, alt="greater")
round(test$p.value,2)

## [1] 0.31
```

1. ```0.31```
2. 0.62
3. 0.10
4. 0.005

Infection rates at a hospital above 1 infection per 100 person days at risk are believed to be too high and are used as a benchmark. A hospital that had previously been above the benchmark recently had 10 infections over the last 1,787 person days at risk. About what is the one sided P-value for the relevant test of whether the hospital is *below* the standard?

```RScript
rate <- 1/100
errors <- 10
days <- 1787
test <-  poisson.test(errors, T = days, r = rate, alt="less")
round(test$p.value,2)

## [1] 0.03
```

1. ```0.03```
2. 0.52
3. 0.11
4. 0.22

Suppose that 18 obese subjects were randomized, 9 each, to a new diet pill and a placebo. Subjects’ body mass indices (BMIs) were measured at a baseline and again after having received the treatment or placebo for four weeks. The average difference from follow-up to the baseline (followup - baseline) was −3 kg/m2 for the treated group and 1 kg/m2 for the placebo group. The corresponding standard deviations of the differences was 1.5 kg/m2 for the treatment group and 1.8 kg/m2 for the placebo group. Does the change in BMI appear to differ between the treated and placebo groups? Assuming normality of the underlying data and a common population variance, give a pvalue for a two sided t test.

```RScript
_y <- 9 # subjects treated
n_x <- 9 # subjects placebo
σ_y <- 1.5# kg/m2 std.dev. treated
σ_x <- 1.8# kg/m2 std.dev. placebo
μ_y <- -3#  kg/m2 average difference treated
μ_x <- 1#  kg/m2 average difference placebo

# calculate pooled standard deviation
σ_p <- (((n_x - 1) * σ_x^2 + (n_y - 1) * σ_y^2)/(n_x + n_y - 2))
pt((μ_y - μ_x) / (σ_p * (1 / n_x + 1 / n_y)^.5), df=n_y + n_x -2)

## [1] 0.003504
```

1. Less than 0.10 but larger than 0.05
2. Larger than 0.10
3. ```Less than 0.01```
4. Less than 0.05, but larger than 0.01

Brain volumes for 9 men yielded a 90% confidence interval of 1,077 cc to 1,123 cc. Would you reject in a two sided 5% hypothesis test of

H0:μ=1,078?

1. ```No you wouldn't reject.```
2. Where does Brian come up with these questions?
3. Yes you would reject.
4. It's impossible to tell.

Researchers would like to conduct a study of 100 healthy adults to detect a four year mean brain volume loss of .01 mm3. Assume that the standard deviation of four year volume loss in this population is .04 mm3. About what would be the power of the study for a 5% one sided test versus a null hypothesis of no volume loss?

```RScript
n <- 100 #subject
μ <- 0.01# m^3 brain volume loss mean
σ <- 0.04# m^3 brain volume loss std. dev.
p <- 0.05 # sign level

pow <- power.t.test(n=n, delta=μ, sd=σ , sig.level=p, type="one.sample", alt="one.sided")$power
round(pow, 2)

## [1] 0.8
```

1. 0.60
2. 0.50
3. ```0.80```
4. 0.70

Researchers would like to conduct a study of n healthy adults to detect a four year mean brain volume loss of .01 mm3. Assume that the standard deviation of four year volume loss in this population is .04 mm3. About what would be the value of n needed for 90% power of type one error rate of 5% one sided test versus a null hypothesis of no volume loss?

```RScript
μ <- 0.01# m^3 brain volume loss mean
σ <- 0.04# m^3 brain volume loss std. dev.
p <- 0.05 # sign level
pow <- 0.9 #power

n <- power.t.test(power=pow, delta=μ, sd=σ , sig.level=p, type="one.sample", alt="one.sided")$n
ceiling(n/10)*10

## [1] 140
```

1. 180
2. 160
3. 120
4. ```140```

As you increase the type one error rate, α, what happens to power?

1. No, for real, where does Brian come up with these problems?
2. ```You will get larger power.```
3. It's impossible to tell given the information in the problem.
4. You will get smaller power.
