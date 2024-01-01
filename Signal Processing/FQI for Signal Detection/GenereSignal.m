function Signal = GenereSignal(EcartType, NbPoint, Amplitude, NbPointSignalUtile, present)

    Signal = EcartType * randn(1, NbPoint);
    SignalUtile = GenereSignalUtile(Amplitude, NbPointSignalUtile);

    if present

        startIndex = randi(NbPoint - NbPointSignalUtile + 1);
        Signal(startIndex:startIndex+NbPointSignalUtile-1) = Signal(startIndex:startIndex+NbPointSignalUtile-1) + SignalUtile;
    end
end