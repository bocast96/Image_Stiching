# Image_Stiching

I have created a main file for every image set, named 'main_' plus set name.
the main scripts load the images, paths do not need to be changed unless 
directory structure is changed, and they will call on 'getPanorama()' function 
which will do the processing.
getPanorama can also be called directly and it has 5 arguments:
1. image 1, rgb or gray
2. image 2, rgb or gray
3. nCorners: number of best corners from amns
4. nMatches: number of matches from ransac
5. true/false: whether to use cylindrical projections or not