Y = f;
numRows = length(t);
A = [ones(numRows,1), t, t.^2, t.^3];
det(A'*A)
theta_hat = inv(A'*A)*A'*Y
c0 = theta_hat(1)
c1 = theta_hat(2)
c2 = theta_hat(3)
c3 = theta_hat(4)

% plot
plot(t,f,'o',t,c0 + c1*t + c2*t.^2 + c3*t.^3)
gtext('f = c0 + c1*t + c2*t.^2 + c3*t.^3')
xlabel('t')
ylabel('f')