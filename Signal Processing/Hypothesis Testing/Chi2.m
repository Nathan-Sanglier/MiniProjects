function [Densite, Intervalle] = Chi2(n)

    Intervalle = linspace(0, 4*n, 100);
    Densite = chi2pdf(Intervalle, n);
end