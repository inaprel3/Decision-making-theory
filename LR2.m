x = [11, 7, 17, 41, 55, 35, 52, 43, 31, 22, 26, 50, 55, 54, 60, 47, 30, 30, 12, 15];  
y = [28, 43, 64, 46, 34, 16, 26, 26, 76, 53, 29, 40, 50, 10, 15, 66, 60, 50, 17, 14];  
scatter(x,y,'filled'); 
figure('Color', [0.8 1 0.8]); % Задайте світло-зелений колір фону (R,G,B); 
scatter(x,y,'filled'); 
xlabel('F1'); 
ylabel('F2'); 
title('Поле корисності рішень'); 
numPoints = numel(x);for i = 1:numPoints
    label = sprintf('E%d', i + 22); % Додайте 22 для зміни відліку з Е23 
 text(x(i), y(i), label, 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right'); 
end 
x = [x, 40]; 
y = [y, 40]; 
hold on; 
% Додайте червону точку "РТ" (робоча точка)
scatter(40, 40, 'Marker', 's', 'MarkerEdgeColor', 'red', 'MarkerFaceColor', 'red'); 
text(40, 40, 'РТ', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right'); 
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
