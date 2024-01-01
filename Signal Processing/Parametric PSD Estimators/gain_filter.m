function gain = gain_filter(a, b, N_freqs, fs)
    
    h = freqz(b, a, N_freqs, 'whole', fs); % The periodicity of the transfer function is fs (H(v+fs) = H(v) and H(v-fs) = H(v))
    gain = abs(h);
end