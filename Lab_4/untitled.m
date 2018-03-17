tmp = L2-L1; 
disparities = tmp(:,1);


dcol = [disparities, disparities,disparities]*8;

cleanI =  tmp(:,2) > 0 ;

l1 = L1(cleanI,:); 
l2 = L2(cleanI,:); 


%%
hold on 
imshow('Images/venus/disp2.pgm'); 

for i=1:length(l1)
plot(l1(i,1),l1(i,2),'o','MarkerSize',10,'MarkerFaceColor',abs(dcol(i,:))/256,'MarkerEdgeColor','none')
end

hold off