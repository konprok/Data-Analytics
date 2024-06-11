data {
  int<lower=0> N;  // liczba obserwacji
  int<lower=0> K;  // liczba zmiennych objaśniających
  matrix[N, K] X;  // macierz zmiennych objaśniających
  array[N] int<lower=0, upper=1> y;  // wektor zmiennej zależnej (0 lub 1)
}

parameters {
  vector[K] beta;  // współczynniki regresji
  real alpha;  // wyraz wolny
}

model {
  // Priory - bazując na wcześniejszej wiedzy
  beta ~ normal(0, 2.5);  // umiarkowane priory wokół 0 z odchyleniem 2.5
  alpha ~ normal(logit(0.1), 1);  // logit(0.1) odzwierciedla częstość występowania cukrzycy (10%)

  // Funkcja wiarygodności
  y ~ bernoulli_logit(X * beta + alpha);
}
