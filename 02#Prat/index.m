## Variaveis do Problema

r = 100;
s = [0:0.01:20];
v_0 = (10 + 0.1*89);

## Equacao que rege o problema

a_t = (4 - 0.01 * s.^2);

## Velocidade

v_t = @(s, v_0) (sqrt(((-0.02/3) * s.^3) + 8 * s + v_0^2));
f = @(s) v_t(s, v_0);

f(20)

fig = figure(1);

plot(s, f(s), 'r-', 'LineWidth', 1.5);
hold on;
title('Gráfico 1 - Velocidade x Deslocamento', 'FontName', 'Times', 'FontSize', 12)
xlabel('Deslocamento, s (m)', 'FontName', 'Times', 'FontSize', 12)
ylabel('Velocidade, v (m/s)', 'FontName', 'Times', 'FontSize', 12)
hold off;
grid on;

## Aceleracao

fig = figure(2);

g = @(s) sqrt((4 - 0.01 * s.^2).^2 + (f(s).^2).^2 ./ 100^2);

plot(s, g(s), 'r-', 'LineWidth', 1.5);
hold on;
title('Gráfico 2 - Aceleração x Deslocamento', 'FontName', 'Times', 'FontSize', 12)
xlabel('Deslocamento, s (m)', 'FontName', 'Times', 'FontSize', 12)
ylabel('Aceleração, a (m/s^2)', 'FontName', 'Times', 'FontSize', 12)
hold off;
grid on;

g(20)

## Tempo Necessario

h = @(s) 1./f(s);

temp = quad(h, 0, 20)

