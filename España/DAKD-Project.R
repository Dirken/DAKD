#DAKD Project
#library(caret)
library(MASS)
#Setting up the working directory
workingPath <- "C:/Users/Meyerhofer/Desktop/DAKD/España/"
setwd(workingPath)

path <- paste0(workingPath, "alldata-train.csv")
spanishTrain <- read.csv(path, header = T, sep = ";", stringsAsFactors = T)

path <- paste0(workingPath, "test-data.csv")
spanishTest <- read.csv(path, header = T, sep = ";", stringsAsFactors = T)

library(e1071)
naive <- naiveBayes(as.factor(FTR) ~ HomeTeam + AwayTeam + B365H  + B365D + B365A + spi1 + spi2 + HomeBudget + AwayBudget + Extrangeros +  ExtrangerosAway, 
                    data=spanishTrain)

spanishTest$FTR <- predict(naive, spanishTest)

sol1 <- NULL
sol1$date <- spanishTest$Date
sol1$ht <- spanishTest$HomeTeam
sol1$at <- spanishTest$AwayTeam
sol1$res <- spanishTest$FTR
sol1
spanishTest$FTR
