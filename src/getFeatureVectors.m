function result = getFeatureVectors(img, points)
    result = [];
    N = length(points);
    
    for i = 1:N
       col = points(i,1);
       row = points(i,2);
       
       r1 = row-20;
       r2 = row+19;
       c1 = col-20;
       c2 = col+19;
       
       Isub = img(r1:r2,c1:c2);
       f = fspecial('gaussian');
       Isub = imfilter(Isub, f);
       tmp = downsample(Isub,5);
       Isub = downsample(tmp',5)';
       
       vect = Isub(:);
       vect = vect-mean(vect);
       vect = vect/std(vect);
       
       result = [result vect];
    end
end