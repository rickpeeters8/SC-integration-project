clear all
close all

% Initial conditions
x10 = 1;
x20 = 1;

% Maximum simulation time
T = 1;

% Tolerances
AbsTol = 1e-8;
RelTol = 1e-10;

% System matrices
A1 = [-1 10;-100 -1]; A2= [-1 100; -10 -1];

%% Simulation
simdata = sim('ex2hybrid.slx');
X = simdata.X;

x1 = X.signals.values(:,1);
x2 = X.signals.values(:,2);
t  = X.time;

figure
plot(t,x1,'r-')
hold on
plot(t,x2,'b--')
grid on
xlabel('t')
ylabel('x_i')
legend('x_1','x_2')

figure
plot(x1,x2)
grid on
xlabel('x_1')
ylabel('x_2')
title('Phase portrait')