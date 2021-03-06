I1 = rgb2gray(imread('Images/venus/im2.ppm'));
I2 = rgb2gray(imread('Images/venus/im6.ppm'));
imshowpair(I1,I2,'montage')

%%

windowSize=[15,15]; %[rows,columns]
disparityRange = [-20,20]; 

disparityMap = findDisparityMap(I1,I2,windowSize,disparityRange); 

%%
imshow(disparityMap,[-14,27])
colorbar

%%

subplot(1,2,1)
imshow(abs(disparityMap)./max(max(abs(disparityMap)))); 
subplot(1,2,2)
imshow(I1)
