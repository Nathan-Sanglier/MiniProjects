function [Inside, BorneInf, BorneSup] = VerifIntervalleTchebychev(NbEch)

    gamma = 0.9;
    delta = 1 - gamma;
    V = GenereV(NbEch);
    moy_hat = mean(V);
    BorneInf = moy_hat - sqrt(1/delta);
    BorneSup = moy_hat + sqrt(1/delta);
    Inside = (BorneInf < 0 && BorneSup > 0);
end