data {
  int<lower=0> N;
  array[N] int<lower=0, upper=1> y;
  matrix[N, 3] X;
}

parameters {
  real alpha;
  real beta_glucose;
  real beta_bmi;
  real beta_age;
}

model {
  // Priors
  alpha ~ normal(-0.3, 1.3);
  beta_glucose ~ normal(120,31);
  beta_bmi ~ normal(33,7);
  beta_age ~ exponential(0.1);

  // Likelihood
  y ~ bernoulli_logit(alpha + X[,1] * beta_glucose + X[,2] * beta_bmi + X[,3] * beta_age);
}

generated quantities {
  vector[N] log_lik;
  for (i in 1:N) {
    log_lik[i] = bernoulli_logit_lpmf(y[i] | alpha + X[i,1] * beta_glucose + X[i,2] * beta_bmi + X[i,3] * beta_age);
  }
}
