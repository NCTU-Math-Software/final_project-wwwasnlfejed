%輸入一實數 X 大於等於0，找到 N 滿足 S(N+1) > X > S(N)，其中S(N)為harmonic series
%input : 5
%output : 當 N 為第 82 項時，級數之和會小於輸入值，且當 N 為第 83 項時，級數之和會大於輸入值
%
function test(X)
%檢查輸入值是否在範圍內
while X < 0
    X = input('輸入值超出範圍，請重新輸入\n');
end
%設定級數與項數初始值
S = 0;
item = 0;
%進行級數和計算
%當 X <= 1 時，找不到 N 使得 X > S_N
if X <= 1
    disp('沒有 N 可以滿足條件');
%當 X > 1 時
else 
    %迴圈計算
    while X > S
        item = item + 1;
        S = S + 1/item; 
        %碰到machine epsilon則跳出
        if 1.0 + 1/item == 1.0
            break
        end
    end
    %因為machine epsilon，所以無法得到符合條件之 N
    if X > S
        disp('輸入值過大，因為machine epsilon，無法找到 N 使得級數和大於輸入值') 
    %因為 X = S ，所以無法得到符合條件之 N
    elseif X == S
        disp(['當 N 為第 ' num2str(item) ' 項時 S = X ，故無法得到符合條件之 N']);
    %輸出找到符合條件之 N
    else
        disp(['當 N 為第 ' num2str(item-1) ' 項時，級數之和會小於輸入值，且當 N 為第 ' num2str(item) ' 項時，級數之和會大於輸入值'] );
    end
end
end
