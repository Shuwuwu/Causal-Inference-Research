library(MASS)

library(MatchIt)

library(tidyverse)

library(cobalt)

library(marginaleffects)

library(causaldata)

head(causaldata::nsw_mixtape)

filtered_data <- nsw_mixtape %>% filter(re78 != 0)

set.seed(1001)

# Full matching on a probit PS

m.out2 <- matchit(treat ~ age + educ + race + married +
                    
                    nodegree + re74 + re75, data = lalonde,
                  
                  method = "full", distance = "glm", link = "probit")

m.out2



# Checking balance after full matching

summary(m.out2, un = FALSE)



plot(summary(m.out2))



m.data <- match.data(m.out2)



head(m.data)



library("marginaleffects")



## Find ATE

fit <- lm(re78 ~ treat * (age + educ + race + married + nodegree +
                            
                            re74 + re75), data = m.data, weights = weights)



avg_comparisons(fit,
                
                variables = "treat",
                
                vcov = ~subclass,
                
                newdata = subset(m.data, treat == 1),
                
                wts = "weights")
