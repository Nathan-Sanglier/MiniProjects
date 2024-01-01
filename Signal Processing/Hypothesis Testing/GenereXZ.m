function [X, Z] = GenereXZ(NbTirages)

    X = randn(1, NbTirages);
    Z = X.^2 - 1;
end