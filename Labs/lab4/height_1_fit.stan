data{
    int N;
    array[N] real heights;
}

parameters {
   real mu;
   real<lower=0> sigma;
}

model {
   mu ~ normal(178, 20);
   sigma ~ normal(15,5);
   heights ~ normal(mu, sigma);
}

generated quantities {
   real height = normal_rng(mu, sigma);
}