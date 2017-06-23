myConst :: a -> b -> a
myConst x _ = x

(.$.) :: (a -> b) -> a -> b
f .$. x = f x

bmi :: Double -> Double -> Double
bmi h w = w / (h / 100) ^ 2

bmiTaro :: Double -> Double
bmiTaro w = bmi 170 w

bmiTaro' :: Double -> Double
bmiTaro' = bmi 170

fun :: Integer -> Integer
fun n = (n + 3) * 2

fun2 :: Integer -> Integer
fun2 n = (* 2) ((+ 3) n)

fun3 :: Integer -> Integer
fun3 = (* 2) . (+ 3)
