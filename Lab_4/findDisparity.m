function d = findDisparity(window, panel,column)

nCols = size(panel,2);
offset = floor(size(window,1)/2);
fVec = zeros(1,nCols);

for col = offset+1: nCols-offset
  
  testWindow = panel(:,col-offset:col+offset);
  rmse = sum(sum((window - testWindow).^2));
  f =1/rmse; 
  
  fVec(col)=f;
end

[~ ,index] = max(fVec);

d = column - index; 

end
