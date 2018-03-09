I1 = rgb2gray(imread('Images/tsukuba1.png'));
I2 = rgb2gray(imread('Images/tsukuba2.png'));
windowSize=40;


disparityMap = findDisparityMap(I1,I2,windowSize); 
%%
imshow(abs(disparityMap)./max(max(abs(disparityMap)))); 
