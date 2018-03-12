function d = findDisparityXcorr(window,panel,column )

nCols = size(panel,2);

c = normxcorr2(window,panel);
[col,~] = find(c == max(c(:)));
matchingColumn = col+column-floor(nCols/2)+1;
d = column - matchingColumn(1);
end
