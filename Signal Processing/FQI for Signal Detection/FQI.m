function SignalFiltre = FQI(Signal, Amplitude, NbPointSignalUtile)
    
    SignalUtile = GenereSignalUtile(Amplitude, NbPointSignalUtile);
    SignalF_freq = conj(fft(SignalUtile, length(Signal))) .* fft(Signal);
    Signal_F = ifft(SignalF_freq);
    
    SignalFQ = abs(Signal_F).^2;
    
    WindowSize = 32;
    SignalFQI = zeros(1, length(SignalFQ) - WindowSize + 1);
    for i = 1:length(SignalFQI)
        SignalFQI(i) = trapz(SignalFQ(i:i+WindowSize-1));
    end
    
    SignalFiltre = SignalFQI;
end