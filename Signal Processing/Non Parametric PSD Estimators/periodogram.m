function psd_periodo = periodogram(signal, window, N_freqs)

    psd_estim_raw = abs(fft(xcorr(signal), N_freqs));
    psd_periodo = conv(psd_estim_raw, window, 'same');
end