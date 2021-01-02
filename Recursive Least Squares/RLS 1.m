load DataHW06_Prob5.mat;

n = ceil(100 / 3);
S = eye(3);

% Initialization step
Qn = 0;
Tn = 0;
for i = 1:n
    Qn = Qn + C{i}' * S * C{i};
    Tn = Tn + C{i}' * S * y{i};
end
x_hat_n = inv(Qn) * Tn;

% Recursion: for n <= k <= N
Ek = zeros(1,N-n);
range = [n:N-1];
Qk = Qn;
Kk = 0;
Xk = x_hat_n;
tic;
for k = n:(N-1)
    Qk = Qk + C{k+1}' * S * C{k+1};
    Kk = inv(Qk) * C{k+1}' * S;
    Xk = Xk + Kk * (y{k+1} - C{k+1} * Xk);
    Ek(1,k-n+1) = norm(Xk - x_actual{1, k});
end
done = toc;

plot(range, Ek);
title('Recursive Least Squares without Matrix Inversion Lemma');
xlabel('k');
ylabel('Ek');
txt = sprintf('Elapsed Time: %f s', done);
text(250,0.4,txt,'FontSize',14)