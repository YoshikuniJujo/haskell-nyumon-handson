main :: IO ()
main = interact $ unlines . addSub 0 . lines

addSub :: Integer -> [String] -> [String]
addSub n0 (('+' : s) : ls) = show n : addSub n ls where n = n0 + read s
addSub n0 (('-' : s) : ls) = show n : addSub n ls where n = n0 - read s
addSub _ ("." : _) = ["Good-bye!"]
addSub _ [] = ["Good-bye!"]
addSub n0 (_ : ls) = addSub n0 ls
