main :: IO ()
main = interact $ unlines . take 3 . lines
