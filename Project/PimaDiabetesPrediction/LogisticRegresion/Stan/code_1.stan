data {
  int<lower=0> N;  // liczba obserwacji
  array[N] int<lower=0, upper=1> y;  // wynik: 0 lub 1
  matrix[N, 3] X;  // macierz predyktorów: Glukoza, Wiek, BMI mozna zmienic
}

parameters {
  real alpha;  // wyraz wolny
  real beta_glucose;  // współczynnik dla glukozy
  real beta_bmi;  // współczynnik dla BMI
  real beta_age;  // współczynnik dla wieku
}

model {
  // Priors
  alpha ~ normal(-0.3, 1.3);
  beta_glucose ~ normal(110,25);  // Prior dla współczynnika glukozy
  beta_bmi ~ normal(33,6);  // Prior dla współczynnika BMI
  beta_age ~ exponential(0.1);  // Prior dla współczynnika wieku

  // Likelihood
  y ~ bernoulli_logit(alpha + X[,1] * beta_glucose + X[,2] * beta_bmi + X[,3] * beta_age);
}

generated quantities {
  vector[N] log_lik;
  for (i in 1:N) {
    log_lik[i] = bernoulli_logit_lpmf(y[i] | alpha + X[i,1] * beta_glucose + X[i,2] * beta_bmi + X[i,3] * beta_age);
  }
}
