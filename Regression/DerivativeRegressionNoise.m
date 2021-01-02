clear;
close all;

load('HW05_Prob6_Data.mat')

deltaT = t(2);
k = [0:1:length(t)];
instances = length(t);
tk = deltaT .* k;
M = 18;

Yk = zeros(instances, 1);
regDer = zeros(instances, 1);
naiveDer = zeros(instances, 1);

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

% Calculate naive derivative
for i=1:(instances - 1)
    naiveDer(i) = (y(i+1) - y(i))/deltaT;
end

% Calculate regression derivative
for i=M:(instances - 1)
    regDer(i) = (Yk(i+1) - Yk(i))/deltaT;
end

% plot results
plot(t,naiveDer,'color','b');
hold on
plot(t,regDer,'color','r');
hold on
plot(t,dy,'color','g')
legend('Naive Derivative','Regression Derivative', 'Actual Derivative')
xlabel('Time (s)')
ylabel('dy(t)/dt')
title(sprintf('Problem 6 - Noisy Signal (M = %d)', M))

% Compute error
error = 0;
for j=1:instances
    error = error + (dy(i) - regDer(i))^2;
end
error = (1/instances)*sqrt(error);