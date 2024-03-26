parameters {
    real theta;
}

model {
    // gamma density valid only for positive values of theta
    theta ~ gamma(1.25, 1.25);
}