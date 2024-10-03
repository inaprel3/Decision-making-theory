% Векторні оцінки альтернатив
Q_E1 = [5, 10, 11, 8];
Q_E2 = [2, 6, 8, 8];
Q_E3 = [4, 9, 9, 4];
Q_E4 = [3, 3, 7, 12];
Q_E5 = [6, 3, 10, 6];

alternatives = {Q_E1, Q_E2, Q_E3, Q_E4, Q_E5};
num_alternatives = numel(alternatives);

% Порівняння всіх пар альтернатив
for i = 1:num_alternatives
    for j = i+1:num_alternatives
        result = zeros(1, 4);

        for k = 1:4
            if contains('max', 'max')
                result(k) = alternatives{i}(k) >= alternatives{j}(k);
            elseif contains('min', 'min')
                result(k) = alternatives{i}(k) <= alternatives{j}(k);
            end
        end

        fprintf('\nE%d vs E%d:\n', i, j);
        fprintf('Q1: %d %s %d\n', alternatives{i}(1), char(8805), alternatives{j}(1));
        fprintf('Q2: %d %s %d\n', alternatives{i}(2), char(8805), alternatives{j}(2));
        fprintf('Q3: %d %s %d\n', alternatives{i}(3), char(8804), alternatives{j}(3));
        fprintf('Q4: %d %s %d\n', alternatives{i}(4), char(8805), alternatives{j}(4));

        % Виправлення помилки в результатах порівнянь
        result(3) = ~result(3);

        fprintf('Результат: (%d, %d, %d, %d)\n', result(1), result(2), result(3), result(4));
    end
end
