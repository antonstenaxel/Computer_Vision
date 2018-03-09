shearing =[0, 25   ,50    , 100   ,200    ,300    ,400  ];
matches= [98,100  ,91    , 42    ,3      ,0      ,0 ];

plot(shearing,matches,'k-o','LineWidth',1,'MarkerSize',10)
set(gca,'FontSize',24)
grid on
xlabel('Shearing')
ylabel('# of Matches')