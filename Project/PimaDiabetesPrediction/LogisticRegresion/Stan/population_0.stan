data {
  int<lower=0> N;  // liczba symulacji
}

generated quantities {
  real glucose = normal_rng(110, 25);
  real age_base = 21;  // Wiek zaczyna się od 21 lat
  real lambda_age = 0.1;  // Parametr lambda dla rozkładu wykładniczego
  real age = age_base + exponential_rng(lambda_age);  // Wiek z rozkładu wykładniczego, przesunięty o bazowy wiek 21 lat
  real bmi = normal_rng(33, 6);
  real blood_pressure = normal_rng(75, 12);
  real pregnancies = exponential_rng(0.283);
  real insulin = normal_rng(130, 70);
  real<lower=0> dpf = normal_rng(0.35, 0.32);
  //real pregnancies = poisson_rng(1.5);
}