%% Variáveis do Problema;

m = 180 + 89;
g = 9.81;
d = 0.2;
K = 10000;
h = sqrt(0.5*0.5 - 0.2*0.2);
u = [0:.001:h];

%% Determinação da função do Problema

fun = @(u, m, g, K, d, h) (2 * K * (sqrt((d^2 + h^2)./(d^2 + (h - u).^2)) - 1) .* (((h./u) - 1)));

kef = @(u) fun(u, m, g, K, d, h);

%% Pontos de Equilíbrio
u_eq = [0.1886, 0.3468];

k_eq = kef(u_eq)

%% Plot do Gráfico

fig = figure();
plot(u, kef(u)/1000, 'r-', 'LineWidth', 1.5);
hold on;
plot(u_eq, kef(u_eq)/1000, '.', 'MarkerSize', 13);

title('Gráfico 2 - k efetivo x Deslocamento', 'FontName', 'Times', 'FontSize', 12);
xlabel('Deslocamento, u (m)', 'FontName', 'Times', 'FontSize', 12);
ylabel('k efetivo, k_{ef} (kN/m)', 'FontName', 'Times', 'FontSize', 12);

grid on;

