data {
 int<lower=0> N;
 array[N] real weights;
}
generated quantities {
 real sigma = exponential_rng(0.067);
 real alpha = normal_rng(155, 10);
 real beta = lognormal_rng(0, 1);
 array[N] real height;
 for (i in 1:N) {
 height[i] = normal_rng(alpha + beta * weights[i], sigma);
 }
}