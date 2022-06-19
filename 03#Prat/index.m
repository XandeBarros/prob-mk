## Molas no sistema:

n = [1:10];

# Alexandre Barros de Araujo
# nUsp = 11802989
# N = 89

## Primeira Parte: Casos de duas Forcas na quinta e decima mola:

k = @(n) ((10 + (50 + 0.5*89)*e^(-0.2*n)));

mat_K = zeros(10);

for i = 1:10
  disp(k(i));
endfor

for i = 1:10
  mat_K(i, i) = (k(i) + k(i+1));

  if (i - 1) >= 1
    mat_K(i, i - 1) = -k(i);
  endif

  if (i + 1) <= 10
    mat_K(i, i + 1) = -k(i+1);
  endif

  mat_K(10, 10) = k(10);
endfor

mat_K;

F = zeros(10, 1); F(5, 1) = -50; F(10, 1) = 100;

u_part1 = mat_K\(F./1000)

## Segunda Parte: Deslocamento Forcado na Ultima mola

u_10 = 0.03;

F_2 = zeros(9, 1); F_2(9, 1) = u_10*k(10);

mat_K_2 = mat_K([1:9],[1:9]);

u_part2 = mat_K_2\F_2;

u_part2(10, 1) = u_10

## Terceira Parte: Plotagem dos Gráficos u_n x n

fig = figure(1);

plot(n, u_part1*100, '--b.', 'MarkerSize', 13);
hold on;
title('Gráfico 1 - u_n x n', 'FontName', 'Times', 'FontSize', 12)
xlabel('n', 'FontName', 'Times', 'FontSize', 12)
ylabel('Deslocamento, u (cm)', 'FontName', 'Times', 'FontSize', 12)
plot(n, u_part2*100, '--rs', 'MarkerSize', 3.9);
legend('Duas Forças', 'Deslocamento Forçado', 'Location', 'northwest')
hold off;
grid on;

