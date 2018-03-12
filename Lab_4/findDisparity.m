function d = findDisparity(window, panel)

nCols = size(panel,2);
offset = floor(size(window,2)/2);

matchingColumn = 0;
maxFitness = 0;

for col = offset+1:nCols-offset
  
  testWindow = panel(:,col-offset:col+offset);
  difference = sum(sum((window - testWindow).^2));
  %difference = sum(sum(abs(window - testWindow)));
  fitness = 1/difference; 
  if(fitness > maxFitness)
    matchingColumn = col; % OBS matching column is in reference of panel
    maxFitness = fitness;
  end  
end

d = matchingColumn-nCols/2;

end
