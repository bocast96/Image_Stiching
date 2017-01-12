function [H, m1, m2]= ransac(src, target)
    ln = length(src);
    score = 0;
    N = 100;
    
    for i = 1:N
        rndPts = randperm(ln, 4);
        Xdst = zeros(4,1);
        Ydst = zeros(4,1);
        Xsrc = zeros(4,1);
        Ysrc = zeros(4,1);
        for i = 1:4
            Xsrc(i) = src(rndPts(i),1);
            Ysrc(i) = src(rndPts(i),2);
            Xdst(i) = target(rndPts(i),1);
            Ydst(i) = target(rndPts(i),2);
        end
        H = est_homography(Xdst, Ydst, Xsrc, Ysrc);
        H = H./H(3,3);
        [Xh, Yh] = apply_homography(H, src(:,1), src(:,2));
        [rat, idx, Xtmp, Ytmp] = getInliers(Xh, Yh, target);
        if rat > 0 && rat > score
            pts = idx;
            Xinlier = Xtmp';
            Yinlier = Ytmp';
            if rat >= 90
                break;
            end
        end
    end
    
    ln = length(pts);
    Xsrc = zeros(ln,1);
    Ysrc = zeros(ln,1);
    for i = 1:ln
        Xsrc(i) = src(pts(i),1);
        Ysrc(i) = src(pts(i),2);
    end
    H = est_homography(Xinlier, Yinlier, Xsrc, Ysrc);
    H = H./H(3,3);
    m1 = [Xsrc, Ysrc];
    m2 = [Xinlier, Yinlier];
end







