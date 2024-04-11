generated quantities {
    // Definicja zmiennych
    int<lower=0> N = 50;  
    int<lower=0, upper=N> y;  
    real<lower=0, upper=1> p;  

    // random number generator
    p = beta_rng(16, 64);  

    // sample from binomial distribution
    y = binomial_rng(N, p);
}