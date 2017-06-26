sumN :: Integer -> Integer
sumN n = sum [1 .. n]

sumNot3N :: Integer -> Integer
sumNot3N n = sum $ filter ((/= 0) . (`mod` 3)) [1 .. n]

sumMod5N :: Integer -> Integer
sumMod5N n = sum $ map (`mod` 5) [1 .. n]

nums :: [Integer]
nums = filter ((== 0) . (`mod` 5)) $ map (^ 2) [1 ..]

headTail :: [a] -> Maybe (a, [a])
headTail (x : xs) = Just (x, xs)
headTail [] = Nothing

multiplied :: [Integer]
multiplied =
	(`concatMap` [1, 2, 3]) $ \x ->
	(`concatMap` [4, 5, 6]) $ \y ->
	(`concatMap` [7, 8]) $ \z -> [x * y * z]

multipliedCmp :: [Integer]
multipliedCmp = [ x * y * z | x <- [1, 2, 3], y <- [4, 5, 6], z <- [7, 8] ]
