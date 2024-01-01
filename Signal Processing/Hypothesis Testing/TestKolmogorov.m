function Adaptation = TestKolmogorov(Z, N, CoefficientConfiance)

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

    TestStat = max(abs(cumsum(ExpectedProbaZ) - cumsum(HistoZ / sum(HistoZ))))
    NbReals = sum(HistoZ);
    threshold = sqrt(-log((1 - CoefficientConfiance) / 2) / (2 * NbReals))
    Adaptation = TestStat < threshold;
end