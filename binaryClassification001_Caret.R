install.packages("caret")
install.packages("tidyverse")
install.packages("mlbench")
install.packages("e1071")

library(caret)
library(tidyverse)
library(mlbench)


#load dataset
data("Sonar")
view(Sonar)
tibble(Sonar)
glimpse(Sonar)
table(Sonar$Class)

#missing value
#without mean display each cell

mean(complete.cases(Sonar))


#Split data
set.seed(99)
train_id <- createDataPartition( 
  Sonar$Class,
  p = 0.8,
  list = FALSE
)

train_data <- Sonar[train_id, ]
test_data <- Sonar[ -train_id, ]

#Train model
#cross validation
set.seed(99)
ctrl <- trainControl(
  method = "cv",
  number = 5, 
  verboseIter = TRUE
)

knnModel <- train(
  Class ~ . ,
  data = train_data,
  method = "knn",
  metric = "Accuracy",
  trControl = ctrl
)

#Prediction
pred <- predict(knnModel, newdata = test_data)

#evaulate
mean(pred == test_data$Class)




