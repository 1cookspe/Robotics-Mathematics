clear;

load('HW05_Prob5_Data.mat')

deltaT = t(2);
k = [0:1:length(t)];
instances = length(t);
tk = deltaT .* k;
M = 7;

Yk = zeros(instances, 1);
estDer = zeros(instances, 1);

% loop through each time window
for i=M:(instances)
    range = M - 1;
    tSample = t(i - range:i);
    ySample = y(i - range:i);
    A = [ones(M,1), sin(pi*tSample), sin(2*pi*tSample), sin(3*pi*tSample), sin(4*pi*tSample), sin(5*pi*tSample)];

    % Calculate coefficients
    x_hat = A \ ySample
        
    % Calculate Yk
    Yk(i) = x_hat(1) + x_hat(2)*sin(pi*t(i)) + x_hat(3)*sin(2*pi*t(i)) + x_hat(4)*sin(3*pi*t(i)) + x_hat(5)*sin(4*pi*t(i)) + x_hat(6)*sin(5*pi*t(i));
end

% Calculate derivative
for i=M:(instances - 1)
    estDer(i) = (Yk(i+1) - Yk(i))/deltaT;
end

% plot results
plot(t,estDer);
hold on
plot(t,dy)
legend('Estimated Derivative', 'Actual Derivative')
xlabel('Time (s)')
ylabel('dy(t)/dt')
title('Part (b) - Regression Estimate')