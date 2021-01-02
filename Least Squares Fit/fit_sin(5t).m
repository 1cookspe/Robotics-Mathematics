Y = f;
numRows = length(t);
A = [sin(pi*t), sin(2*pi*t), sin(3*pi*t), sin(4*pi*t), sin(5*pi*t)];
det(A'*A)
theta_hat = inv(A'*A)*A'*Y
c1 = theta_hat(1)
c2 = theta_hat(2)
c3 = theta_hat(3)
c4 = theta_hat(4)
c5 = theta_hat(5)

% plot
plot(t,f,'o',t,c1*sin(pi*t) + c2*sin(2*pi*t) + c3*sin(3*pi*t) + c4*sin(4*pi*t) + c5*sin(5*pi*t))
gtext('f = c1*sin(pi*t) + c2*sin(2*pi*t) + c3*sin(3*pi*t) + c4*sin(4*pi*t) + c5*sin(5*pi*t)')
xlabel('t')
ylabel('f')