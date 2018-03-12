function d = findDisparity2(window,testPanel)

testPanelSize = size(testPanel,2);
windowOffset = size(window,2);

bestCol = -5; 
maxFitness = 0;
for col = windowOffset+1 : testPanelSize - windowOffset
  testCols = col-windowOffset:col+windowOffset;
  
  testWindow = testPanelSize(testCols);
  
  difference = sum(sum(abs(window-testWindow)));
  fitness = 1/difference;
  
  if(fitness > maxFitness)
    maxFitness = fitness;
    bestCol = col;
  end
  
  
end

d = bestCol - testPanelSize/2;

end
