load DataHW06_Prob5.mat

% Loop until N to form matrices
nMin = ceil(100 / 3);
xk = zeros((N-nMin)*100,1);
Ek = zeros(N-nMin,1);
it = 1;

tic;
for k = nMin:N
    Yk = zeros(k*3,1);
    Ak = zeros(k*3, 100);
    iterate = 1;
    Rk = eye(k*3);
    % Create arrays
    for n = 1:k
        Yk(iterate:iterate+2,1) = y{n};
        Ak(iterate:iterate+2,:) = C{n};
        iterate = iterate + 3;
    end
    
    % Compute xk
    xk(it:it+99,1) = inv(Ak' * Rk * Ak) * Ak' * Rk * Yk;
    Ek(k-nMin+1) = norm(xk(it:it+99,1) - x_actual{1, k});
    it = it + 100;
end
done = toc

range = [nMin:N];
plot(range,Ek);
xlabel('k');
ylabel('Ek');
title('Norm error in x-hat using Batch Process');
txt = sprintf('Elapsed Time: %f s', done);
text(250,0.5,txt,'FontSize',14)