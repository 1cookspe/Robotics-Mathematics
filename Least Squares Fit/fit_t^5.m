Y = f;
numRows = length(t);
A = [t.^5, t.^4, t.^3, t.^2, t, ones(numRows,1)];
det(A'*A)
theta_hat = inv(A'*A)*A'*Y
c5 = theta_hat(1)
c4 = theta_hat(2)
c3 = theta_hat(3)
c2 = theta_hat(4)
c1 = theta_hat(5)
c0 = theta_hat(6)

% plot
plot(t,f,'o',t,c5*t.^5 + c4*t.^4 + c3*t.^3 + c2*t.^2 + c1*t + c0)
gtext('f = c5*t.^5 + c4*t.^4 + c3*t.^3 + c2*t.^2 + c1*t + c0')
xlabel('t')
ylabel('f')