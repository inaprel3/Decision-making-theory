% EXAMPLE 1
Задамо значення параметру A
A_values = [33, 43, 53, 63, 73];
% Створимо фігуру для графіків
figure;
% Пройдимося по різним значенням A
for i = 1:length(A_values)
    A = A_values(i);
    % Створимо вектор значень x_2
    x2 = linspace(0, 160, 20); % Від 0 до 160 з 20 кроків
    % Обчислимо відповідні значення x_1 за рівнянням x_1=2A-x_2
    x1 = 2 * A - x2;
    % Побудуємо лінію переваги
    plot(x2, x1, 'DisplayName', sprintf('A = %d', A));
    hold on;
end
% Додамо функцію легенди та підписи вісей
legend;
xlabel('x_2');
ylabel('x_1');
title('Функція переваги: x_1 = 2A - x_2');
% Встановимо обмеження на вісі x та y для зручності
xlim([0, 160]);
ylim([0, 160]);
% Відобразимо сітку для легшого аналізу
grid on;
% Збережемо графік в зображення
% saveas(gcf, 'функція_переваги.png');



% EXAMPLE 2
% Задаємо значення параметру А
A_values = [48];
% Ініціалізуємо матриці для зберігання x1 і x2 значень
x1_values = zeros(100, length(A_values));
x2_values = zeros(100, length(A_values));
% Перебираємо значення параметру А
for i = 1:length(A_values)
    A = A_values(i);
    % Генеруємо значення x2 в діапазоні від 0 до 2*A з кроком 100 точок
    x2 = linspace(0, 2*A, 100);
    % Обчислюємо відповідні значення x1
    x1 = 2*A - x2;
    % Зберігаємо x1 і x2 відповідно до значення параметру А
    x1_values(:, i) = x1;
    x2_values(:, i) = x2;
end
% Координати РТ (Робочої Точки)
RT_x1 = 48;
RT_x2 = 48;
% Створюємо фігуру для графіків
figure;
% Графік нейтральної функції переваги для всіх значень А
plot(x1_values, x2_values, 'Color', 'black');
xlim([0 120]);
ylim([0 120]);
hold on;
% Відображення РТ на графіку
scatter(RT_x1, RT_x2, 100, 'yellow', 'filled', 's', 'MarkerEdgeColor', 'black');
text(RT_x1, RT_x2, 'РТ', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
% Додавання підписів та заголовка графіку
xlabel('x1');
ylabel('x2');
title({'Функції переваги нейтральної, песимістичної та оптимістичної позицій ЛПР'}, 'FontSize', 10);
% Відображення легенди
legend('A=48', 'Location', 'NorthEast');
grid on;
% Задаємо коефіцієнти для побудови парабол
k1 = 0.005; % Коефіцієнт песимістичної параболи
k2 = -0.005; % Коефіцієнт оптимістичної параболи
% Діапазон значень x1
x1_range = -96:96;
% Обчислення значень x2 для песимістичної і оптимістичної парабол
x2_pessimistic = k1 * x1_range.^2;
x2_optimistic = k2 * x1_range.^2;
% Перетворення координат для песимістичної параболи (поворот на 45 градусів)
x1_pessimistic_rotated = x2_pessimistic * cosd(45) - x1_range * sind(45) + 48;
x2_pessimistic_rotated = x2_pessimistic * cosd(45) + x1_range * sind(45) + 48;
% Перетворення координат для оптимістичної параболи (поворот на 45 градусів)
x1_optimistic_rotated = x2_optimistic * cosd(45) - x1_range * sind(45) + 48;
x2_optimistic_rotated = x2_optimistic * cosd(45) + x1_range * sind(45) + 48;
% Додавання графіків песимістичної та оптимістичної парабол
plot(x1_pessimistic_rotated, x2_pessimistic_rotated, 'LineStyle', '--', 'Color', 'blue'); 
plot(x1_optimistic_rotated, x2_optimistic_rotated, 'LineStyle', '--', 'Color', 'red'); 
% Додавання легенди для песимістичної та оптимістичної парабол
legend('A=48', 'РТ','Песимістична позиція', 'Оптимістична позиція', 'Location', 'NorthEast');



% EXAMPLE 3
% Дані для поля корисності рішень
x = [11, 7, 17, 41, 55, 35, 52, 43, 31, 22, 26, 50, 55, 54, 60, 47, 30, 30, 12, 15];  
y = [28, 43, 64, 46, 34, 16, 26, 26, 76, 53, 29, 40, 50, 10, 15, 66, 60, 50, 17, 14];  
% Координати РТ (Робочої Точки)
RT_x1 = 40;
RT_x2 = 40;
% Створюємо фігуру для графіків
figure;
% Графік поля корисності рішень
scatter(x,y,'filled'); 
xlabel('x1'); 
ylabel('x2'); 
title('Поле корисності рішень'); 
% Задаємо значення параметру А
A_values = [40];
% Ініціалізуємо матриці для зберігання x1 і x2 значень
x1_values = zeros(100, length(A_values));
x2_values = zeros(100, length(A_values));
% Перебираємо значення параметру А
for i = 1:length(A_values)
    A = A_values(i);
    % Генеруємо значення x2 в діапазоні від 0 до 2*A з кроком 100 точок
    x2 = linspace(0, 2*A, 100);
    % Обчислюємо відповідні значення x1
    x1 = 2*A - x2;
    % Зберігаємо x1 і x2 відповідно до значення параметру А
    x1_values(:, i) = x1;
    x2_values(:, i) = x2;
end
% Графік нейтральної функції переваги для всіх значень А
plot(x1_values, x2_values, 'Color', 'black');
xlim([0 100]);
ylim([0 100]);
hold on;
% Відображення РТ на графіку
scatter(RT_x1, RT_x2, 100, 'yellow', 'filled', 's', 'MarkerEdgeColor', 'black');
text(RT_x1, RT_x2, 'РТ', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
% Додавання підписів та заголовка графіку
xlabel('x1');
ylabel('x2');
title('Функції переваги нейтральної, песимістичної та оптимістичної позицій ЛПР');
% Відображення легенди
legend('A=40', 'Location', 'NorthEast');
grid on;
% Задаємо коефіцієнти для побудови парабол
k1 = 0.005; % Коефіцієнт песимістичної параболи
k2 = -0.005; % Коефіцієнт оптимістичної параболи
% Діапазон значень x1
x1_range = -80:80;
% Обчислення значень x2 для песимістичної і оптимістичної парабол
x2_pessimistic = k1 * x1_range.^2;
x2_optimistic = k2 * x1_range.^2;
% Перетворення координат для песимістичної параболи (поворот на 45 градусів)
x1_pessimistic_rotated = x2_pessimistic * cosd(45) - x1_range * sind(45) + 40;
x2_pessimistic_rotated = x2_pessimistic * cosd(45) + x1_range * sind(45) + 40;
% Перетворення координат для оптимістичної параболи (поворот на 45 градусів)
x1_optimistic_rotated = x2_optimistic * cosd(45) - x1_range * sind(45) + 40;
x2_optimistic_rotated = x2_optimistic * cosd(45) + x1_range * sind(45) + 40;
% Додавання графіків песимістичної та оптимістичної парабол
plot(x1_pessimistic_rotated, x2_pessimistic_rotated, 'LineStyle', '--', 'Color', 'blue'); 
plot(x1_optimistic_rotated, x2_optimistic_rotated, 'LineStyle', '--', 'Color', 'red'); 
% Додавання легенди для песимістичної та оптимістичної парабол
legend('A=40', 'РТ','Песимістична позиція', 'Оптимістична позиція', 'Location', 'NorthEast');
% Додавання альтернативних рішень (сині точки)
scatter(x, y, 20, 'blue', 'filled');
numPoints = numel(x);
for i = 1:numPoints
    label = sprintf('E%d', i + 22); % Додамо 22 для зміни відліку з Е23 
    text(x(i), y(i), label, 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
end
x = [x, 40]; 
y = [y, 40]; 
hold on; 
x_line = [40, 40]; % Координати по x   
y_line = [0, 80]; % Від найменшого до найбільшого y   
plot(x_line, y_line, 'k--'); % 'k--' - штрихована лінія чорного кольору   
% Додавання штрихованої горизонтальної лінії по y = 40   
y_line_horizontal = [40, 40]; % Координати по y   
x_line_horizontal = [0, 70]; % Від найменшого до найбільшого x   
plot(x_line_horizontal, y_line_horizontal, 'k--'); % 'r--' - штрихована лінія червоного кольору   
hold on;   
x_line1 = [7, 7]; % Координати по x   
y_line1 = [10, 76]; % Координати по y   
plot(x_line1, y_line1, 'k-'); % 'k-' - лінія чорним коліром   
x_line2 = [7, 60]; % Координати по x   
y_line2 = [10, 10]; % Координати по y   
plot(x_line2, y_line2, 'k-');  
x_line3 = [60, 60]; % Координати по x   
y_line3 = [10, 76]; % Координати по y   
plot(x_line3, y_line3, 'k-');  
x_line4 = [7, 60]; % Координати по x   
y_line4 = [76, 76]; % Координати по y   
plot(x_line4, y_line4, 'k-');
