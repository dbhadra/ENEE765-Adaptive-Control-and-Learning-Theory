%% Nearest neighbor consensus for a 3-agent unweighted network

x0 = [0.1 0.5 1]';
y0 = [1.5 0.9 2]';
Dp = diag([2 2 2]); % Diagonal degree matrix
Ap = [0 1 1;1 0 1;1 1 0]; % Adjacency matrix 
Lp = Dp-Ap; % Laplacian matrix
t = 0:0.1:10;

Fp = inv(eye(3)+Dp)*(Ap+eye(3)); % Refer (32) in PDF
[t,x] = ode45(@(t,x) (Fp-eye(3))*x,t, x0); 
[t,y] = ode45(@(t,y) (Fp-eye(3))*y,t, y0); 
figure(1)
plot(x(:,1),y(:,1),'k')
hold on;
plot(x(:,2),y(:,2),'g')
plot(x(:,3),y(:,3),'r')
xlabel('x-coordinates','fontweight','bold','fontsize',16);
ylabel('y-coordinates','fontweight','bold','fontsize',16);
legend('Agent 1','Agent 2','Agent 3')
hold off;

% EOF