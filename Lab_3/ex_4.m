function [f,w1,w2,normal] = ex_4(file1,file2)
data1 = readfile(file1);
data2 = readfile(file2);

%Only use largest lines for f, since these are less prone to user error
data1_forf = [data1(1:6,:);data1(9:end,:)];
data2_forf = [data2(1:6,:);data2(9:end,:)];

f = findf(data1_forf,data2_forf);
fprintf('f : %.2f\n',f);

w1 = findW(data1,f);
fprintf('Direction vector 1 : (%f, %f, %f)\n',w1(1),w1(2),w1(3));

w2 = findW(data2,f);
fprintf('Direction vector 2 : (%f, %f, %f)\n',w2(1),w2(2),w2(3));

normal = cross(w1,w2)/norm(cross(w1,w2));
fprintf('Normal Vector is : (%f, %f, %f)\n',normal(1),normal(2),normal(3) );

end

function wvec = findW(data,f)
n = 3;
m = size(data,1);

if m<n
  fprintf('M < 3 / error\n')
  return
end

a = zeros(m,n);
a(:,1) = data(:,4) - data(:,2);
a(:,2) = -(data(:,3) - data(:,1));
a(:,3) = data(:,2) .* -a(:,2)  - data(:,1) .* a(:,1);

[~,~,V] = svd(a);  % call matlab SVD routine
v_min = V(:,n); % s and v are already sorted from largest to smallest
if all(v_min < 0); v_min = -v_min; end % ?

wvec = [v_min(1)/f v_min(2)/f v_min(3)];
wvec = wvec / norm(wvec,2);

end


function f = findf(data1,data2)
nLines = size(data1,1);
fVec = zeros(1,nLines/2);

for i = 1:nLines/2
    vanishingPoint1 = findVanishingPoint(data1(i,:),data1(nLines+1-i,:));
    vanishingPoint2 = findVanishingPoint(data2(i,:),data2(nLines+1-i,:));
   
    fVec(i) = sqrt(-vanishingPoint1*vanishingPoint2');
end

f = mean(fVec);

end

function vp = findVanishingPoint(line1,line2)

x1 = line1(1);
y1 = line1(2);
x2 = line1(3);
y2 = line1(4);

x3 = line2(1);
y3 = line2(2);
x4 = line2(3);
y4 = line2(4);

vp = [x1*y2-x2*y1,x3*y4-x4*y3]/[y2-y1,y4-y3;-(x2-x1),-(x4-x3)];

end

function data=readfile(file)
f = fopen(file,'r');

for i=1:4
  fgets(f);
end

all = fscanf(f,'%f %f %f %f ');
m = length(all)/4;
data= reshape(all,4,m)';
fclose(f);
end

