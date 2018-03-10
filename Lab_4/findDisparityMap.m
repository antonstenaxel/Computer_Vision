function D = findDisparityMap(I1, I2,windowSize,range)
%Windowsize have to be uneven

nRows = size(I1,1);
nCols = size(I1,2);

windowOffset = floor(windowSize/2);
panelsize = windowSize + 2*range; 

D = zeros(nRows,nCols);
tic
%For each pixel
told = toc;

for row = windowOffset+1:nRows - windowOffset
  if(mod(row,10) == 0 )
    tnew = toc; 
    fprintf("%.2f  completed \nEstimated time left: %.2f mins \n",row/(nRows)*100,(tnew-told)/10*(nRows-row)/60);
    told =tnew;
  end
  
  for col = floor(panelsize/2)+1:nCols - floor(panelsize/2)
    panel = I2(row-windowOffset:row+windowOffset,...
               col-floor(panelsize/2):col+floor(panelsize/2));
             
    window = I1(row-windowOffset:row+windowOffset,...
                col-windowOffset:col+windowOffset);
    
    disparity = findDisparity(window, panel,col);
    
    D(row,col) = disparity; 
    
  end
end
fprintf("Complete \n")

end
