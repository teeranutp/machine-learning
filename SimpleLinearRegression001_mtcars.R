library(dplyr)
library(tidyverse)

view(mtcars)

#Simple Linear Regression
#mpg = f(hp)

lm_mtcars <- lm(mpg ~ hp, data = mtcars)

#Statistic table
summary(lm_mtcars)

#Prediction
#HP == 99
#lm_mtcars$coefficients[[1]] + lm_mtcars$coefficients[[2]]*99
lm_mtcars$coefficients[1] + lm_mtcars$coefficients[2]*99

#Prediction list
new_cars <- data.frame(
            hp = c(59, 69, 79, 89, 199)
)

predict(lm_mtcars, newdata = new_cars)
