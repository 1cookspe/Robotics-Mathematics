load('HW05_Prob5_Data.mat')

deltaT = t(2);
k = [0:1:length(t)];
instances = length(t);
tk = deltaT .* k;

estDer = zeros(instances, 1);

% loop through each time instance
for i=2:(instances - 1)
    estDer(i) = (y(i+1) - y(i))/deltaT;
end

% plot estimated derivative and plot with true derivative
plot(t,estDer)
hold on
plot(t,dy)
legend('Estimated Derivative', 'Actual Derivative')
xlabel('Time (s)')
ylabel('dy(t)/dt')
title('Part (a) - Naive Estimate')