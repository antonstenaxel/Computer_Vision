disparityStart = -15; 
disparityEnd = disparityStart +16*2; 
disparityRange = [disparityStart,disparityEnd];

blockSize = 7;
disparityMap = disparity(I1,I2,'BlockSize',blockSize,'DisparityRange',disparityRange);
imshow(disparityMap,disparityRange)