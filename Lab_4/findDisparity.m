function d = findDisparity(window, panel)

nCols = size(panel,2);
offset = floor(size(window,2)/2);

maxFitness = 0;
count = 1;
for col = offset+1:nCols-offset
  
  testWindow = panel(:,col-offset:col+offset);
  difference = sum(sum((window - testWindow).^2)) + 5*(col-nCols/2)^2;
  fitness = 1/difference; 
  if(fitness > maxFitness)
    matchingColumn = col - offset;
    maxFitness  = fitness;
  end  
  
%     diff(count) =1/difference;
%    count = count+1;
end

%   plot(1:length(diff),diff,[matchingColumn, matchingColumn],[min(diff),max(diff)],'r-'); 
%   drawnow; 
d = nCols/2-matchingColumn;


end
