# 02: find the min, max, percentiles, variance, stddev, covar, correl, prob distr
# [COMPLETE]
data(mtcars)
head(mtcars)   
str(mtcars) 

minimum <- apply(mtcars, 2, min)
maximum <- apply(mtcars, 2, max)
percentiles <- apply(mtcars, 2, quantile)
variance <- apply(mtcars, 2, var)
standard_deviation <- apply(mtcars, 2, sd)
covariance <- cov(mtcars)
correlation <- cor(mtcars)

# Plot
# I have chosen to display the distribution of the mpg (miles per gallon, mileage)
mpg_prob_density <- density(mtcars$mpg)
plot(mpg_prob_density, main = "Probability Density of Distribution of mpg (miles per gallon) for mtcars", xlab = "mpg", ylab = "density")

# added histogram
hist(mtcars$mpg, 
    main = "Histogram of MPG distribution",
    xlab = "mpg",
    ylab = "frequency",
    col = "orchid3",
    border = "black")

# print all evaluated results
maximum
minimum
percentiles
variance
standard_deviation
covariance
correlation




