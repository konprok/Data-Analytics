data {
  int<lower=0> N;  // Liczba próbek
  real heights[N];  // Wysokości
}

parameters {
  real mu;  // Średnia wzrostu
  real<lower=0> sigma;  // Odchylenie standardowe wzrostu
}

model {
  mu ~ normal(170, 10);  // Prior dla średniej wzrostu
  sigma ~ normal(15, 5);  // Prior dla odchylenia standardowego wzrostu
  
  // Likelihood
  heights ~ normal(mu, sigma);  // Likelihood dla danych wysokości
}

generated quantities {
  real height_sim = normal_rng(mu, sigma);  // Generowanie wysokości z dopasowanego modelu
}