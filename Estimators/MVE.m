%% Setup
C = [1,2;3,4;5,0;0,6]
y = [1.5377;3.6948;-7.7193;7.3621]
Q = [1,0.5,0.5,0.25;0.5,2,0.25,1;0.5,0.25,2,1;0.25,1,1,4]
P = [0.5,0.25;0.25,0.5]

%% Part a
Pa = P
Ca = C(1,1:2)
Qa = Q(1,1)
ya = y(1)
Ka = Pa * Ca' * inv(Ca * Pa * Ca' + Qa)
xa = Ka * ya
Ea = Pa - Pa * Ca' * inv(Ca * Pa * Ca' + Qa) * Ca * Pa

%% Part b
Pb = P
Cb = C(1:2,1:2)
Qb = Q(1:2,1:2)
yb = y(1:2)
Kb = Pb * Cb' * inv(Cb * Pb * Cb' + Qb)
xb = Kb * yb
Eb = Pb - Pb * Cb' * inv(Cb * Pb * Cb' + Qb) * Cb * Pb

%% Part c
Pc = P
Cc = C(1:3,1:2)
Qc = Q(1:3,1:3)
yc = y(1:3)
Kc = Pc * Cc' * inv(Cc * Pc * Cc' + Qc)
xc = Kc * yc
Ec = Pc - Pc * Cc' * inv(Cc * Pc * Cc' + Qc) * Cc * Pc

%% Part d
Pd = P
Cd = C
Qd = Q
yd = y
Kd = Pd * Cd' * inv(Cd * Pd * Cd' + Qd)
xd = Kd * yd
Ed = Pd - Pd * Cd' * inv(Cd * Pd * Cd' + Qd) * Cd * Pd