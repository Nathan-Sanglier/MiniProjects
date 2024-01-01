function psd_correlo = correlogram(signal, window, N_freqs)
    
    M = (length(window) - 1) / 2;
    r = xcorr(signal, M);
    psd_correlo =  abs(fft(window .* r, N_freqs));
end