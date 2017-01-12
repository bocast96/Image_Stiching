function I = getPanorama(img1, img2, nCorners, nMatches, cylindrical)
   %% use Cylindrical images
    % skip this section to use regular images
    if cylindrical == true
        img1 = getCylProj(img1);
        img2 = getCylProj(img2);
        imshowpair(img1,img2,'montage');
    end
    %% get corners
    [~,~,sz] = size(img1);
    if sz==3
        im1 = rgb2gray(img1);
        im2 = rgb2gray(img2);
    else
        im1 = img1;
        im2 = img2;
    end
    im1 = im2double(im1);
    im2 = im2double(im2);
    imC1 = cornermetric(im1);
    C1 = amns(imC1, nCorners);
    imC2 = cornermetric(im2);
    C2 = amns(imC2, nCorners);
    %%
    figure;
    imshow(img1);
    hold on;
    scatter(C1(:,1),C1(:,2),'filled','red');
    hold off;
    
    figure;
    imshow(img2);
    hold on;
    scatter(C2(:,1),C2(:,2),'filled','red');
    hold off;
    %%
    vectors1 = getFeatureVectors(im1,C1);
    vectors2 = getFeatureVectors(im2,C2);
    
    %%
    [m1, m2] = getBestMatches(vectors1, vectors2, nMatches, C1, C2);
    figure;
    showMatchedFeaturesCustom(img1, img2, m1, m2,'montage');
    
    %% removing duplicates
    [m1, m2] = removeDups(m1,m2);
    figure;
    showMatchedFeaturesCustom(img1, img2, m1, m2,'montage');
    
    %% Ransac
    [H, m1, m2] = ransac(m1,m2);
    figure;
    showMatchedFeaturesCustom(img1, img2, m1, m2,'montage');
    
    %% stiching
    I = stitch(img1,img2, H);
end