ubank.df <- UniversalBank
ubank.df <- ubank.df[ , -c(1,5)]

ubank.df$Education <- factor(ubank.df$Education,
                                levels = c(1,2,3),labels = c("Undergrad","Graduate","Professional"))
set.seed(2)
train.index <- sample(c(1:dim(ubank.df)[1]), dim(ubank.df)[1]*0.6)                              
train.df <- ubank.df[train.index, ]
valid.df <- ubank.df[-train.index, ]

#General Linear Model regression
logit.reg <- glm(Personal.Loan ~ ., data = train.df, family = "binomial")
options(scipen=999)
summary(logit.reg)
#Most important predictors: Age, Income, Family, Education, Credit Card, and Online


