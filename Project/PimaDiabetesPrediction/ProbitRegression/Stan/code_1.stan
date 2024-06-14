data {
  int<lower=0> N;  // liczba obserwacji
  array[N] int<lower=0> y;  // liczba sukcesów dla każdej obserwacji
  array[N] int<lower=0> trials;  // liczba prób dla każdej obserwacji
  matrix[N, 3] X;  // macierz predyktorów, K to liczba predyktorów
}

parameters {
  real alpha;  // wyraz wolny
  real beta_glucose;
  real beta_bmi;
  real beta_insulin;
}

model {
  alpha ~ normal(-0.8, 0.5);
  beta_glucose ~ normal(110, 25);
  beta_bmi ~ normal(33, 6);
  beta_insulin ~ normal(130, 60);

  for (i in 1:N) {
    real p = inv_logit(alpha + X[i,1] * beta_glucose + X[i,2] * beta_bmi + X[i,3] * beta_insulin);  // prawdopodobieństwo sukcesu
    y[i] ~ binomial(trials[i], p);
  }
}
