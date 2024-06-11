data {
    int<lower=0> N;
    array[N] real weights;
    array[N] real heights;
}
parameters {
    real sigma;
    real alpha;
    real beta;
}
transformed parameters {
    array[N] real mu;
    for (i in 1:N) {
        mu[i] = alpha + beta * weights[i];
    }
}
model {
    sigma ~ exponential(0.067);
    alpha ~ normal(170, 10);
    beta ~ lognormal(0, 1);
    for (i in 1:N) {
        heights[i] ~ normal(mu[i], sigma);
    }
}
generated quantities {
    array[N] real sampled_height;
    for (i in 1:N) {
        sampled_height[i] = normal_rng(mu[i], sigma);
    }
}