data {
  int<lower=0> N;
}

generated quantities {
  real glucose = normal_rng(120, 31);
  real age_base = 21; 
  real lambda_age = 0.1;
  real age = age_base + exponential_rng(lambda_age);
  real bmi = normal_rng(33, 7);
  real blood_pressure = normal_rng(70, 12);
  real pregnancies = exponential_rng(0.283);
  real<lower=10> insulin = normal_rng(115, 70);
  real<lower=0.085> dpf = normal_rng(0.35, 0.35);
}