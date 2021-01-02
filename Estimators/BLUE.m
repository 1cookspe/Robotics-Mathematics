C = [1,2;3,4;5,0;0,6]
y=[1.5377;3.6948;-7.7193;7.3621]
Q = [1,0.5,0.5,0.25;0.5,2,0.25,1;0.5,0.25,2,1;0.25,1,1,4]

%% Part a
ya = y(1:2)
Ca = C(1:2,1:2)
Qa = Q(1:2,1:2)

Ka = inv(Ca' * inv(Qa) * Ca) * Ca' * inv(Qa)
xa = Ka * ya
Ea = inv(Ca' * inv(Qa) * Ca)

%% Part b
yb = y(1:3)
Cb = C(1:3,1:2)
Qb = Q(1:3,1:3)

Kb = inv(Cb' * inv(Qb) * Cb) * Cb' * inv(Qb)
xb = Kb * yb
Eb = inv(Cb' * inv(Qb) * Cb)

%% Part c
Kc = inv(C' * inv(Q) * C) * C' * inv(Q)
xc = Kc * y
Ec = inv(C' * inv(Q) * C)