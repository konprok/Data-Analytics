generated quantities {
    real Pregnancies = 1 + exponential_rng(1);
    real Glucose = normal_rng(130, 50);
    real BloodPressure = normal_rng(65, 30);
    real SkinThickness = normal_rng(40, 10);
    real Insulin = normal_rng(100, 25);
    real BMI = normal_rng(40, 10);
    real DiabetesPedigreeFunction = normal_rng(0.5, 0.1);
    real Age = 21 + exponential_rng(0.05);  // Niska wartość parametru, zakładamy, że wiek jest rozłożony na szerszym zakresie
    //int Outcome = bernoulli_rng(inv_logit(-6 + 0.05 * Glucose + 0.035 * Age + 0.025));  // Model logistyczny
    int Outcome = bernoulli_rng(inv_logit(-13 + 0.05 * Glucose + 0.035 * Age + 0.025 * Pregnancies + 0.02 * BloodPressure + 0.025 * SkinThickness + 0.03 * Insulin + 0.025 * BMI + 0.02 * DiabetesPedigreeFunction));  // Model logistyczny
}
