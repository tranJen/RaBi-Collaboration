# RaBi-Collaboration

## Where to find files

### Summarized Report for GLM
RaBi_Collaboration Report__Suong Tran. pdf

### Chemistry Honors Thesis
Chemistry Honor Thesis__Suong Tran.pdf

#### Navigate each folder with experiment name to find the raw data and coding scripts for plot

  - Developing GLM for predict contribution of each LgBiT mutants to binding preference between SmBiTs
  - Testing predicted LgBiT mutants

## The GLM
#### *glm(formula = response_var ~ predictor, data= , family= )*
#### To analyze the output of model:
  - The coefficient estimate in the output indicate the average change in the log odds of the response variable associated with a one unit increase in each predictor variable. 

  - The standard error give us an idea of the variability associated with the coefficient estimate. 

  - z-value = coef. est / std. error

  - p- value tells how well each predictor variable is able to predict the value of the response variable in the model. 
Depending on our preference of significant level, the predictor is whether statistically significant. The smaller the              p-value, the more significant the predictor is.

  - AIC ( The Akaike information criterion) is a metric that is used to compare the fit of different regression models. The lower the value, the better the regression model is able to fit the data. 
  
  - The number of Fisher Scoring iterations: indicates how many times the algorithm was run to estimate the parameters of the model. More iterations may be required for complex models or when the convergence criteria are set to be more stringent.

#### To choose family function when fitting glm in R

  - Gaussian family : for continuous decimal data with normal distribution.
  - Poisson or quasi-poisson family: for positive integer or small natural number like count, individual number, frequency.
  - Binomial or quasi-binomial family: binary data like 0 and 1
  - Gamma family : usually describe time data like the time or duration of the occurrence of the event.
