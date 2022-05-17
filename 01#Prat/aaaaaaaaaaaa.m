m = 180 + 89;
g = 9.81;
d = 0.2;
K = 10000;
h = sqrt(0.5*0.5 - 0.2*0.2);

x = [0:.01:.5];

myfun = @(u, m, g, K, d, h) (2 * K * (sqrt((d^2 + h^2)./(d^2 + (h - x).^2) - 1) .* ((h./u - 1))));

kef = @(x) myfun(x, m, g, K, d, h);

figure(1), h1 = plot(x, kef(x)/1000);
set(h1, 'LineWidth', 2);

grid on;
