clear all
close all
load SegwayData4KF.mat

% Initial conditions
x_bar_0 = x0;
P0 = cov(x0);
Pk = P0;
xk = x_bar_0;

phis = zeros(N,1);
thetas = zeros(N,1);
phiDots = zeros(N,1);
thetaDots = zeros(N,1);
Kvalues = zeros(4,N);

% Loop
for k = 1:N
    Kk = (Pk * C') * inv(C * Pk * C' + Q);
    Kvalues(:,k) = Kk;
    xk = A * xk + B * u(k) + A * Kk * (y(k) - C * xk);
    phis(k) = xk(1,1);
    thetas(k) = xk(2,1);
    phiDots(k) = xk(3,1);
    thetaDots(k) = xk(4,1);
    Pk = A * (Pk - Kk * C * Pk) * A' + G * R * G';
end

% First plot
plot(t,phis)
hold on
plot(t,thetas)
legend('Phi', 'Theta')
title('Phi and Theta versus Time')
xlabel('Time')

% Second plot
figure(2)
plot(t,phiDots)
hold on
plot(t,thetaDots)
xlabel('Time')
legend('Phi Dot', 'Theta Dot')
title('Phi Dot and Theta Dot versus Time')

% Third plot
figure(3)
K1 = Kvalues(1,:);
K2 = Kvalues(2,:);
K3 = Kvalues(3,:);
K4 = Kvalues(4,:);
plot(t,K1)
hold on
plot(t,K2)
hold on
plot(t,K3)
hold on
plot(t,K4)
xlabel('Time')
legend('K1', 'K2', 'K3', 'K4')
xlabel('Time')
ylabel('Value')
title('Kalman Values versus Time')

[Kss, Pss] = dlqe(A,G,C,R,Q)

% Segway_anim(t,phis,thetas,Ts);