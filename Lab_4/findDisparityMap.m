function disparityMap = findDisparityMap(I1,I2,windowSize,disparityRange)
fprintf("Started\n")

nRows = size(I1,1);
nCols = size(I1,2);

disparityMap = zeros(nRows,nCols);

windowOffset = floor(windowSize/2);

panelOffsetLeft = windowOffset(1) - disparityRange(1); 
panelOffsetRight = windowOffset(1) + disparityRange(2); 


for row = windowOffset(2)+1 : nRows - windowOffset(2)   
  if(mod(row,58)==0);printStatus(row,nRows);end
  for col = panelOffsetLeft+1 : nCols - panelOffsetRight
    
    currentRows = row-windowOffset(2) : row+windowOffset(2);
    windowCols = col-windowOffset(1) : col+windowOffset(1);
    panelCols = col-panelOffsetLeft : col+panelOffsetRight;
    
    window = I1(currentRows,windowCols);
    panel = I2(currentRows,panelCols);
   
    disparity = findDisparity(window, panel);
     
    disparityMap(row,col) = disparity; 
    
  end
end
fprintf("Complete \n")

  function printStatus(currentRow,nRows)
    fprintf("%.0f%% completed \n",currentRow/(nRows)*100);
  end

end

