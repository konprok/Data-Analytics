data {
    int<lower=1> N;
}

parameters {
    array[N] real y;
    real theta;
}

model {
    y ~ normal(theta, 1);
    theta ~ normal(0, 1);
}