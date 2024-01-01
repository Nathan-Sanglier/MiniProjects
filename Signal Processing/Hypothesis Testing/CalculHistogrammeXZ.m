function [HistoX, HistoZ, HistoXZ] = CalculHistogrammeXZ(X, Z)

    x = [-2, -1, 0, 1, 2];
    z = [-1, 0, 1, 2, 3];

    HistoX = zeros(1, length(x) - 1);
    HistoZ = zeros(1, length(z) - 1);
    HistoXZ = zeros(length(x) - 1, length(z) - 1);

    for k = 1:length(X)
        
        i = 0;
        attribue_x = false;
        while i + 1 <= length(x) - 1 && ~attribue_x
            i = i + 1;
            if  X(k) < x(i+1) && X(k) > x(i)
                HistoX(i) = HistoX(i) + 1;
                attribue_x = true;
            end
        end

        j = 0;
        attribue_z = false;
        while j + 1 <= length(z) - 1 && ~attribue_z
            j = j + 1;
            if  Z(k) < z(j+1) && Z(k) > z(j)
                HistoZ(j) = HistoZ(j) + 1;
                attribue_z = true;
            end
        end

        if attribue_x && attribue_z

            HistoXZ(i, j) = HistoXZ(i, j) + 1;
        end

    end
end