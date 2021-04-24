A1 = [-1 10;-100 -1]; A2= [-1 100; -10 -1];

TimeSpan = [0,5];
x0 = [1;1];
% Solving the ode over the specified time domain (A1)
options = odeset('RelTol',1e-5,'AbsTol',1e-3);
[T,X] = ode45(@(t,x) linsys(t,x,A1),TimeSpan,x0,options);

% Plotting the results
figure
plot(T,X(:,1),'r-')
hold on
plot(T,X(:,2),'b--')
grid on
legend('x_1','x_2')
xlabel('time')
ylabel('x_i')
title('A1')

figure
plot(X(:,1),X(:,2),'r-')
grid on
xlabel('x_1')
ylabel('x_2')
title('A1')

% Solving the ode over the specified time domain (A2)
options = odeset('RelTol',1e-5,'AbsTol',1e-3);
[T,X] = ode45(@(t,x) linsys(t,x,A2),TimeSpan,x0,options);

% Plotting the results
figure
plot(T,X(:,1),'r-')
hold on
plot(T,X(:,2),'b--')
grid on
legend('x_1','x_2')
xlabel('time')
ylabel('x_i')
title('A2')

figure
plot(X(:,1),X(:,2),'r-')
grid on
xlabel('x_1')
ylabel('x_2')
title('A2')

% Solving the ode over the specified time domain (Hybrid)
options = odeset('RelTol',1e-5,'AbsTol',1e-3);
[T,X] = ode45(@(t,x) hybridsys(t,x,A1,A2),TimeSpan,x0,options);

% Plotting the results
figure
plot(T,X(:,1),'r-')
hold on
plot(T,X(:,2),'b--')
grid on
legend('x_1','x_2')
xlabel('time')
ylabel('x_i')
title('Hybrid')

figure
plot(X(:,1),X(:,2),'r-')
grid on
xlabel('x_1')
ylabel('x_2')
title('Hybrid')


% Solving the ode over the specified time domain (Hybrid 2)
options = odeset('RelTol',1e-5,'AbsTol',1e-3);
[T,X] = ode45(@(t,x) hybridsys2(t,x,A1,A2),TimeSpan,x0,options);

% Plotting the results
figure
plot(T,X(:,1),'r-')
hold on
plot(T,X(:,2),'b--')
grid on
legend('x_1','x_2')
xlabel('time')
ylabel('x_i')
title('Hybrid 2')

figure
plot(X(:,1),X(:,2),'r-')
grid on
xlabel('x_1')
ylabel('x_2')
title('Hybrid 2')

function out = linsys(t,x,A)
    out = A*x;
end


function out=hybridsys(t,x,A1,A2)
    if x(1)*x(2)>0
        out = A2*x;
    else
        out = A1*x;
    end
end

function out=hybridsys2(t,x,A1,A2)
    if x(1)*x(2)>0
        out = A1*x;
    else
        out = A2*x;
    end
end
