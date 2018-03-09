tsukuba1 = rgb2gray(imread('tsukuba1.png'));
tsukuba2 = rgb2gray(imread('tsukuba2.png'));
gt = imread('ground_truth.png');


subplot(2,2,1)
imshow(tsukuba1)
subplot(2,2,2)
imshow(tsukuba2)


g = ginput(100)

img1Points = g(1:2:end,:);
img2Points = g(2:2:end,:);

nPoints = size(img1Points,1);

dispar = zeros(nPoints,1);

for i=1: nPoints
  dispar(i) = gt(round(img1Points(i,2)),round(img1Points(i,1)));
end

disparityDifferences = [ img1Points(:,1)-img2Points(:,1), dispar/8]
dcol = 8*[disparityDifferences(:,1),disparityDifferences(:,1),disparityDifferences(:,1)];

I1 = insertMarker(tsukuba1, img1Points,'x','size',10,'color','red');
I2 = insertMarker(tsukuba2, img2Points,'x','size',10,'color','blue');
I3 = insertMarker(I1, img2Points,'x','size',10,'color','blue');
subplot(2,2,1)
imshow(I1);
subplot(2,2,2)
imshow(I2)
subplot(2,2,3)
imshow(I3)
%%
subplot(2,2,4)
hold on
imshow(gt)
for i=1:nPoints
plot(img1Points(i,1),img1Points(i,2),'o','MarkerSize',10,'MarkerFaceColor',dcol(i,:)/256,'MarkerEdgeColor','y')
end

hold off



