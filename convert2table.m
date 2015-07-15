
function Xtable = convert2able(X)

% Written by: Filippo Amato, July 2015
% 
% This function adds Row and Column labels to a numeric matrix.
% The row labels are of the form 'R#' (e.g., R1, R2, ...). Analogously,
% for the columns the labels have the form 'Y#'.
%
    
Table = istable(X);

if Table == 1
    disp('ERROR!, Input is already a table');
    Xtable = [];
    return
end


[X_rows, X_cols] = size(X);

RowIndex = 1:1:X_rows;
RowIndex=RowIndex';
RowLabel = 'R';

for i=1:size(RowIndex,1)
    b = num2str(RowIndex(i));
    b = strcat(RowLabel,b);
    c = cellstr(b);
    RowNames(i) = c;
end

ColIndex = 1:1:X_cols;
ColIndex = ColIndex';
ColLabel = 'Y';

for i=1:size(ColIndex,1)
    b = num2str(ColIndex(i));
    b = strcat(ColLabel,b);
    c = cellstr(b);
    ColNames(i) = c;
end

Xtable = array2table(X, 'RowNames', RowNames, 'VariableNames', ColNames);
