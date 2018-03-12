I1 = rgb2gray(imread('Images/tsukuba1.png'));
I2 = rgb2gray(imread('Images/tsukuba2.png'));
%%

windowSize=[15,15]; %[rows,columns]
disparityRange = [-15,5]; 


disparityMap = findDisparityMap(I1,I2,windowSize,disparityRange); 

imshow(disparityMap,disparityRange)

%%

subplot(1,2,1)
imshow(abs(disparityMap)./max(max(abs(disparityMap)))); 
subplot(1,2,2)
imshow(I1)
