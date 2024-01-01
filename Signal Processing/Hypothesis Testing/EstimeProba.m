function Proba1 = EstimeProba(NbEch, NbTests)
    
    count = 0;
    for test = 1:NbTests

        [Inside, ~, ~] = VerifIntervalle(NbEch);
        if Inside
            count = count + 1;
        end
    end

    Proba1 = count / NbTests;
end