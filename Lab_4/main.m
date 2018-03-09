I1 = rgb2gray(imread('Images/tsukuba1.png'));
I2 = rgb2gray(imread('Images/tsukuba2.png'));
windowSize=5; 


disparityMap = findDisparityMap(I1,I2,windowSize); 
%%
imshow(1-disparityMap./378); 