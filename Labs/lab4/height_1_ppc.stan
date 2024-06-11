generated quantities {
    real mean_height = normal_rng(175, 10);
    real ad_height = normal_rng(10, 5);
    real sampled_height = normal_rng(mean_height, ad_height);
}