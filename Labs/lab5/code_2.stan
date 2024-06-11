data {
 int<lower=0> N;
 array[N] real<lower=0> miles;
 array[N] int<lower=0> accidents;
}
parameters {
 real alpha;
 real theta;
}
model {
 theta ~ normal(0.003, 0.0015);
 alpha ~ normal(2, 1);
 for (i in 1:N) {
 accidents[i] ~ poisson_log(log(alpha + theta * miles[i]));
 }
}
generated quantities {
 array[N] real pred_acc;

 for (i in 1:N) {
 pred_acc[i] = poisson_log_rng(log(alpha + theta * miles[i]));
 }
}