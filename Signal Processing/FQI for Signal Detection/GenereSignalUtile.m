function SignalUtile = GenereSignalUtile(Amplitude, NbPointSignalUtile)

    t = linspace(0, 4*(2*pi), NbPointSignalUtile);
    SignalUtile = Amplitude * sin(t);
end