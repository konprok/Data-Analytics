data {
  int<lower=0> N;  // liczba obserwacji
  array[N] int<lower=0, upper=1> y;  // zmienna odpowiedzi binarnej
  matrix[N, 6] X;  // macierz predyktorów
}

parameters {
  real alpha;  // wyraz wolny
  real beta_glucose;  // współczynnik dla glukozy
  real beta_age;  // współczynnik dla wieku
  real beta_bmi;  // współczynnik dla BMI
  real beta_bp;  // współczynnik dla ciśnienia krwi
  real beta_insulin;  // współczynnik dla insuliny
  real<lower=0> beta_dpf;  // współczynnik dla Diabetes Pedigree Function z ograniczeniem dolnym
}

model {
  // Priors
  alpha ~ normal(-0.3, 1.3);
  beta_glucose ~ normal(110, 25);  // Glukoza
  beta_age ~ exponential(0.1);  // Wiek
  beta_bmi ~ normal(33, 6);  // BMI
  beta_bp ~ normal(75, 12); // BloodPressure
  beta_insulin ~ normal(130, 70); // Insulina
  beta_dpf ~ normal(0.35, 0.35); // DiabetesPedigreeFunction z ograniczeniem dolnym

  // Likelihood
  y ~ bernoulli_logit(alpha + X[,1] * beta_glucose + X[,2] * beta_age + X[,3] * beta_bmi + X[,4] * beta_bp + X[,5] * beta_insulin + X[,6] * beta_dpf);
}

generated quantities {
  vector[N] log_lik;
  for (i in 1:N) {
    log_lik[i] = bernoulli_logit_lpmf(y[i] | alpha + X[i,1] * beta_glucose + X[i,2] * beta_age + X[i,3] * beta_bmi + X[i,4] * beta_bp + X[i,5] * beta_insulin + X[i,6] * beta_dpf);
  }
}
