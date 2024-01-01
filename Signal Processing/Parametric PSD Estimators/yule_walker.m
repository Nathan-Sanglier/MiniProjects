function [coeffs, mse] = yule_walker(signal, p)


    [autocorr, lags] = xcorr(signal, p);
    R = zeros(p, p);
    
    for i = 1:p
        for j = i:p
    
            R(i, j) = autocorr(lags == i-j);
            R(j, i) = R(i, j);
        end
    end

    U = zeros(p, 1);
    for i = 1:p
        U(i) = autocorr(lags == i);
    end

    coeffs = R \ U; % The coeffs are such that X_pred(n) = sum for i=1 to p of coeff_i * X(n-i)
    
    mse = mean(filter([1; -coeffs]', 1, signal).^2); % We have output X(n) and entry error(n) st X(n) - sum for i=1 to p of coeff_i * X(n-i) = e(n)
end