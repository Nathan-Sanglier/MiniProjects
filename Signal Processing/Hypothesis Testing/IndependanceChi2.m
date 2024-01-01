function Independance = IndependanceChi2(HistoX, HistoZ, HistoXZ, CoefficientConfiance)

    ExpectedProbaXZ = (HistoX' * HistoZ) / (sum(HistoX) * sum(HistoZ));
    NbReals = sum(HistoXZ, 'all');
    TestStat = sum((HistoXZ - NbReals * ExpectedProbaXZ).^2 ./ (NbReals * ExpectedProbaXZ), 'all')
    threshold = chi2inv(CoefficientConfiance, length(HistoX) * length(HistoZ) - 1)
    Independance = TestStat < threshold;
end