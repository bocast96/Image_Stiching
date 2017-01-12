clear; clc;

%% fisrt set
img1 = imread('..\Images\Set1\1.jpg');
img2 = imread('..\Images\Set1\2.jpg');

ims = getPanorama(img1,img2, 500, 100, true);
figure;imshow(ims);
%% doesnt work
%{
img3 = imread('C:\Users\Boris\Documents\School\CS 426 Image Processing\Project2\Images\Set1\3.jpg');
ims = getPanorama(img3,ims, 500, 100, false);
figure;imshow(ims);
%}