set(0, 'defaultTextInterpreter', 'tex');
# Alexandre Barros de Araujo
# nUsp = 11802989
N = 89;

#Funcoes Iniciais do Problema;

v_t = @(t) ((0.05*10^-3))*(100+N).*(100-t);
r_o = @(o) (0.2*(3 - 2.*cos(o)));

# Modelagem do Problema: Theta'

dodt = @(t, o) ((v_t(t))./(sqrt((0.4.*sin(o)).^2 + (r_o(o)).^2)));

ti = 0;
tf = 20;
dt = 0.1;
[tw, ow] = ode45(dodt, [ti:dt:tf], [0]);

arr = find(ow < 6*pi)(end);

disp("Tempo de três voltas: ");
tw(arr)

# Grafico theta(t)

figure(1);

plot(tw, ow, 'r-', 'LineWidth', 1.3);
hold on;
title('Gráfico 1 - \theta(t) x t', 'FontName', 'Times', 'FontSize', 12)
xlabel('t (s)', 'FontName', 'Times', 'FontSize', 12)
ylabel('\theta, (rad)', 'FontName', 'Times', 'FontSize', 12)
grid on;

# Grafico r(t)

figure(2);

plot(tw, r_o(ow), 'r-', 'LineWidth', 1.3);
hold on;
title('Gráfico 2 - r(t) x t', 'FontName', 'Times', 'FontSize', 12)
xlabel('t (s)', 'FontName', 'Times', 'FontSize', 12)
ylabel('r, (m)', 'FontName', 'Times', 'FontSize', 12)
grid on;

# Grafico dodt(t)

figure(3);

plot(tw, dodt(tw, ow), 'r-', 'LineWidth', 1.3);
hold on;
title('Gráfico 3 - d\theta/dt x t', 'FontName', 'Times', 'FontSize', 12)
xlabel('t', 'FontName', 'Times', 'FontSize', 12)
ylabel('d\theta/dt', 'FontName', 'Times', 'FontSize', 12)
grid on;

# Grafico r'(t)

drdt = @(o, t) (0.4.*sin(o).*dodt(t, o));

figure(4);

plot(tw, drdt(ow, tw), 'r-', 'LineWidth', 1.3);
hold on;
title("Gráfico 4 - r' x t", 'FontName', 'Times', 'FontSize', 12)
xlabel('t', 'FontName', 'Times', 'FontSize', 12)
ylabel("r'", 'FontName', 'Times', 'FontSize', 12)
grid on;

# Grafico r x o

figure(5);

plot(ow, r_o(ow), 'r-', 'LineWidth', 1.3);
hold on;
title('Gráfico 5 - r x \theta', 'FontName', 'Times', 'FontSize', 12)
xlabel('\theta (rad)', 'FontName', 'Times', 'FontSize', 12)
ylabel('r, (m)', 'FontName', 'Times', 'FontSize', 12)
grid on;

# Grafico r x o

figure(6);

plot(tw, v_t(tw), 'r-', 'LineWidth', 1.3);
hold on;
title("Gráfico 6 - v(t) x t", 'FontName', 'Times', 'FontSize', 12)
xlabel('s, (s)', 'FontName', 'Times', 'FontSize', 12)
ylabel('v, (m/s)', 'FontName', 'Times', 'FontSize', 12)
grid on;

