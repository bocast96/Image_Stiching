clear; clc;
path = '..\Images\CustomSet1\';
img1 = imread(strcat(path,'1.png'));
img2 = imread(strcat(path,'2.png'));
ims1 = getPanorama(img1,img2, 500, 100, false);
figure;imshow(ims1);

img1 = imread(strcat(path,'3.png'));
img2 = imread(strcat(path,'4.png'));
ims2 = getPanorama(img1,img2, 500, 100, false);
figure;imshow(ims2);

ims5 = getPanorama(ims1,ims2, 500, 100, false);
figure;imshow(ims5);