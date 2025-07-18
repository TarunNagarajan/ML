library(cars)
avPlots(model_multiple)

data(mtcars)
head(mtcars)

# a simple linear model, where mpg is reliant on wt alone. 
model_simple <- lm(mpg ~ wt, data = mtcars)
summary(model_simple)

# PLOT I: Simple Linear Model (mpg ~ wt)
plot(mtcars$wt, mtcars$mpg,
     main = "MPG vs. Wt",
     xlab = "Weight (1000 lbs)",
     ylab = "Miles Per Gallon",
     pch = 19,
     col = "blue")
abline(model_simple, col = "red", lwd = 2)

# multiple linear regression model.
model_multiple <- lm(mpg ~ wt + hp, data = mtcars)
summary(model_multiple)

# using new data for a data frame, so that the model can try and make predictions. 
wt <- 3
hp <- 110
new_data <- data.frame(wt = 3, hp = 110)
predicted <- predict(model_multiple, newdata = new_data)
cat("Predicted MPG for wt =", wt, " and hp =", hp, "is:", predicted)

par(mfrow = c(2, 2))
plot(model_multiple)
par(mfrow = c(1, 1)) # clear the plot space

# prediction vs. actual -> a comparison
prediction <- predict(model_multiple, newdata = mtcars) # predicted mpg
actual <- mtcars$mpg # actual mpg

cat("Actual Length:", length(actual))
cat("Predicted Length: ", length(prediction))

plot(actual, prediction,
     main = "Predicted vs. Actual MPG",
     xlab = "Actual MPG",
     ylab = "Predicted MPG",
     pch = 19,
     col = "darkgreen")
abline(a = 0, b = 1, col = "red", lwd = 2)

dev.off()


