data {
    int<lower=1> N;
}

parameters {
    array[N] real y;
    real theta;
}

model {
    target += normal_lpdf(y | theta, 1);
    target += normal_lpdf(theta | 0, 1);
}