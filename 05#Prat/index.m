set(0, 'defaultTextInterpreter', 'tex');
# Alexandre Barros de Araujo
# nUsp = 11802989

#Funcoes Iniciais do Problema;
ti = 0; dt = 0.0001; tf = 20;

function f = sist_edos(t, theta)
  N = 89;
  r = (1 + N/100);
  m = 1;
  g = 9.81;
  c = 0.5;

  f = [theta(2); -(c*theta(2)/m)-(g/r)*sin(theta(1))];
endfunction

[t, theta] = ode45(@(t, theta) sist_edos(t, theta), [ti:dt:tf], [0, 15])

o = theta(:, 1);
w = theta(:, 2);

## Numero de Voltas

for i=[1:1:length([ti:dt:tf])]
  if(w(i) < 0)
    arr = i - 1;
    break;
  endif
endfor

disp('Voltas do Pendulo: ');
floor(o(arr)/(2*pi))
## Calculo da Tracao

m = 1;
g = 9.81;

T = m*(w.^2 + g*cos(o));

## Calculo da Frequencia

freq = w./2*pi;

## Grafico 1 - talvez
figure(1);
plot(t, o, 'r-', 'LineWidth', 1.3);
title('Gráfico 1 - \theta x t', 'FontName', 'Times', 'FontSize', 12)
xlabel('t (s)', 'FontName', 'Times', 'FontSize', 12)
ylabel('\theta, (rad)', 'FontName', 'Times', 'FontSize', 12)
grid on;

## Grafico 2 - dtheta/dt x dt
figure(2);
plot(t, w, 'r-', 'LineWidth', 1.3);
title('Gráfico 2 - d\theta(t)/dt x t', 'FontName', 'Times', 'FontSize', 12)
xlabel('t (s)', 'FontName', 'Times', 'FontSize', 12)
ylabel('d\theta/dt, (rad/s)', 'FontName', 'Times', 'FontSize', 12)
grid on;

## Grafico 3 - dtheta/dt x talvez
figure(3);
plot(o, w, 'r-', 'LineWidth', 1.3);
title('Gráfico 3 - d\theta(t) x \theta', 'FontName', 'Times', 'FontSize', 12)
xlabel('\theta, (rad)', 'FontName', 'Times', 'FontSize', 12)
ylabel('d\theta/dt, (rad/s)', 'FontName', 'Times', 'FontSize', 12)
grid on;

## Grafico 4 - Tracao x t
figure(4);
plot(t, T, 'r-', 'LineWidth', 1.3);
title('Gráfico 4 - Tração x t', 'FontName', 'Times', 'FontSize', 12)
xlabel('t, (s)', 'FontName', 'Times', 'FontSize', 12)
ylabel('Tração, (N)', 'FontName', 'Times', 'FontSize', 12)
grid on;

## Grafico 5 - Evolucao da Frequencia
figure(5);
plot(t, freq, 'r-', 'LineWidth', 1.3);
title('Gráfico 5 - Frequência x t', 'FontName', 'Times', 'FontSize', 12)
xlabel('t, (s)', 'FontName', 'Times', 'FontSize', 12)
ylabel('Frequência, (1/s)', 'FontName', 'Times', 'FontSize', 12)
grid on;

