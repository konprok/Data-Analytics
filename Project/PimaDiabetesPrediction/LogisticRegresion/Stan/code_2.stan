data {
  int<lower=0> N;
  array[N] int<lower=0, upper=1> y;
  matrix[N, 6] X;
}

parameters {
  real alpha;
  real beta_glucose;
  real beta_age;
  real beta_bmi;
  real beta_bp;
  real beta_insulin;
  real<lower=0> beta_dpf;
}

model {
  // Priors
  alpha ~ normal(-0.3, 1.3);
  beta_glucose ~ normal(110, 25);
  beta_age ~ exponential(0.1);
  beta_bmi ~ normal(33, 6);
  beta_bp ~ normal(75, 12);
  beta_insulin ~ normal(130, 70);
  beta_dpf ~ normal(0.35, 0.35);

  // Likelihood
  y ~ bernoulli_logit(alpha + X[,1] * beta_glucose + X[,2] * beta_age + X[,3] * beta_bmi + X[,4] * beta_bp + X[,5] * beta_insulin + X[,6] * beta_dpf);
}

generated quantities {
  vector[N] log_lik;
  for (i in 1:N) {
    log_lik[i] = bernoulli_logit_lpmf(y[i] | alpha + X[i,1] * beta_glucose + X[i,2] * beta_age + X[i,3] * beta_bmi + X[i,4] * beta_bp + X[i,5] * beta_insulin + X[i,6] * beta_dpf);
  }
}
