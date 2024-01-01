function [moy, stdev] = CalculLoi(Amplitude, NbPoint, EcartType, NbPointSignalUtile)
     
    moy = 0.5 * Amplitude^2 * EcartType^2 * 4 * 32; %NbPointSignal * NbPoint

    var = 0;
    
    %{
    for p = (-NbPoint+1):(NbPoint-1)
        var = var + (1 - abs(p)/NbPoint) * (1 - abs(p)/NbPointSignal)^2 * cos(8*pi*p/NbPointSignal);
    end
    var = var * Amplitude^2 * NbPoint * EcartType^4 * NbPointSignal^2 / 2;
    stdev = sqrt(var);
    %}
    
    %{
    for p = (-32+1):(32-1)
        var = var + (1 - abs(p)/32) * (1 - abs(p)/4)^2 * cos(8*pi*p/4)^2;
    end
    var = var * Amplitude^2 * 32 * EcartType^4 * 4^2 / 2;
    stdev = sqrt(var);
    %}

    array_mean = zeros(1, 100);
    array_std = zeros(1, 100);
    
    for i = 1:100
        present = false;
        SignalSans_i = GenereSignal(EcartType, NbPoint, Amplitude, NbPointSignalUtile, present);
        SignalFiltreSans_i = FQI(SignalSans_i, Amplitude, NbPointSignalUtile);
        array_mean(i) = mean(SignalFiltreSans_i);
        array_std(i) = std(SignalFiltreSans_i);
    end

    moy = mean(array_mean);
    stdev = mean(array_std);
    

end