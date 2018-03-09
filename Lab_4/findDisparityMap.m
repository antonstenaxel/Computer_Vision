function D = findDisparityMap(I1, I2,windowSize)
%Windowsize have to be uneven

nRows = size(I1,1);
nCols = size(I1,2);


D = zeros(nRows,nCols);
offset = floor(windowSize/2);
tic
%For each pixel
told = toc;

for row = offset+1:nRows - offset
  
  panel = I2(row-offset:row+offset,:);
  if(mod(row,10) == 0 )
    tnew = toc; 
    fprintf("%.2f\% completed \nEstimated time left: %.2f mins \n",row/(nRows-offset)*100,(tnew-told)/10*(nRows-row)/60);
    told =tnew;
  end
  
  for col = offset+1:nCols - offset
    
    window = I1(row-offset:row+offset,col-offset:col+offset);
    
    disparity = findDisparity(window, panel,col);
    
    D(row,col) = disparity; 
    
  end
end
fprintf("Complete \n")

end
