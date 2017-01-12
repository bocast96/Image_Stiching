function result = getCylProj(img)
    img = im2double(img);
    [szY, szX, ~] = size(img);
    xc = floor(szX/2);
    yc = floor(szY/2);
    f = 300;
    
    ys = 1:szY;
    xs = 1:szX;
    tmp = zeros(szY,szX,2);
    
    for i = 1:szY
        for j = 1:szX
            y = ceil(((ys(i)-yc)/cos((xs(j)-xc)/f)) + yc);
            x = ceil(f*tan((xs(j)-xc)/f)+xc);
            tmp(i,j,:) = [y,x];
        end
    end

    result = zeros(szY,szX,3);
    
    for i = 1:szY
        for j = 1:szX
            y = tmp(i,j,1);
            x = tmp(i,j,2);
            if y > 1 && y <= szY && x > 1 && x <= szX
                result(i,j,:) = img(y,x,:);
            end
        end
    end   
end