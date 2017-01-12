clear; clc;
%% second set doesn't work properly
img1 = imread('..\Images\Set2\1.jpg');
img2 = imread('..\Images\Set2\2.jpg');

ims = getPanorama(img1,img2, 1000, 500, false);
figure;imshow(ims);

%%
img3 = imread('..\Images\Set2\3.jpg');
ims2 = getPanorama(img3,ims, 1000, 500, false);
figure;imshow(ims2);