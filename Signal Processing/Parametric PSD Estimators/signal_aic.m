function aic = signal_aic(signal, p)
    
    [~, mse] = yule_walker(signal, p);
    aic = length(signal) * log(mse) + 2 * p;
end