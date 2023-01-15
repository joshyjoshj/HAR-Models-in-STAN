data {
  int<lower=0> N; 
  vector[N] y; 
  int K; 
  int lags[K]; 
}

parameters {
  real alpha;
  vector[K] beta;
  real<lower=0> sigma;
}

model {
  for (i in max(lags)+1:N) {
    vector[K] lag_preds;
    for (j in 1:K)
      lag_preds[j] = mean(y[i-lags[j]:i-1]);
    y[i] ~ normal(alpha + dot_product(beta, lag_preds), sigma);
  }
}
