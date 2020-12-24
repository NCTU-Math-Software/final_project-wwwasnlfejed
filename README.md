# final project : Harmonic series

+ input : 大於等於0的實數

+ output : N 滿足 S(N+1) > X > S(N)，其中S(N)為harmonic series

## 作法

1. 檢查 input X 的值的範圍，如果小於0，則讓使用者重新輸入。

2. 給定數列和及項數的初始值。

3. 判斷是否例外情況 : 

   1. 當 X < 1 時，由於級數和最小值為 1，所以找不到符合條件的 N。
   
   2. 當 X = { 1, 1.5, 2.45 } 時，會有 N 使得 S(N) = X，所以找不到符合條件的 N。 (註1.)

4. 進入迴圈計算，此時有兩種情況 :

   1. 當 X < 級數和，則離開迴圈並輸出結果訊息。
   
   2. 碰到 machine epsilon，則跳出迴圈，因為無法得到更大的級數和。
   
## 附註

1. 當 N > 6 時，S(N) 必不為有限小數 :  

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
   
   重複此方法，我們可以證明 當 N > 6 時，S(N) 必不為有限小數。
   
   
   
