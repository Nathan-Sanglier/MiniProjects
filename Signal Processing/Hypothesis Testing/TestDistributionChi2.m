function Adaptation = TestDistributionChi2(Z, N, CoefficientConfiance)
    
    ExpectedProbaZ = CalculProba(N);
    HistoZ = zeros(1, 2*N);
    z = 0:(2*N);

    for k = 1:length(Z)
        
        i = 0;
        attribue_z = false;
        while i + 1 <= length(z) - 1 && ~attribue_z
            i = i + 1;
            if  Z(k) < z(i+1) && Z(k) > z(i)
                HistoZ(i) = HistoZ(i) + 1;
                attribue_z = true;
            end
        end
    end
    
    NbReals = sum(HistoZ);
    TestStat = sum((HistoZ - NbReals * ExpectedProbaZ).^2 ./ (NbReals * ExpectedProbaZ))
    threshold = chi2inv(CoefficientConfiance, 2 * N - 1)
    Adaptation = TestStat < threshold;
end