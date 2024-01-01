function noise = init_noise(N, stdev)

    noise = stdev * randn(1, N); % Gaussian Noise
end