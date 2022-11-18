% Clustering Problem using a Self-Organizing Map
% iris_dataset.
load iris_dataset;
x = irisInputs;
% Create a Self-Organizing Map
dim1 = 10;
dim2 = 10;
net = selforgmap ([dim1 dim2]);
% Train the Network
[net,tr] = train(net,x);
% Test the Network
y = net(x);
% View the Network
view(net)
% Different Plots
figure, plotsomtop(net)

figure, plotsomnc(net)
figure, plotsomnd(net)
figure, plotsomplanes(net)
figure, plotsomhits(net,x)
figure, plotsompos(net,x)
pos = gridtop(2,3)
pos = gridtop(3,2); 
pos = gridtop(8,10);
plotsom(pos)
pos = hextop(2,3)
pos = hextop(8,10);
plotsom(pos)
pos = randtop(2,3)
pos = randtop(8,10);
plotsom(pos)
pos2 = [0 1 2; 0 1 2]
D2 = dist (pos2)




