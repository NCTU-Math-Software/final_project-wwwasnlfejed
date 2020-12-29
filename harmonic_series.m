%輸入一實數 X 大於等於0，找到 N 滿足 S(N+1) > X > S(N)，其中 S(N) 為harmonic series
%input : 5
%output : 當 N = 82 時，級數之和會小於輸入值；當 N = 83 時，級數之和會大於輸入值
%
function harmonic_series(X)
    format long;
    
%設定級數與項數初始值
    S0 = 0;
    S1 = 0;   
    item = 0;
    cond = 0;
    dif = 5*10^-16;
    euler = 0.577215664901532;
    rate =  2.30258509299405;
    decade = 0;

%選擇計算方法
while ( X < 0 || X >= 25 )
    %檢查輸入值是否在範圍內
    if X < 0
        disp('輸入值超出範圍，必須為大於等於 0 之實數。\n');
    %告知使用者約略之時間，是否使用 euler constant
    elseif ( X >= 25 && X < 711 )
        disp('當輸入值大於約 25 之後，計算時間會超過 1 分鐘');
        disp('所以會改以使用 euler constant 之定義來計算');
        temp = input('如果想更改輸入值，請輸入 1 ;想繼續計算則輸入 0 \n');     
        if temp == 0
            cond = 1;
            break
        end
    %是否使用 divergence rate 計算
    elseif X >= 711
        disp('當輸入值大於約 711 之後，項數會超過 10^308 項');
        disp('此項數之數值接近 matlab 所能表現的最大數值，所以需要以 divergence rate 計算 ');
        disp('此方法只能以 10 的次方為區間，找出在哪個區間內會得到大於輸入值之項數 ');
        temp = input('如果想更改輸入值，請輸入 1 ;想繼續計算則輸入 0 \n');     
        if temp == 0
            cond = 2;
            break
        end
    end    
    X = input('請重新輸入想計算的 X \n');
end

%進行級數和計算
%當 X < 1 時，找不到 N 使得 X > S_N
if X < 1
    disp('沒有 N 可以滿足條件');      
% X = S_N 的三種情況    
elseif X == 1
    disp(['當 N = 1 時，級數和 S = X ，故無法得到符合條件之 N']);
elseif X == 1.5
    disp(['當 N = 2 時，級數和 S = X ，故無法得到符合條件之 N']);
elseif X == 2.45
    disp(['當 N = 6 時，級數和 S = X ，故無法得到符合條件之 N']);
    
%當 X > 1 時
else     
    %迴圈計算
    if cond == 0
        while X > S1
            S0 = S1;
            item = item + 1;
            S1 = S0 + 1/item; 
            %碰到machine epsilon則跳出
            if (S0 + 1/item) == S0
                break
            %當輸入值為分數時，以誤差值判斷
            elseif abs(S1 - X) <= dif
                break;
            end
        end       
        %迴圈計算之輸出 
        %當輸入值為分數時，以誤差值判斷
        if abs(S1 - X) <= dif
            disp(['當 N = ' num2str(item) ' 時，級數和 S = X ，故無法得到符合條件之 N']);
        %因為machine epsilon，所以無法得到符合條件之 N
        elseif X > S1
            disp('輸入值過大，因為 machine epsilon 的限制，無法找到 N 使得級數和大於輸入值') 
        %輸出找到符合條件之 N
        else
            disp(['當 N = ' num2str(item-1) ' 時，級數之和會小於輸入值；當 N = ' num2str(item) ' 時，級數之和會大於輸入值'] );
            disp(['到第 ' num2str(item-1) ' 項之和為 ']);
            disp(S0);
            disp(['到第 ' num2str(item) ' 項之和為']);
            disp(S1); 
        end
        
    %euler constant 計算
    elseif cond == 1
        item = exp( X - euler );        
        disp('使用 euler constant 之定義，我們可以得到項數之估計為');
        disp(item);
        
    %divergence rate 計算    
    elseif cond == 2
        decade = fix(( X - 23.6030665948420 ) / rate + 10);
        disp('如前面之說明，只能估計項數所在之以 10 的次方為單位之區間');
        disp(['項數介於區間 ' num2str(decade) ' 與區間 ' num2str(decade + 1) ' 之間']);
    end    
end
end
