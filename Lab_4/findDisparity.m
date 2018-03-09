function d = findDisparity(window, panel,column)

nCols = size(panel,2);
offset = floor(size(window,1)/2);
fVec = zeros(1,nCols);

for col_2 = offset+1: nCols-offset
  
  testWindow = panel(:,col_2-offset:col_2+offset);
  %difference = sum(sum((window - testWindow).^2));
  difference = sum(sum(abs(window - testWindow)));
  %difference = crosscorr(reshape(testWindow,1,[]),reshape(window,1,[]));
  f =1/difference; 
  
  fVec(col_2)=f;
end

[~ ,index] = max(fVec);

d = column - index; 

end
