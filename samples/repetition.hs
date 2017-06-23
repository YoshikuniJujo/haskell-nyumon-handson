nums :: [Integer]
nums = filter ((== 0) . (`mod` 5)) $ map (^ 2) [1 ..]

headTail :: [a] -> Maybe (a, [a])
headTail (x : xs) = Just (x, xs)
headTail [] = Nothing
