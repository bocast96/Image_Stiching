function [rat, idx, X, Y] = getInliers(xh, yh, pts)
    tot = length(xh);
    ct = 0;
    
    for i = 1:tot
        tmp = sqrt((pts(i,1) - xh(i))^2 + (pts(i,2) - yh(i))^2);
        if tmp < 5
            ct = ct+1;
            idx(ct) = i;
            X(ct) = xh(i);
            Y(ct) = yh(i);
        end
    end
    rat = (ct/tot)*100;
end