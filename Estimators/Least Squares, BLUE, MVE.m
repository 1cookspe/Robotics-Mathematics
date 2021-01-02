%% Setup
C = [1,2;3,4;5,0;0,6]
y = [1.5377;3.6948;-7.7193;7.3621]
Q = [1,0.5,0.5,0.25;0.5,2,0.25,1;0.5,0.25,2,1;0.25,1,1,4]
P = [0.5,0.25;0.25,0.5]

%% Part a
x_hat = inv(C' * C) * C' * y

%% Part b
Q = eye(4,4)
Kb = inv(C' * inv(Q) * C) * C' * inv(Q)
Eb = inv(C' * inv(Q) * C)
xb = Kb * y

%% Part c
Pc = 100 * eye(2,2)
Kc = Pc * C' * inv(C * Pc * C' + Q)
xc = Kc * y
Ec = Pc - Pc * C' * inv(C * Pc * C' + Q) * C * Pc

%% Part c.2
Pd = 10^6 * eye(2,2)
Kd = Pd * C' * inv(C * Pd * C' + Q)
xd = Kd * y
Ed = Pd - Pd * C' * inv(C * Pd * C' + Q) * C * Pd