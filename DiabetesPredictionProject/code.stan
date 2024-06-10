data {
  int<lower=0> N; // liczba obserwacji
  array[N] int<lower=0, upper=1> Outcome; // wynik: 0 lub 1
  matrix[N, 8] predictors; // macierz predyktorów
}

parameters {
  real alpha; // wyraz wolny
  vector[8] beta; // współczynniki dla predyktorów
  real<lower=0> sigma; // odchylenie standardowe
}

model {
  // Priors
  alpha ~ normal(0, 10);
  beta ~ normal(0, 5);
  sigma ~ cauchy(0, 2);

  // Likelihood
  for (n in 1:N) {
    Outcome[n] ~ bernoulli_logit(alpha + predictors[n] * beta);
  }
}
