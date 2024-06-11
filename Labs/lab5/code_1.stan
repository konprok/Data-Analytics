data {
 int<lower=0> N;
 array[N] real miles;
}
generated quantities {
 real alpha;
 real theta;
 array[N] real accidents;
 alpha = normal_rng(2, 1);
 theta = normal_rng(0.003, 0.0015);
 for (i in 1:N){
 accidents[i] = poisson_log_rng(log(alpha + theta * miles[i]));
 }
}