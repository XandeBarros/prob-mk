%% Variáveis do Problema;

m = 180 + 89;
g = 9.81;
d = 0.2;
K = 10000;
h = sqrt(0.5*0.5 - 0.2*0.2);
u = [0:.01:h];

%% Determinação da função do Problema
fun_u = @(x, m, g, K, d, h) (2 * K * (sqrt((d^2 + h^2)./(d^2 + (h - x).^2)) - 1).*(h - x) - m * g);
f = @(x) fun_u(x, m, g, K, d, h);

%%Raízes da Função do Problema

u_eq = [fzero(f, -1000), fzero(f, 0.4)]

fig = figure();

plot(u, f(u)/1000, 'r-', 'LineWidth', 1.5);
hold on;
plot(u_eq, f(u_eq)/1000, '.', 'MarkerSize', 13);
title('Gráfico 1 - Força Resultante x U', 'FontName', 'Times', 'FontSize', 12)
xlabel('Deslocamento, u (m)', 'FontName', 'Times', 'FontSize', 12)
ylabel('Força Resultante, F (kN)', 'FontName', 'Times', 'FontSize', 12)

legend('Função', 'Zeros', 'Location', 'northwest')

grid on;

