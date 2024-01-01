function Detection = TestHypothese(SignalFiltre, CoefficientConfiance, Amplitude, NbPoint, EcartType, NbPointSignalUtile)

    m = max(SignalFiltre);
    [moy, stdev] = CalculLoi(Amplitude, NbPoint, EcartType, NbPointSignalUtile);
    threshold = norminv(CoefficientConfiance, moy, stdev);
    Detection = m > threshold;
end