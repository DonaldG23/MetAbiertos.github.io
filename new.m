clc; clear; close all;

% Definimos la función y su derivada
f = @(x) exp(-x) - x;
df = @(x) -exp(-x) - 1;

tol = 1e-6;
x0 = 0;
max_iter = 100;

%% Método de Punto Fijo
g = @(x) exp(-x); % Se despeja x de f(x) = 0
x = x0;
iter = 0;

fprintf('Metodo de Punto Fijo:\n');
while true
    x_new = g(x);
    iter = iter + 1;
    fprintf('Iter %d: x = %.8f\n', iter, x_new);
    if abs(x_new - x) < tol || iter >= max_iter
        break;
    end
    x = x_new;
end
fprintf('Solucion en Punto Fijo: x = %.8f en %d iteraciones\n\n', x_new, iter);

%% Método de Newton-Raphson
x = x0;
iter = 0;

fprintf('Metodo de Newton-Raphson:\n');
while true
    x_new = x - f(x)/df(x);
    iter = iter + 1;
    fprintf('Iter %d: x = %.8f\n', iter, x_new);
    if abs(x_new - x) < tol || iter >= max_iter
        break;
    end
    x = x_new;
end
fprintf('Solucion en Newton-Raphson: x = %.8f en %d iteraciones\n', x_new, iter);
