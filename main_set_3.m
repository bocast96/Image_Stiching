%% third set
path = '..\Images\Set3\';
img1 = imread(strcat(path,'1.jpg'));
img2 = imread(strcat(path,'2.jpg'));
ims1 = getPanorama(img1,img2, 1000, 500, false);
figure;imshow(ims1);

%%
img3 = imread(strcat(path,'3.jpg'));
img4 = imread(strcat(path,'4.jpg'));
ims2 = getPanorama(img3,img4, 1000, 500, false);
figure;imshow(ims2);

%%
img5 = imread(strcat(path,'5.jpg'));
img6 = imread(strcat(path,'6.jpg'));
ims3 = getPanorama(img5,img6, 1000, 500, false);
figure;imshow(ims3);

%%
img7 = imread(strcat(path,'7.jpg'));
img8 = imread(strcat(path,'8.jpg'));
ims4 = getPanorama(img7,img8, 1000, 500, false);
figure;imshow(ims4);

%%
ims5 = getPanorama(ims1,ims2, 1000, 500, false);
figure;imshow(ims5);

%%
ims6 = getPanorama(ims3,ims4, 1000, 500, false);
figure;imshow(ims6);

%%
ims = getPanorama(ims5,ims6, 1000, 500, false);
figure;imshow(ims);
