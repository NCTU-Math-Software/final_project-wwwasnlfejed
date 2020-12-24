%輸入一實數 X 大於等於0，找到 N 滿足 S(N+1) > X > S(N)，其中S(N)為harmonic series
%input : 5
%output : 當 N 為第 82 項時，級數之和會小於輸入值，且當 N 為第 83 項時，級數之和會大於輸入值
%
function harmonic_series(X)
    X = input('請輸入想計算的 X \n');
%檢查輸入值是否在範圍內
while X < 0
    X = input('輸入值超出範圍，請重新輸入\n');
end
%設定級數與項數初始值
S0 = 0;
S1 = 0;
item = 0;
%進行級數和計算
%當 X <= 1 時，找不到 N 使得 X > S_N
if X < 1
    disp('沒有 N 可以滿足條件');
elseif X == 1
    disp(['當 N = 1 時，級數和 S = X ，故無法得到符合條件之 N']);
elseif X == 1.5
    disp(['當 N = 2 時，級數和 S = X ，故無法得到符合條件之 N']);
elseif X == 2.45
    disp(['當 N = 6 時，級數和 S = X ，故無法得到符合條件之 N']);
%當 X > 1 時
else 
    %迴圈計算
    while X > S1
        S0 = S1;
        item = item + 1;
        S1 = S0 + 1/item; 
        %碰到machine epsilon則跳出
        if 1.0 + 1/item == 1.0
            break
        end
    end
    %因為machine epsilon，所以無法得到符合條件之 N
    if X > S1
        disp('輸入值過大，因為 machine epsilon 的限制，無法找到 N 使得級數和大於輸入值') 
    %輸出找到符合條件之 N
    else
        disp(['當 N = ' num2str(item-1) ' 時，級數之和會小於輸入值；當 N = ' num2str(item) ' 時，級數之和會大於輸入值'] );
        disp(['到第 ' num2str(item-1) ' 項之和為 ' num2str(S0) '，到第 ' num2str(item) ' 項之和為 ' num2str(S1)]);
    end
end
end