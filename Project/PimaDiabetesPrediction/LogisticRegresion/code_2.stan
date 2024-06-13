data {
  int<lower=0> N;
  array[N] int<lower=0, upper=1> y;
  matrix[N, 5] X;
}

parameters {
  real alpha;
  real beta_glucose;
  real beta_age;
  real beta_bmi;
  real beta_dpf;
  real beta_bp;
}

model {
  // Priors
  alpha ~ normal(0, 1);
  beta_glucose ~ normal(0.4, 0.1);  // Glukoza
  beta_age ~ normal(0.30, 0.1);  // Age
  beta_bmi ~ normal(0.20, 0.1);  //  BMI
  beta_dpf ~ normal(0.1, 0.05); // DiabetesPedigreeFunction
  beta_bp ~ normal(0.15, 0.05); // BloodPressure

  // Likelihood
  y ~ bernoulli_logit(alpha + X[,1] * beta_glucose + X[,2] * beta_age + X[,3] * beta_bmi + X[,4] * beta_dpf + X[,5] * beta_bp);
}
