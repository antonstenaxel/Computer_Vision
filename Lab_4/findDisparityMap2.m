function disparityMap = findDisparityMap2(I1,I2,windowSize,dRange)

imageH = size(I1,1);
imageW = size(I1,2);

windowH = windowSize(1);
windowW = windowSize(2);

windowOffsetC = floor(windowW/2);
windowOffsetR = floor(windowH/2);

panelW = windowSize(1)+dRange(2)-dRange(1);

disparityMap = zeros(imageW,imageH);

leftMargin = windowOffsetC + 1 -dRange(1);
rightMargin = imageW - windowOffsetC - dRange(2); 
topMargin = windowOffsetR + 1; 
bottomMargin = imageH - windowOffsetR; 


for row = topMargin : bottomMargin

  for col = leftMargin : rightMargin
    
    currentRows = row-windowOffsetR : row + windowOffsetR;
    windowCols = col-windowOffsetC : col + windowOffsetC;
    
    testPanelCols = col-windowOffsetC+dRange(1) : col+windowOffsetC+dRange(2);
    
    window = I1(currentRows,windowCols);
    testPanel = I2(currentRows,testPanelCols); 
    
    d = findDisparity2(window,testPanel); 
    
    disparityMap(row,col) = d; 
  end
end


end
