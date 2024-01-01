function p = SelectionAIC(Signal)

    array_aic = zeros(1, 10);

    for p_val = 1:10
        
        [~, ~, Erreur] = YuleWalker(Signal, p_val);
        Aic = length(Signal) * log(Erreur) + 2  * p_val;
        array_aic(p_val) = Aic;

    end

    [~,p] = min(array_aic);

end