sumN :: Integer -> Integer
sumN 1 = 1
sumN n = sumN (n - 1) + n

type Coin = Integer
type Amount = Integer
type Count = Integer

cases :: [Coin] -> Amount -> Count
cases _ am | am < 0 = 0
cases [] am | am /= 0 = 0
cases _ 0 = 1
cases ca@(c : cs) am = cases ca (am - c) + cases cs am

coins :: [Coin]
coins = [100, 50, 10, 5, 1]

enumerateFromTo :: Integer -> Integer -> [Integer]
enumerateFromTo f t
	| f > t = []
	| otherwise = f : enumerateFromTo (f + 1) t

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter _ [] = []
myFilter p (x : xs)
	| p x = x : myFilter p xs
	| otherwise = myFilter p xs

myMap :: (a -> b) -> [a] -> [b]
myMap _ [] = []
myMap f (x : xs) = f x : myMap f xs

mySum :: [Integer] -> Integer
mySum [] = 0
mySum (x : xs) = x + mySum xs
