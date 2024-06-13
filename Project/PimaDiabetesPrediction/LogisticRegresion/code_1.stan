data {
  int<lower=0> N;  // liczba obserwacji
  array[N] int<lower=0, upper=1> y;  // wynik: 0 lub 1
  matrix[N, 3] X;  // macierz predyktorów: Glukoza, Wiek, BMI
}

parameters {
  real alpha;  // wyraz wolny
  real beta_glucose;  // współczynnik dla glukozy
  real beta_age;  // współczynnik dla wieku
  real beta_bmi;  // współczynnik dla BMI
}

model {
  // Priors
  alpha ~ normal(0, 1);
  beta_glucose ~ normal(0.5, 0.1);  // Prior dla współczynnika glukozy
  beta_age ~ normal(0.3, 0.05);  // Prior dla współczynnika wieku
  beta_bmi ~ normal(0.2, 0.1);  // Prior dla współczynnika BMI

  // Likelihood
  y ~ bernoulli_logit(alpha + X[,1] * beta_glucose + X[,2] * beta_age + X[,3] * beta_bmi);
}
