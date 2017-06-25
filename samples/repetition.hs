nums :: [Integer]
nums = filter ((== 0) . (`mod` 5)) $ map (^ 2) [1 ..]

headTail :: [a] -> Maybe (a, [a])
headTail (x : xs) = Just (x, xs)
headTail [] = Nothing

multiplied :: [Integer]
multiplied =
	(`concatMap` [1, 2, 3]) $ \x ->
	(`concatMap` [4, 5, 6]) $ \y ->
	(`map` [7, 8]) $ \z -> x * y * z
