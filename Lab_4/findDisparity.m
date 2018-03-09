function d = findDisparity(window, panel,column)

nCols = size(panel,2);
offset = floor(size(window,1)/2);

index = -1; 
diff_min = inf; 
for col_2 = offset+1: nCols-offset
  
  testWindow = panel(:,col_2-offset:col_2+offset);
  %difference = sum(sum((window - testWindow).^2));
  difference = sum(sum(abs(window - testWindow)));
  
  if(difference < diffmin)
    index = col_2;
  end
  
end

d = column - index; 

end
