function [m1, m2] = removeDups(pts, target)
    [C, ia, ic] = unique(target, 'rows');
    u = unique(ic);
    n = histc(ic,u);
    ids = find(n>1);
    r = C(ids,:);
    q = ismember(target,r,'rows');
    ids = find(q==0);
    ln = length(ids);
    m1 = zeros(ln,2);
    m2 = zeros(ln,2);
    
    for i = 1:ln
        m1(i,:) = pts(ids(i),:);
        m2(i,:) = target(ids(i),:);
    end
end