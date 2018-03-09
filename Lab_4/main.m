I1 = imread('Images/tsukuba1.png');
I2 = imread('Images/tsukuba2.png');
windowSize=5; 

disparityMap = findDisparityMap(I1,I2,windowSize); 

imshow(disparityMap); 