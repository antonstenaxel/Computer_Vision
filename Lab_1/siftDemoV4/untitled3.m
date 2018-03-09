files = dir('bookr*');

degrees = zeros(1,length(files));
matches = zeros(1,length(files));

i=1;
for file = files'
  
  fileName = file.name;
  matches(i) = match('scene.pgm',fileName);
  degrees(i) = str2double(regexp(fileName,['\d*'],'match'));
  i=i+1;
end
