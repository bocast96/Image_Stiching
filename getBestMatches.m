function [m1, m2] = getBestMatches(vectors1, vectors2, nPoints, Points1, Points2)
    ln1 = length(vectors1(1,:));
    rats = zeros(ln1, 1);
    pts = zeros(ln1, 1);
    m1 = zeros(nPoints, 2);
    m2 = zeros(nPoints, 2);
    for i = 1:ln1
        ln2 = length(vectors2(2,:));
        ssds = zeros(1,ln2);
        for j = 1:ln2
            ssds(j) = SSD(vectors1(:,i), vectors2(:,j));
        end
        [sorted, idx] = sort(ssds);
        rats(i) = sorted(1)/sorted(2);
        pts(i) = idx(1);
    end
    [sorted, idx] = sort(rats);
    
    for i = 1:nPoints
       m1(i,:) = Points1(idx(i),:);
       m2(i,:) = Points2(pts(idx(i)),:);
    end
    
end