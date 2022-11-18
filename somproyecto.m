clear;

rng('default');

% Define predictors
predictors = [1 1 0 0; 1 0 1 0; 1 1 1 1];
x = predictors;


% Create a Self-Organizing Map
dimension1 = 3;
dimension2 = 7;
net = selforgmap([dimension1]);
net.trainParam.epochs = 100;


% Train the Network
[net,tr] = train(net,x);

% Test the Network
y = net(x);


% View the Network
view(net)

% Plots
% Uncomment these lines to enable various plots.
% figure, plotsomtop(net)
% figure, plotsomnc(net)
% figure, plotsomnd(net)
% figure, plotsomplanes(net)
% figure, plotsomhits(net,x)
% figure, plotsompos(net,x)


% Fetch data points
input_neuron_mapping = vec2ind(net(x))';
neuron_1_input_indices = find(input_neuron_mapping == 2)
neuron_1_input_values = x(neuron_1_input_indices)