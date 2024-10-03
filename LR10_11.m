Q = [5 2 3 12 5; 10 6 3 5 13; 11 8 7 5 8; 8 8 12 10 9; 6 9 10 5 2];
confines = ["Q>8", "Q>=10", "Q<12", "7<=Q<=15", "Q<6"];
priorities = [5, 3, 2, 1, 4];

[priorities, order] = sort(priorities);
confines = confines(order);
for p = 1:length(priorities)
    disp(['<strong> Stage ' num2str(p) ':</strong>']);
    disp(Q);
    
    feasible_set = [];
    for i = 1:size(Q, 2)
        Qk = Q(order(p), i);
        if eval(strrep(confines(p), 'Q', num2str(Qk)))
            feasible_set = [feasible_set, i];
        end
    end
    
    Q = Q(:, feasible_set);
    
    if isempty(Q)
        disp('<strong> No optimal solution </strong>');
        return;
    end
end

disp('<strong> Pareto-optimal set of solutions: </strong>');
disp(Q);
