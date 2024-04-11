data {
  int<lower=0> N;                  // Liczba próbek
  vector[N] heights;               // Wysokości
  vector[N] centered_weight;      // Ośrodka waga
}

parameters {
  real alpha;                      // Wyraz wolny
  real beta_1;                     // Współczynnik predyktora
  real beta_2;                     // Współczynnik drugiej potęgi predyktora
  real<lower=0> sigma;             // Odchylenie standardowe
}

model {
  alpha ~ normal(170, 10);         // Prior dla wyrazu wolnego
  beta_1 ~ normal(0, 1);           // Prior dla współczynnika predyktora
  beta_2 ~ normal(0, 1);           // Prior dla współczynnika drugiej potęgi predyktora
  sigma ~ normal(15, 5);           // Prior dla odchylenia standardowego
  
  // Likelihood
  for (i in 1:N) {
    real mu = alpha + beta_1 * centered_weight[i] + beta_2 * centered_weight[i]^2;  // Model liniowy z drugą potęgą
    heights[i] ~ normal(mu, sigma);                                                  // Likelihood dla danych wysokości
  }
}

generated quantities {
  real mu[N];                      // Średnia wartość wysokości
  for (i in 1:N) {
    mu[i] = normal_rng(alpha + beta_1 * centered_weight[i] + beta_2 * centered_weight[i]^2, sigma);  // Generowanie średniej wartości wysokości
  }
}