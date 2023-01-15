data {
  int<lower=0> N; 
  vector[N] y; 
}

parameters {
  real alpha;
  vector[4] beta;
  real<lower=0> sigma;
}

model {
 for (i in 64:N)
    y[i] ~ normal(alpha + beta[1] * y[i-1] + beta[2] * mean(y[i-5:i-1]) + beta[3] * mean(y[i-22:i-1]) + beta[4] * mean(y[i-63:i-1]), sigma);
}
