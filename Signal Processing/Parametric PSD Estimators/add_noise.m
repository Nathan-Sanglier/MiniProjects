function noisy_signal = add_noise(signal, SNR)

    autocorr_0 = xcorr(signal, 0);

    stdev = sqrt(autocorr_0 * 10^(-SNR/10));

    noisy_signal = signal + stdev * randn(1, length(signal));
end