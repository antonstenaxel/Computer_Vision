function D = findDisparityMap(I1, I2,windowSize)
%Windowsize have to be uneven

nRows = size(I1,1);
nCols = size(I1,2);


D = zeros(nRows,nCols);
offset = floor(windowSize/2);
tic
%For each pixel
told = toc
for row = offset+1:nRows - offset
  
  panel = I2(row-offset:row+offset,:);
  tnew = toc; 
  fprintf("At row %d of %d \n, estimated time: %.2f mins \n",row,nRows,(tnew-told)*(nRows-row)/60);
  told =tnew;
  for col = offset+1:nCols - offset
    
    window = I1(row-offset:row+offset,col-offset:col+offset);
    
    disparity = findDisparity(window, panel,col);
    
    D(row,col) = disparity; 
    
  end
end

end
