function result = amns(imC, nBest)
    %im = rgb2gray(im);
    %imC = cornermetric(im);
    iMax = imregionalmax(imC);
    [row, col] = find(iMax==1);
    [mx my] = size(imC);
    N = length(row);
    r = inf(1,N);
    x = zeros(1,nBest);
    y = zeros(1,nBest);
    
    for i = 1:N
        if row(i) > 20 && row(i) < (mx-20) && col(i) > 20 && col(i) < (my-20)
            for j = 1:N
                if imC(row(j),col(j)) > imC(row(i),col(i))
                    ed = (row(j)-row(i))^2 + (col(j)-col(i))^2;

                    if ed < r(i)
                        r(i) = ed;
                    end
                end
            end
        else
            r(i) = -r(i);
        end
    end
    
    [sorted, OgIdx] = sort(r, 'descend');
    
    for i = 1:nBest
        idx = OgIdx(i);
        x(i) = col(idx);
        y(i) = row(idx);
        
    end
    
    result = [x', y'];
end