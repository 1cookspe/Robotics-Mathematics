clear;
close all;

load DataHW06_Prob6.mat

lambda = 0.98;
nMin = ceil(20 / 3);
xk = zeros((N-nMin)*20,1);
Ek = zeros(N-nMin,1);
it = 1;

for i = 1:(nMin)
    Si = lambda^(nMin-i) * eye(3);
    index = 3*(i-1) + 1;
    Rk(index:index+2, index:index+2) = Si;
end

for k = nMin:N
    Yk = zeros(k*3,1);
    Ak = zeros(k*3, 20);
    iterate = 1;
    % Create arrays
    for n = 1:k
        Yk(iterate:iterate+2,1) = y{n};
        Ak(iterate:iterate+2,:) = C{n};
        iterate = iterate + 3;
    end
    
    % Compute xk
    xk(it:it+19,1) = inv(Ak' * Rk * Ak) * Ak' * Rk * Yk;
    Ek(k-nMin+1) = norm(xk(it:it+19,1) - x_actual{1, k});
    it = it + 20;
    
    Rk = [lambda*Rk, zeros(3*k, 3); zeros(3, 3*k), eye(3)];
end

range = [nMin:N];
plot(range,Ek);
xlabel('k');
ylabel('Ek');
title('Norm error in x-hat using Batch Process (Forgetting Factor = 0.98)');