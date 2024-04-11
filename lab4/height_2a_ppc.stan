data {
  int<lower=0> N;  // Liczba próbek
  real weight[N];  // Waga
}

parameters {
  real alpha;  // Wyraz wolny
  real beta;  // Współczynnik predyktora
  real<lower=0> sigma;  // Odchylenie standardowe wzrostu
}

model {
  alpha ~ normal(170, 10);  // Prior dla wyrazu wolnego
  beta ~ normal(0, 1);  // Prior dla współczynnika predyktora
  sigma ~ normal(15, 5);  // Prior dla odchylenia standardowego wzrostu
  
  // Likelihood
  for (i in 1:N) {
    real mu = alpha + beta * weight[i];  // Model liniowy
    height[i] ~ normal(mu, sigma);  // Likelihood dla danych wysokości
  }
}

generated quantities {
  real height_sim[N];  // Generowanie wysokości z dopasowanego modelu
  for (i in 1:N) {
    height_sim[i] = normal_rng(alpha + beta * weight[i], sigma);  // Generowanie wysokości
  }
}
