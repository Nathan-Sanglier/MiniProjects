function [coeffs, mse] = levinson(signal, p)

    matrix_coeffs = zeros(p, p);
    array_rho = zeros(1, p);
    [autocorr, lags] = xcorr(signal, p);
    
    % m = 1
    matrix_coeffs(1, 1) = -autocorr(lags == 1) / autocorr(lags == 0); % k = 1
    for k = 2:p
       
        matrix_coeffs(1, k) = matrix_coeffs(1, 1); % To verify if a_(m-1) (k) = 1 ???
    end
    array_rho(1) = autocorr(lags == 0) * (1 - matrix_coeffs(1, 1))^2;

    for m = 2:p
        
        % k = m
        delta = sum(matrix_coeffs(m-1, m) * autocorr(ismember(lags, m - (1:m-1))));
        matrix_coeffs(m, m) = delta / array_rho(m-1);

        for k = 1:m-1
            matrix_coeffs(m, k) = matrix_coeffs(m-1, k) + matrix_coeffs(m, m) * matrix_coeffs(m-1, m-k);
        end

        array_rho(m) = array_rho(m-1) * (1 - matrix_coeffs(m, m))^2;

    end
    
    coeffs = matrix_coeffs(p, :)';
    mse = mean(filter([1; -coeffs]', 1, signal).^2); % We have output X(n) and entry error(n) st X(n) - sum for i=1 to p of coeff_i * X(n-i) = e(n)
end