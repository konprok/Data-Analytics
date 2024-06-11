data {
  int<lower=0> N;  // liczba obserwacji
  int<lower=0> K;  // liczba cech
  array[N] int<lower=0, upper=1> y;  // zmienna wynikowa: 0 - brak cukrzycy, 1 - obecność cukrzycy
  matrix[N, K] X;  // macierz cech
}

parameters {
  real global_log_odds;  // ogólny log-odds występowania cukrzycy
  vector[K] beta_0;  // log-odds cech dla klasy 0
  vector[K] beta_1;  // log-odds cech dla klasy 1
}

model {
  // Priors
  global_log_odds ~ normal(logit(0.1), 1);  // logit(0.1) przekształca p = 0.1 na log-odds
  beta_0 ~ normal(0, 1);
  beta_1 ~ normal(0, 1);
  
  // Likelihood
  for (n in 1:N) {
    vector[K] p = y[n] ? beta_1 : beta_0;
    real eta = global_log_odds + dot_product(p, X[n]);  // dodajemy globalny log-odds do liniowej kombinacji
    y[n] ~ bernoulli_logit(eta);  // modelowanie jako rozkład Bernoulliego na logitach
    for (k in 1:K) {
      X[n, k] ~ normal(p[k], 1);  // zakładając jednostkowe odchylenie standardowe
    }
  }
}
