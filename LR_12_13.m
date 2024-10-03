% Вхідні дані
Q1_values = [1 3 2];
Q2_values = [3 1 2];
lambda_values_simple = [0.333 0.667]; % ваги за простим ранжуванням

% Обчислення глобального критерію за методом простого ранжування
Q_global_simple = lambda_values_simple(1) * Q1_values + lambda_values_simple(2) * Q2_values;

% Виведення результатів
disp('Глобальний критерій за методом простого ранжування:');
disp(Q_global_simple);

% Визначення найкращої альтернативи за методом простого ранжування
[~, best_alternative_simple] = max(Q_global_simple);
disp(['Найкраща альтернатива за методом простого ранжування: E', num2str(best_alternative_simple)]);

% Обчислення глобального критерію за пропорційним методом
lambda_values_proportional = [0.4 0.6]; % ваги за пропорційним методом
Q_global_proportional = lambda_values_proportional(1) * Q1_values + lambda_values_proportional(2) * Q2_values;

% Виведення результатів
disp('Глобальний критерій за пропорційним методом:');
disp(Q_global_proportional);

% Визначення найкращої альтернативи за пропорційним методом
[~, best_alternative_proportional] = max(Q_global_proportional);
disp(['Найкраща альтернатива за пропорційним методом: E', num2str(best_alternative_proportional)]);
