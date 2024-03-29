# Harmonic series

## 問題
已知調和級數 S(N) 為發散級數，趨近於無窮大。  

試寫一函數，輸入值為 X，輸出值為 N 且滿足 :  
```
S(N+1) > X > S(N)
```

# Example

一般迴圈計算

![image](https://github.com/NCTU-Math-Software/final_project-wwwasnlfejed/blob/main/ex%201.png)

Euler constant計算

![image](https://github.com/NCTU-Math-Software/final_project-wwwasnlfejed/blob/main/ex%202.png)

divergence rate計算極大數值(1)

![image](https://github.com/NCTU-Math-Software/final_project-wwwasnlfejed/blob/main/ex%203.png)

divergence rate計算極大數值(2)

![image](https://github.com/NCTU-Math-Software/final_project-wwwasnlfejed/blob/main/ex%204.png)

級數值等於輸入值之判斷

![image](https://github.com/NCTU-Math-Software/final_project-wwwasnlfejed/blob/main/sp%201.png)

## 輸入 & 輸出
+ input : 大於等於0的實數

+ output : N 滿足 S(N+1) > X > S(N)，其中 S(N) 為harmonic series

## 作法 & 說明

1. 給定數列和及項數的初始值。


2. 檢查 input X 的值的範圍，如果小於0，則讓使用者重新輸入。


3. 根據輸入值範圍，選擇適當之計算方法 :  

   1. 當 x ∈ [ 0 , 25 ) 時，以迴圈一項一項連加計算。
   
   2. 當 x ∈ [ 25 , 711 ) 時 :  
     
      1. 當輸入值大於約 25 之後，計算時間會超過 1 分鐘。
      
      2. 當輸入值大於約 34 之後，由於 machine epsilon，無法得到更大之級數和。 (附註1)  
      
      基於此兩個理由，所以選擇使用 Euler's constant 之定義，來估計符合條件之 N。
   
   3. 當輸入值大於約 711 之後，項數會超過 10^308 項。  
      
      此數值約為 matlab 所能表現的最大數值，所以需要以 divergence rate 計算。 (附註2)  
      
      此方法只能以 10 的次方為區間，找出在哪個區間內會得到大於輸入值之項數。 
      

4. 判斷是否例外情況 : 

   1. 當 X < 1 時，由於級數和最小值為 1，所以找不到符合條件的 N。
   
   2. 當 ( N , X ) = { ( 1 , 1 ) , ( 2 , 1.5 ) , ( 6 , 2.45 ) } 時，會有 N 使得 S(N) = X，所以找不到符合條件的 N。 (附註3) 
   

5. 進入計算，有三種情況 :

   1. 以迴圈計算，直到級數和大於輸入值時，離開迴圈  
      
      由於輸入值可能為分數，而碰到循環小數之情況。  
      
      所以設一個足夠小之誤差值，小於此誤差值時則判斷為相等，跳出迴圈。  
      
   2. 以 Euler's constant 之定義計算
   
   3. 以 divergent rate 計算
   
   
6. 三種計算方法完成後，分別以各自之格式輸出。
              
   
## 附註

1. Euler's constant :

   1. 選擇之理由與時機 : 
   
      1. 由於 machine epsilon 的限制，當 N 增加到一定程度，1/N 被加進級數和時會沒有任何作用。  
         
         所以如果輸入值過大，會有找不到適當的 N 滿足條件的問題，而無法利用迴圈計算。  
         
      2. 由於迴圈計算是一項一項累加，所以花費的時間會隨著項數而倍數增加。
         
         我們知道調和級數遞增速度很緩慢，所以縱使輸入值只增加 1，所花費的時間也可能會多上許多。
         
         舉例來說，輸入值為 25 時需要約 1 分鐘，而 28 則需要 10 分鐘。
         
      綜上述，所以選擇在輸入值為 25 時，改使用 Euler's constant之定義計算。
      
   2. 可行性 :
   
      Euler's constant 的定義即為調和級數與自然對數的差值。  
      
      所以可以利用此定義來反推求得符合我們條件之項數值。
      
   3. 誤差來源 :
      
      1. 由於此方法計算過程需要取自然對數而有估計的產生，所以也會有誤差，且此誤差會隨著項數的增加而成長。
      
         在 N = 10^40 時，誤差約為 1.42 * 10^(-14)， N = 10^160 時，誤差約為 5.68 * 10^(-14)。  
         
      2. Euler's constant 至今仍不確定是否為有理數，近似值為 0.577215664901532。  
         
         由於是取近似值，所以在以此常數做計算時也會產生誤差。  
      
   4. 範圍 :
   
      1. 迴圈計算之範圍 : 
         
         我們知道 eps = 2^(-52)，所以可以估計以迴圈計算可得到的的範圍。  
         
         由於 S(N) 的值大於 1，所以 S(N) 會在 N = 2^(52+1) 前收斂。 (參考1)  
         
         因為此時的 1/N 足夠小，使得 S(N) + 1/N 不會四捨五入而增加。  
         
         由以上結果經過計算後得知，S(N) 大約會在 N = 2^48 時收斂。  
         
         所以可以利用 Euler's constant 計算得知以迴圈計算可得到的最大 S(N) 大約等於 33.84828。

      2. Euler's constant 之範圍 :
      
         由於 matlab 所支援最大實數約為 1.79769 * 10^308，所以使用 Euler's constant，輸入值也會有範圍限制。  
         
         此範圍即為項數的最大值只能到 1.79769 * 10^308，計算後可以得知輸入值範圍約為 711。
   

2. divergence rate : (參考2)

   1. 選擇之理由與時機 :   
      
      Euler's constant 之定義為調和級數與自然對數的差值，所以可以用來估計我們想要求的項數。  
      
      由於 matlab 所支援最大實數約為 1.79769 * 10^308。  

      當調和級數之項數接近此實數時，級數和介於 710 到 711 之間。  
   
      所以如果輸入值大於 711 時，就無法使用 Euler's constant，需要尋找其他方法。  
      
   2. 可行性 : 
   
      如果把調和級數之項數以 10 的次方為表示，即 N = 10^p。  
      
      根據計算，p 每增加 1，級數和約會增加 2.3026。  
      
      我們知道級數和在 N 極大時，成長速度極慢；也知道級數和為 711 時，N 非常大。
      
      所以可以在輸入值大於 711 時使用此方法。
      
      且因為此估計法是根據 N 的值對一常數做乘法計算，而不是對 N 取自然對數。  
      
      所以不會發生使用 Euler's constant 計算時，誤差會因為 N 的大小而變得過大的情況。
      
   3. 範圍 :
      
      由於是把項數表示成 10^p，對 p 做計算，所以範圍只會受到 p 值的限制。  
      
      如前面所述，matlab 只支援到 10^308，所以我們可以求得之最大項數為 10^(10^308)，即 p = 10^308。  
      
      但由於我們是以級數和做輸入值，所以實際上在到達上述限制前，會先碰到級數和最大值的限制。
      
      此時的 p 約為 7.81 * 10^307，所以可以知道輸入值的最大值約為 1.79769 * 10^308。  
   

3. S(N) 的值幾乎不為有限小數 :

   根據 [Bertrand–Chebyshev theorem](https://en.wikipedia.org/wiki/Bertrand%27s_postulate)，我們知道  
   ```
   當 N > 1 時，存在一個質數 p ，符合 N < p < 2N。
   ```
   當 N = 6 時，S(N) = 2.45  
   
   當 N = 7 時，很明顯的級數和不為有限小數。  
   
   且由於 7 為質數，下一個與 7 之和可能為有限小數的項為 14。  
   
   但由於上述之定理，我們知道 7 與 14 之間必有一質數 p，所以 N = [ 7, 14 ] 之 S(N) 必不為有限小數。
   
   我們取上述區間最大的質數 p1 = 13。  
   
   同樣地，下一個與 13 之和可能為有限小數的項為 26。  
   
   一樣根據定理，我們知道 13 與 26 之間必有一質數，所以 N = [ 7, 26 ] 之 S(N) 必不為有限小數。  
   
   再次取上述區間最大的質數 p2 = 23。  
   
   同樣地，下一個與 23 之和可能為有限小數的項為 46。  
   
   由於 23 為前一個區間的最大質數，所以根據定理，23 與 46 之間必有一質數 p3，且 26 < p3 < 47。  
   
   所以 N = [ 7, 46 ] 之 S(N) 必不為有限小數。
   
   重複此方法，我們可以證明   
   ```
   當 N > 6 時，S(N) 必不為有限小數。  
   ```
   也代表 
   ```  
   當輸入值 X > 2.45 時，不會有 N 使得 X = S(N)。
   ```

   
## 參考

1. [D. Malone. - TO WHAT DOES THE HARMONIC SERIES CONVERGE?](https://core.ac.uk/download/pdf/297018835.pdf)

2. [G. Miramontes, D.Miramontes, A. Moreno - An alternative strategy for harmonic numbers calculation and a numerical growth rate](https://www.researchgate.net/publication/344293598_An_alternative_strategy_for_harmonic_numbers_calculation_and_a_numerical_growth_rate)
   
