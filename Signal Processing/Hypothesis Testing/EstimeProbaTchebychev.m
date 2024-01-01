function Proba2 = EstimeProbaTchebychev(NbEch, NbTests)
    
    count = 0;
    for test = 1:NbTests

        [Inside, ~, ~] = VerifIntervalleTchebychev(NbEch);
        if Inside
            count = count + 1;
        end
    end

    Proba2 = count / NbTests;
end