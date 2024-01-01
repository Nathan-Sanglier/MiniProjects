function signal = init_signal(noise, a, b)
    
    signal = filter(b, a, noise); % H(v) = sum of b_i * z^(-i) over sum of a_i * z^(-i) where z = exp(2*pi*j*v*Ts)
end