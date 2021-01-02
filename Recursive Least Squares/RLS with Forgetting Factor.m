clear;
close all;

load DataHW06_Prob6.mat;

nMin = ceil(20 / 3);
lambda = 0.98;

% Initialization step
Qn = 0;
Pn = 0;
Tn = 0;
x_hat_n = 0;
for i = 1:nMin
    Qn = Qn + C{i}' * lambda^(nMin - i) * C{i};
    Tn = Tn + C{i}' * lambda^(nMin - i) * y{i};
end
x_hat_n = inv(Qn) * Tn;

% Recursion: for n <= k <= N
Ek = zeros(1,N-nMin);
range = [nMin:N-1];
Qk = Qn;
Kk = 0;
Xk = x_hat_n;
tic;
for k = nMin:(N-1)
    Qk = lambda * Qk + C{k+1}' * C{k+1};
    Kk = inv(Qk) * C{k + 1}';
    Xk = Xk + Kk * (y{k+1} - C{k+1} * Xk);
    Ek(1,k-nMin+1) = norm(Xk - x_actual{1, k});
end
done = toc;

plot(range, Ek);
title('Recursive Least Squares without Matrix Inversion Lemma (Forgetting Factor = 0.98)');
xlabel('k');
ylabel('Ek');
txt = sprintf('Elapsed Time: %f s', done);
text(250,0.4,txt,'FontSize',14)