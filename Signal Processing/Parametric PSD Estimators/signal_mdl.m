function mdl = signal_mdl(signal, p)
    
    [~, mse] = yule_walker(signal, p);
    mdl = length(signal) * log(mse) + log(length(signal)) * p;
end