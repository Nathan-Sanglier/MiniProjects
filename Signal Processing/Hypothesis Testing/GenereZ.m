function Z = GenereZ(NbTirages, N)

    %Z = sum(randn(N, NbTirages).^2, 1);
    Z = chi2rnd(N, NbTirages);
end