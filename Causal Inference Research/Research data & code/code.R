library(MASS)
library(MatchIt)
library(tidyverse)
library(cobalt)
library(marginaleffects)
library(causaldata)
library("marginaleffects")
head(causaldata::nsw_mixtape)
filtered_data <- nsw_mixtape %>% filter(re78 != 0)

set.seed(1001)

n <- 1000
# Z1 Confounder: BLACK or not
Z1 <- filtered_data$black
# Z2 Confounder: HISP or not
Z2 <- filtered_data$hisp
# Z3 Confounder: MARR or not
Z3 <- filtered_data$marr
# Z4 Confounder: HAS DEGREE or not
Z4 <- filtered_data$nodegree
T <- filtered_data$treat
Y <- filtered_data$re78

# Combine into a data frame
data <- data.frame(T, Z1, Z2, Z3, Z4, Y)


# Apply Propensity Score Matching

# Perform matching
#match <- matchit(T ~ Z1 + Z2 + Z3 + Z4, method = "full", distance = "glm", estimand = "ATE", data = data)
#match


# Full matching on a probit PS
m.out2 <- matchit(treat ~ age + educ + race + married + nodegree + re74 + re75, 
                  data = lalonde, method = "full", distance = "glm", link = "probit")
m.out2


# Checking balance after full matching
summary(m.out2, un = FALSE)
plot(summary(m.out2))
m.data <- match.data(m.out2)
head(m.data)


# Estimate Treatment Effect
# Calculate the ATE
fit <- lm(Y ~ T * (Z1 + Z2 + Z3 + Z4), data = matched_data, weights = weights)

avg_comparisons(fit, variables = "T", vcov = ~subclass, newdata = subset(m.data, treat == 1), wts = "weights")