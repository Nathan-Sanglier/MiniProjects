function [Inside, BorneInf, BorneSup] = VerifIntervalle(NbEch)
    
    gamma = 0.9;
    delta = 1 - gamma;
    V = GenereV(NbEch);
    moy_hat = mean(V);
    quantile = norminv(1 - delta / 2, 0, 1);
    BorneInf = moy_hat - quantile / sqrt(NbEch);
    BorneSup = moy_hat + quantile / sqrt(NbEch);
    Inside = (BorneInf < 0 && BorneSup > 0);
end