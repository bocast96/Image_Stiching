%% set 4
img1 = imread('C:\Users\Boris\Documents\School\CS 426 Image Processing\Project2\Images\Set4\1.png');
img2 = imread('C:\Users\Boris\Documents\School\CS 426 Image Processing\Project2\Images\Set4\2.png');

ims1 = getPanorama(img1,img2, 500, 100, false);
figure;imshow(ims1);
%%
img1 = imread('C:\Users\Boris\Documents\School\CS 426 Image Processing\Project2\Images\Set4\3.png');
img2 = imread('C:\Users\Boris\Documents\School\CS 426 Image Processing\Project2\Images\Set4\4.png');

ims2 = getPanorama(img1,img2, 500, 100, false);
figure;imshow(ims2);
%%
ims = getPanorama(ims1,ims2, 500, 100, false);
figure;imshow(ims);
